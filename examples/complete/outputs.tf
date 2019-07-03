output "autoscaler_iam_role_id" {
  value       = module.dynamodb_autoscaler.autoscaler_iam_role_id
  description = "Autoscaler IAM Role ID"
}

output "autoscaler_iam_role_arn" {
  value       = module.dynamodb_autoscaler.autoscaler_iam_role_arn
  description = "Autoscaler IAM Role ARN"
}

output "appautoscaling_read_target_id" {
  value       = module.dynamodb_autoscaler.appautoscaling_read_target_id
  description = "Appautoscaling read target ID"
}

output "appautoscaling_read_target_index_id" {
  value       = module.dynamodb_autoscaler.appautoscaling_read_target_index_id
  description = "Appautoscaling read target index ID"
}

output "appautoscaling_write_target_id" {
  value       = module.dynamodb_autoscaler.appautoscaling_write_target_id
  description = "Appautoscaling write target ID"
}

output "appautoscaling_write_target_index_id" {
  value       = module.dynamodb_autoscaler.appautoscaling_write_target_index_id
  description = "Appautoscaling write target index ID"
}
