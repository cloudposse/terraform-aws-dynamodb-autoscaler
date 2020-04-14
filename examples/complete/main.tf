provider "aws" {
  region = var.region
}

module "dynamodb_autoscaler" {
  source                       = "../../"
  namespace                    = var.namespace
  stage                        = var.stage
  name                         = var.name
  dynamodb_table_name          = ""
  autoscale_read_target        = var.autoscale_read_target
  autoscale_min_read_capacity  = var.autoscale_min_read_capacity
  autoscale_max_read_capacity  = var.autoscale_max_read_capacity
  autoscale_write_target       = var.autoscale_write_target
  autoscale_min_write_capacity = var.autoscale_min_write_capacity
  autoscale_max_write_capacity = var.autoscale_max_write_capacity
}
