module "default_label" {
  source     = "git::https://github.com/cloudposse/terraform-null-label.git?ref=master"
  namespace  = var.namespace
  stage      = var.stage
  name       = var.name
  delimiter  = var.delimiter
  attributes = var.attributes
  tags       = var.tags
  enabled    = var.enabled
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    sid = ""

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["application-autoscaling.amazonaws.com"]
    }

    effect = "Allow"
  }
}

resource "aws_iam_role" "autoscaler" {
  count              = var.enabled == "true" ? 1 : 0
  name               = "${module.default_label.id}${var.delimiter}autoscaler"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = module.default_label.tags
}

data "aws_iam_policy_document" "autoscaler" {
  statement {
    sid = ""

    actions = [
      "dynamodb:DescribeTable",
      "dynamodb:UpdateTable",
    ]

    resources = [var.dynamodb_table_arn]

    effect = "Allow"
  }
}

resource "aws_iam_role_policy" "autoscaler" {
  count  = var.enabled == "true" ? 1 : 0
  name   = "${module.default_label.id}${var.delimiter}autoscaler${var.delimiter}dynamodb"
  role   = join("", aws_iam_role.autoscaler.*.id)
  policy = data.aws_iam_policy_document.autoscaler.json
}

data "aws_iam_policy_document" "autoscaler_cloudwatch" {
  statement {
    sid = ""

    actions = [
      "cloudwatch:PutMetricAlarm",
      "cloudwatch:DescribeAlarms",
      "cloudwatch:DeleteAlarms",
    ]

    resources = ["*"]

    effect = "Allow"
  }
}

resource "aws_iam_role_policy" "autoscaler_cloudwatch" {
  count  = var.enabled == "true" ? 1 : 0
  name   = "${module.default_label.id}${var.delimiter}autoscaler${var.delimiter}cloudwatch"
  role   = join("", aws_iam_role.autoscaler.*.id)
  policy = data.aws_iam_policy_document.autoscaler_cloudwatch.json
}

resource "aws_appautoscaling_target" "read_target" {
  count              = var.enabled == "true" ? 1 : 0
  max_capacity       = var.autoscale_max_read_capacity
  min_capacity       = var.autoscale_min_read_capacity
  resource_id        = "table/${var.dynamodb_table_name}"
  scalable_dimension = "dynamodb:table:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_target" "read_target_index" {
  count              = var.enabled == "true" ? length(var.dynamodb_indexes) : 0
  max_capacity       = var.autoscale_max_read_capacity
  min_capacity       = var.autoscale_min_read_capacity
  resource_id        = "table/${var.dynamodb_table_name}/index/${element(var.dynamodb_indexes, count.index)}"
  scalable_dimension = "dynamodb:index:ReadCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "read_policy" {
  count       = var.enabled == "true" ? 1 : 0
  name        = "DynamoDBReadCapacityUtilization:${join("", aws_appautoscaling_target.read_target.*.resource_id)}"
  policy_type = "TargetTrackingScaling"
  resource_id = join("", aws_appautoscaling_target.read_target.*.resource_id)
  scalable_dimension = join(
    "",
    aws_appautoscaling_target.read_target.*.scalable_dimension,
  )
  service_namespace = join(
    "",
    aws_appautoscaling_target.read_target.*.service_namespace,
  )

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = var.autoscale_read_target
  }
}

resource "aws_appautoscaling_policy" "read_policy_index" {
  count = var.enabled == "true" ? length(var.dynamodb_indexes) : 0
  name = "DynamoDBReadCapacityUtilization:${element(
    aws_appautoscaling_target.read_target_index.*.resource_id,
    count.index,
  )}"
  policy_type = "TargetTrackingScaling"
  resource_id = element(
    aws_appautoscaling_target.read_target_index.*.resource_id,
    count.index,
  )
  scalable_dimension = element(
    aws_appautoscaling_target.read_target_index.*.scalable_dimension,
    count.index,
  )
  service_namespace = element(
    aws_appautoscaling_target.read_target_index.*.service_namespace,
    count.index,
  )

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBReadCapacityUtilization"
    }

    target_value = var.autoscale_read_target
  }
}

resource "aws_appautoscaling_target" "write_target" {
  count              = var.enabled == "true" ? 1 : 0
  max_capacity       = var.autoscale_max_write_capacity
  min_capacity       = var.autoscale_min_write_capacity
  resource_id        = "table/${var.dynamodb_table_name}"
  scalable_dimension = "dynamodb:table:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_target" "write_target_index" {
  count              = var.enabled == "true" ? length(var.dynamodb_indexes) : 0
  max_capacity       = var.autoscale_max_write_capacity
  min_capacity       = var.autoscale_min_write_capacity
  resource_id        = "table/${var.dynamodb_table_name}/index/${element(var.dynamodb_indexes, count.index)}"
  scalable_dimension = "dynamodb:index:WriteCapacityUnits"
  service_namespace  = "dynamodb"
}

resource "aws_appautoscaling_policy" "write_policy" {
  count       = var.enabled == "true" ? 1 : 0
  name        = "DynamoDBWriteCapacityUtilization:${join("", aws_appautoscaling_target.write_target.*.resource_id)}"
  policy_type = "TargetTrackingScaling"
  resource_id = join("", aws_appautoscaling_target.write_target.*.resource_id)
  scalable_dimension = join(
    "",
    aws_appautoscaling_target.write_target.*.scalable_dimension,
  )
  service_namespace = join(
    "",
    aws_appautoscaling_target.write_target.*.service_namespace,
  )

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = var.autoscale_write_target
  }
}

resource "aws_appautoscaling_policy" "write_policy_index" {
  count = var.enabled == "true" ? length(var.dynamodb_indexes) : 0
  name = "DynamoDBWriteCapacityUtilization:${element(
    aws_appautoscaling_target.write_target_index.*.resource_id,
    count.index,
  )}"
  policy_type = "TargetTrackingScaling"
  resource_id = element(
    aws_appautoscaling_target.write_target_index.*.resource_id,
    count.index,
  )
  scalable_dimension = element(
    aws_appautoscaling_target.write_target_index.*.scalable_dimension,
    count.index,
  )
  service_namespace = element(
    aws_appautoscaling_target.write_target_index.*.service_namespace,
    count.index,
  )

  target_tracking_scaling_policy_configuration {
    predefined_metric_specification {
      predefined_metric_type = "DynamoDBWriteCapacityUtilization"
    }

    target_value = var.autoscale_write_target
  }
}

