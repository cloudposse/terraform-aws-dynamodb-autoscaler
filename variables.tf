variable "name" {
  type        = string
  description = "Name  (e.g. `app` or `cluster`)"
}

variable "dynamodb_table_name" {
  type        = string
  description = "DynamoDB table name"
}

variable "dynamodb_table_arn" {
  type        = string
  description = "DynamoDB table ARN"
}

variable "dynamodb_indexes" {
  type        = list(string)
  description = "List of DynamoDB indexes"
  default     = []
}

variable "autoscale_write_target" {
  default     = 50
  description = "The target value for DynamoDB write autoscaling"
}

variable "autoscale_read_target" {
  default     = 50
  description = "The target value for DynamoDB read autoscaling"
}

variable "autoscale_min_read_capacity" {
  default     = 5
  description = "DynamoDB autoscaling min read capacity"
}

variable "autoscale_max_read_capacity" {
  default     = 20
  description = "DynamoDB autoscaling max read capacity"
}

variable "autoscale_min_write_capacity" {
  default     = 5
  description = "DynamoDB autoscaling min write capacity"
}

variable "autoscale_max_write_capacity" {
  default     = 20
  description = "DynamoDB autoscaling max write capacity"
}

variable "enabled" {
  description = "Set to false to prevent the module from creating any resources"
  default     = "true"
}

variable "aws_region" {
  description = "Region into which the resource will be created"
  default     = "eu-west-2"
}

