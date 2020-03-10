resource "aws_cloudtrail" "audit" {
  count                 = var.cloudtrail ? 1 : 0
  name                  = "${var.name}-cloudtrail"
  s3_bucket_name        = aws_s3_bucket.cloudtrail[0].id
  is_multi_region_trail = true
  is_organization_trail = true
  kms_key_id            = aws_kms_key.cloudtrail[0].arn

  event_selector {
    read_write_type           = "All"
    include_management_events = true
  }

  cloud_watch_logs_group_arn = aws_cloudwatch_log_group.cloudtrail[0].arn
  cloud_watch_logs_role_arn  = aws_iam_role.cloudtrail_logs[0].arn

  lifecycle {
    ignore_changes = [event_selector]
  }
}

resource "aws_iam_role" "cloudtrail_logs" {
  count       = var.cloudtrail ? 1 : 0
  name_prefix = "cloudtrail_logs"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "cloudtrail.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "cloudwatch" {
  count       = var.cloudtrail ? 1 : 0
  name_prefix = "cloudtrail_logs"
  role        = aws_iam_role.cloudtrail_logs[0].id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AWSCloudTrailPutLogEvents20141101",
      "Effect": "Allow",
      "Action": [
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": [
        "*"
      ]
    }
  ]
}
EOF
}

resource "aws_cloudwatch_log_group" "cloudtrail" {
  count      = var.cloudtrail ? 1 : 0
  name       = "${var.name}-cloudtrail"
  kms_key_id = aws_kms_key.cloudtrail[0].arn
}

resource "aws_s3_bucket" "cloudtrail" {
  count         = var.cloudtrail ? 1 : 0
  bucket_prefix = "${var.name}-cloudtrail"

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        kms_master_key_id = aws_kms_key.cloudtrail[0].arn
        sse_algorithm     = "aws:kms"
      }
    }
  }
}

resource "aws_s3_bucket_policy" "cloudtrail" {
  count  = var.cloudtrail ? 1 : 0
  bucket = aws_s3_bucket.cloudtrail[0].id

  policy = <<POLICY
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "AWSCloudTrailAclCheck",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:GetBucketAcl",
            "Resource": "${aws_s3_bucket.cloudtrail[0].arn}"
        },
        {
            "Sid": "AWSCloudTrailWrite",
            "Effect": "Allow",
            "Principal": {
              "Service": "cloudtrail.amazonaws.com"
            },
            "Action": "s3:PutObject",
            "Resource": "${aws_s3_bucket.cloudtrail[0].arn}/*",
            "Condition": {
                "StringEquals": {
                    "s3:x-amz-acl": "bucket-owner-full-control"
                }
            }
        }
    ]
}
POLICY
}
