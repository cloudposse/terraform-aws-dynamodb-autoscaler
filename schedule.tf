module "read_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  attributes = ["read"]

  context = module.this.context
}

module "write_label" {
  source  = "cloudposse/label/null"
  version = "0.25.0"

  attributes = ["write"]

  context = module.this.context
}

resource "aws_appautoscaling_scheduled_action" "read_schedule" {
  count = module.this.enabled && length(var.autoscale_read_schedule) > 0 ? length(var.autoscale_read_schedule) : 0

  name = "${module.read_label.id}-${count.index}"

  service_namespace  = join("", aws_appautoscaling_target.read_target.*.service_namespace)
  resource_id        = join("", aws_appautoscaling_target.read_target.*.resource_id)
  scalable_dimension = join("", aws_appautoscaling_target.read_target.*.scalable_dimension)

  schedule = lookup(var.autoscale_read_schedule[count.index], "schedule")

  scalable_target_action {
    min_capacity = lookup(var.autoscale_read_schedule[count.index], "min_capacity")
    max_capacity = lookup(var.autoscale_read_schedule[count.index], "max_capacity")
  }
}

module "read_schedule_index" {
  for_each = module.this.enabled && length(var.autoscale_read_schedule_index) > 0 ? toset(var.dynamodb_indexes) : toset([])
  source   = "./schedule-index"

  name = "${module.read_label.id}-${each.key}"

  resource_id        = aws_appautoscaling_target.read_target_index[each.key].resource_id
  scalable_dimension = aws_appautoscaling_target.read_target_index[each.key].scalable_dimension
  service_namespace  = aws_appautoscaling_target.read_target_index[each.key].service_namespace

  autoscale_schedule_index = var.autoscale_read_schedule_index
}

resource "aws_appautoscaling_scheduled_action" "write_schedule" {
  count = module.this.enabled && length(var.autoscale_write_schedule) > 0 ? length(var.autoscale_write_schedule) : 0

  name = "${module.write_label.id}-${count.index}"

  service_namespace  = join("", aws_appautoscaling_target.write_target.*.service_namespace)
  resource_id        = join("", aws_appautoscaling_target.write_target.*.resource_id)
  scalable_dimension = join("", aws_appautoscaling_target.write_target.*.scalable_dimension)

  schedule = lookup(var.autoscale_write_schedule[count.index], "schedule")

  scalable_target_action {
    min_capacity = lookup(var.autoscale_write_schedule[count.index], "min_capacity")
    max_capacity = lookup(var.autoscale_write_schedule[count.index], "max_capacity")
  }
}

module "write_schedule_index" {
  for_each = module.this.enabled && length(var.autoscale_write_schedule_index) > 0 ? toset(var.dynamodb_indexes) : toset([])
  source   = "./schedule-index"

  name = "${module.write_label.id}-${each.key}"

  resource_id        = aws_appautoscaling_target.write_target_index[each.key].resource_id
  scalable_dimension = aws_appautoscaling_target.write_target_index[each.key].scalable_dimension
  service_namespace  = aws_appautoscaling_target.write_target_index[each.key].service_namespace

  autoscale_schedule_index = var.autoscale_write_schedule_index
}
