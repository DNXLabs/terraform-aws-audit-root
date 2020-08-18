# terraform-aws-audit-root

[![Lint Status](https://github.com/DNXLabs/terraform-aws-audit-root/workflows/Lint/badge.svg)](https://github.com/DNXLabs/terraform-aws-audit-root/actions)
[![LICENSE](https://img.shields.io/github/license/DNXLabs/terraform-aws-audit-root)](https://github.com/DNXLabs/terraform-aws-audit-root/blob/master/LICENSE)


This terraform module is an audit module to apply into root account (master)

In this module you have the option to :

- Enable or not cloudtrail
- Enable or not Guardduty
- Create a S3 bucket for cloudtrail logs
- Create IAM Roles and Policies for the Cloudtrail
- Create AWS SSM parameter with the ID of Guardduty


<!--- BEGIN_TF_DOCS --->

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |

## Providers

| Name | Version |
|------|---------|
| aws | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cloudtrail | Enable/Disables cloudtrail | `bool` | `true` | no |
| cloudtrail\_s3\_bucket\_id | S3 bucket for cloudtrail logs | `string` | `""` | no |
| guardduty | Enable/Disables guardduty | `bool` | `true` | no |
| org\_name | Name for this organization (not actually used in API call) | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| guardduty\_detector\_id | GuardDuty Detector ID of master account |

<!--- END_TF_DOCS --->

## Author

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-audit-root/blob/master/LICENSE) for full details.