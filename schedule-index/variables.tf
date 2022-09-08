variable "name" {
  type        = string
  description = "The name of the scheduled action"
  default     = ""
}

variable "service_namespace" {
  type        = string
  description = "The namespace of the AWS service"
  default     = ""
}

variable "resource_id" {
  type        = string
  description = "The identifier of the resource associated with the scheduled action"
  default     = ""
}

variable "scalable_dimension" {
  type        = string
  description = "The scalable dimension"
  default     = ""
}

variable "autoscale_schedule_index" {
  type = list(object({
    schedule     = string
    min_capacity = number
    max_capacity = number
  }))
  description = "Provides an DynamoDB autoscaling scheduled action resource"
  default     = []
}
