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

variable "autoscale_write_target_index" {
  type        = number
  default     = null
  description = "The target value for DynamoDB write autoscaling of the index"
}

variable "autoscale_read_target_index" {
  type        = number
  default     = null
  description = "The target value for DynamoDB read autoscaling of the index"
}

variable "autoscale_min_read_capacity_index" {
  type        = number
  default     = null
  description = "DynamoDB autoscaling min read capacity of the index"
}

variable "autoscale_max_read_capacity_index" {
  type        = number
  default     = null
  description = "DynamoDB autoscaling max read capacity of the index"
}

variable "autoscale_min_write_capacity_index" {
  type        = number
  default     = null
  description = "DynamoDB autoscaling min write capacity of the index"
}

variable "autoscale_max_write_capacity_index" {
  type        = number
  default     = null
  description = "DynamoDB autoscaling max write capacity of the index"
}

variable "autoscale_read_schedule" {
  type = list(object({
    schedule     = string
    min_capacity = number
    max_capacity = number
  }))
  description = "Provides an DynamoDB autoscaling scheduled action resource"
  default     = []
}

variable "autoscale_read_schedule_index" {
  type = list(object({
    schedule     = string
    min_capacity = number
    max_capacity = number
  }))
  description = "Provides an DynamoDB autoscaling scheduled action resource for the index"
  default     = []
}

variable "autoscale_write_schedule" {
  type = list(object({
    schedule     = string
    min_capacity = number
    max_capacity = number
  }))
  description = "Provides an DynamoDB autoscaling scheduled action resource"
  default     = []
}

variable "autoscale_write_schedule_index" {
  type = list(object({
    schedule     = string
    min_capacity = number
    max_capacity = number
  }))
  description = "Provides an DynamoDB autoscaling scheduled action resource for the index"
  default     = []
}
