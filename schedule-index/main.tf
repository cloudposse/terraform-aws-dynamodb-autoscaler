resource "aws_appautoscaling_scheduled_action" "default" {
  for_each = { for index, read in var.autoscale_schedule_index : index => read }

  name = "${var.name}-${each.key}"

  resource_id        = var.resource_id
  scalable_dimension = var.scalable_dimension
  service_namespace  = var.service_namespace

  schedule = each.value.schedule

  scalable_target_action {
    min_capacity = each.value.min_capacity
    max_capacity = each.value.max_capacity
  }
}