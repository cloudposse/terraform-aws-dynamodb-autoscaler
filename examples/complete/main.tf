provider "aws" {
  region = var.region
}

module "dynamodb_table" {
  source      = "cloudposse/dynamodb/aws"
  version     = "0.25.0"
  namespace   = var.namespace
  environment = var.environment
  stage       = var.stage
  name        = var.name
  attributes  = var.attributes
  tags        = var.tags

  hash_key  = "HashKey"
  range_key = "RangeKey"

  billing_mode      = "PROVISIONED"
  enable_autoscaler = false

  autoscale_min_read_capacity  = var.autoscale_min_read_capacity
  autoscale_max_read_capacity  = var.autoscale_max_read_capacity
  autoscale_min_write_capacity = var.autoscale_min_write_capacity
  autoscale_max_write_capacity = var.autoscale_max_write_capacity

  dynamodb_attributes = [
    {
      name = "DailyAverage"
      type = "N"
    },
    {
      name = "HighWater"
      type = "N"
    },
    {
      name = "Timestamp"
      type = "S"
    }
  ]

  local_secondary_index_map = [
    {
      name               = "TimestampSortIndex"
      range_key          = "Timestamp"
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    },
    {
      name               = "HighWaterIndex"
      range_key          = "Timestamp"
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    }
  ]

  global_secondary_index_map = [
    {
      name               = "DailyAverageIndex"
      hash_key           = "DailyAverage"
      range_key          = "HighWater"
      write_capacity     = 5
      read_capacity      = 5
      projection_type    = "INCLUDE"
      non_key_attributes = ["HashKey", "RangeKey"]
    }
  ]
}

module "dynamodb_autoscaler" {
  source = "../../"

  dynamodb_table_name          = module.dynamodb_table.table_name
  dynamodb_table_arn           = module.dynamodb_table.table_arn
  autoscale_read_target        = var.autoscale_read_target
  autoscale_min_read_capacity  = var.autoscale_min_read_capacity
  autoscale_max_read_capacity  = var.autoscale_max_read_capacity
  autoscale_write_target       = var.autoscale_write_target
  autoscale_min_write_capacity = var.autoscale_min_write_capacity
  autoscale_max_write_capacity = var.autoscale_max_write_capacity

  context = module.this.context
}
