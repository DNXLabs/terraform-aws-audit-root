variable "org_name" {
  description = "Name for this organization (not actually used in API call)"
}

variable "cloudtrail" {
  default     = true
  description = "Enable/Disables cloudtrail"
}
variable "cloudtrail_log_group_retention_in_days" {
  description = "Days for log group retention"
  default     = 365
}

variable "s3_days_until_glacier" {
  default     = 90
  description = "How many days before transitioning files to Glacier"
}

variable "account_ids" {
  default     = []
  description = "AWS Account IDs under Auditing for the organization"
}

variable "organization_id" {
  description = "Organization ID for CloudTrail access"
}

variable "master_account_id" {
  description = "Master account ID"
}
