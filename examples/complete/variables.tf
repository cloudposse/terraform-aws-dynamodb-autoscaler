variable "region" {
  type        = string
  description = "AWS region"
}

variable "autoscale_write_target" {
  type        = number
  description = "The target value for DynamoDB write autoscaling"
}

variable "autoscale_read_target" {
  type        = number
  description = "The target value for DynamoDB read autoscaling"
}

variable "autoscale_min_read_capacity" {
  type        = number
  description = "DynamoDB autoscaling min read capacity"
}

variable "autoscale_max_read_capacity" {
  type        = number
  description = "DynamoDB autoscaling max read capacity"
}

variable "autoscale_min_write_capacity" {
  type        = number
  description = "DynamoDB autoscaling min write capacity"
}

variable "autoscale_max_write_capacity" {
  type        = number
  description = "DynamoDB autoscaling max write capacity"
}
