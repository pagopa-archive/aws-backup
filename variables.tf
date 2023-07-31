variable "backup_vault_kms_key_arn" {
  type        = string
  description = "The server-side encryption key that is used to protect your backups."
}

variable "backup_tag_key" {
  type        = string
  description = "The tag key used to identify resources for backup"
}

variable "backup_tag_value" {
  type        = string
  description = "The tag value used to identify resources for backup"
}

variable "backup_plan_name" {
  type        = string
  description = "The name of the backup plan"
}

variable "backup_rule_name" {
  type        = string
  description = "The name of the backup rule"
}


variable "backup_rule_shedule" {
  type        = string
  description = "CRON expression specifying when AWS Backup initiates a backup job."
  default     = null
}

variable "enable_continuous_backup" {
  type        = bool
  description = "Enable continuous backups for supported resources."
  default     = false
}

variable "start_window" {
  type        = number
  description = "The amount of time in minutes before beginning a backup."
  default     = 0
}

variable "completion_window" {
  type        = number
  description = "The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error."
  default     = 0
}


variable "cold_storage_after" {
  type        = number
  description = "Specifies the number of days after creation that a recovery point is moved to cold storage."
  default     = null
}

variable "delete_after" {
  type        = number
  description = "Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold_storage_after."

}

variable "backup_vault_name" {
  type        = string
  description = "The name of the backup vault"
}

variable "iam_role_name" {
  type        = string
  description = "Role that AWS Backup uses to authenticate when restoring and backing up the target resource."
  default     = "PPAAWSBackup"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}