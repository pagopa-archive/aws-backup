resource "aws_backup_vault" "main" {
  name        = var.backup_vault_name
  kms_key_arn = var.backup_vault_kms_key_arn

  tags = var.tags
}


resource "aws_backup_plan" "main" {
  name = var.backup_plan_name

  rule {
    rule_name                = var.backup_rule_name
    target_vault_name        = aws_backup_vault.main.name
    schedule                 = var.backup_rule_shedule
    enable_continuous_backup = var.enable_continuous_backup
    start_window             = var.start_window
    completion_window        = var.completion_window

    lifecycle {
      cold_storage_after = var.cold_storage_after
      delete_after       = var.delete_after
    }
  }

  tags = var.tags
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["backup.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
resource "aws_iam_role" "main" {
  name               = var.iam_role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = var.tags
}

resource "aws_iam_role_policy_attachment" "main" {
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSBackupServiceRolePolicyForBackup"
  role       = aws_iam_role.main.name
}

resource "aws_backup_selection" "main" {
  iam_role_arn = aws_iam_role.main.arn
  name         = var.backup_rule_name
  plan_id      = aws_backup_plan.main.id

  selection_tag {
    type  = "STRINGEQUALS"
    key   = var.backup_tag_key
    value = var.backup_tag_value
  }
}