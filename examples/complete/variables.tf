variable "region" {
  type        = string
  description = "AWS region"
}

variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cp`)"
}

variable "environment" {
  type        = string
  default     = ""
  description = "Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT'"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `prod`, `dev`, `staging`, `infra`)"
}

variable "name" {
  type        = string
  description = "Name  (e.g. `app` or `cluster`)"
}

variable "attributes" {
  type        = list(string)
  default     = []
  description = "Additional attributes (e.g. `1`)"
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Additional tags (e.g. `map('BusinessUnit','XYZ')`"
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
