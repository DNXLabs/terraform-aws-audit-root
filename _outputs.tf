output "guardduty_detector_id" {
  value       = try(aws_guardduty_detector.master.id, "")
  description = "GuardDuty Detector ID of master account"
}
