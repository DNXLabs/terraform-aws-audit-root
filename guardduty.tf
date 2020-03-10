resource "aws_guardduty_detector" "master" {
  enable = var.guardduty
}

resource "aws_ssm_parameter" "guardduty_id" {
  count = var.guardduty ? 1 : 0
  name  = "/account/master/guardduty_id"
  type  = "String"
  value = aws_guardduty_detector.master.id
}
