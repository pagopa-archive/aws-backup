## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_backup_plan.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_plan) | resource |
| [aws_backup_selection.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_selection) | resource |
| [aws_backup_vault.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/backup_vault) | resource |
| [aws_iam_role.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.main](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_policy_document.assume_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_backup_plan_name"></a> [backup\_plan\_name](#input\_backup\_plan\_name) | The name of the backup plan | `string` | n/a | yes |
| <a name="input_backup_rule_name"></a> [backup\_rule\_name](#input\_backup\_rule\_name) | The name of the backup rule | `string` | n/a | yes |
| <a name="input_backup_tag_key"></a> [backup\_tag\_key](#input\_backup\_tag\_key) | The tag key used to identify resources for backup | `string` | n/a | yes |
| <a name="input_backup_tag_value"></a> [backup\_tag\_value](#input\_backup\_tag\_value) | The tag value used to identify resources for backup | `string` | n/a | yes |
| <a name="input_backup_vault_kms_key_arn"></a> [backup\_vault\_kms\_key\_arn](#input\_backup\_vault\_kms\_key\_arn) | The server-side encryption key that is used to protect your backups. | `string` | n/a | yes |
| <a name="input_backup_vault_name"></a> [backup\_vault\_name](#input\_backup\_vault\_name) | The name of the backup vault | `string` | n/a | yes |
| <a name="input_delete_after"></a> [delete\_after](#input\_delete\_after) | Specifies the number of days after creation that a recovery point is deleted. Must be 90 days greater than cold\_storage\_after. | `number` | n/a | yes |
| <a name="input_backup_rule_shedule"></a> [backup\_rule\_shedule](#input\_backup\_rule\_shedule) | CRON expression specifying when AWS Backup initiates a backup job. | `string` | `null` | no |
| <a name="input_cold_storage_after"></a> [cold\_storage\_after](#input\_cold\_storage\_after) | Specifies the number of days after creation that a recovery point is moved to cold storage. | `number` | `null` | no |
| <a name="input_completion_window"></a> [completion\_window](#input\_completion\_window) | The amount of time in minutes AWS Backup attempts a backup before canceling the job and returning an error. | `number` | `0` | no |
| <a name="input_enable_continuous_backup"></a> [enable\_continuous\_backup](#input\_enable\_continuous\_backup) | Enable continuous backups for supported resources. | `bool` | `false` | no |
| <a name="input_iam_role_name"></a> [iam\_role\_name](#input\_iam\_role\_name) | Role that AWS Backup uses to authenticate when restoring and backing up the target resource. | `string` | `"PPAAWSBackup"` | no |
| <a name="input_start_window"></a> [start\_window](#input\_start\_window) | The amount of time in minutes before beginning a backup. | `number` | `0` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |

## Outputs

No outputs.
