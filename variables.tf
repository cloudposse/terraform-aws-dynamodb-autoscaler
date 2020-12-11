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
  type        = number
  default     = 50
  description = "The target value for DynamoDB write autoscaling"
}

variable "autoscale_read_target" {
  type        = number
  default     = 50
  description = "The target value for DynamoDB read autoscaling"
}

variable "autoscale_min_read_capacity" {
  type        = number
  default     = 5
  description = "DynamoDB autoscaling min read capacity"
}

variable "autoscale_max_read_capacity" {
  type        = number
  default     = 20
  description = "DynamoDB autoscaling max read capacity"
}

variable "autoscale_min_write_capacity" {
  type        = number
  default     = 5
  description = "DynamoDB autoscaling min write capacity"
}

variable "autoscale_max_write_capacity" {
  type        = number
  default     = 20
  description = "DynamoDB autoscaling max write capacity"
}
