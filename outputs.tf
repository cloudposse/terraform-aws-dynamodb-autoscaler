output "appautoscaling_read_policy_arn" {
  value       = join("", aws_appautoscaling_policy.read_policy.*.arn)
  description = "Appautoscaling read policy ARN"
}

output "appautoscaling_write_policy_arn" {
  value       = join("", aws_appautoscaling_policy.write_policy.*.arn)
  description = "Appautoscaling write policy ARN"
}