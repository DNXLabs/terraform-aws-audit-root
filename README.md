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
| aws.audit | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| account\_ids | AWS Account IDs under Auditing for the organization | `list` | `[]` | no |
| cloudtrail | Enable/Disables cloudtrail | `bool` | `true` | no |
| cloudtrail\_log\_group\_retention\_in\_days | Days for log group retention | `number` | `365` | no |
| enable\_log\_file\_validation | Enable log file validation for CloudConformity | `bool` | `false` | no |
| master\_account\_id | Master account ID | `any` | n/a | yes |
| org\_name | Name for this organization (not actually used in API call) | `any` | n/a | yes |
| organization\_id | Organization ID for CloudTrail access | `any` | n/a | yes |
| s3\_days\_until\_glacier | How many days before transitioning files to Glacier | `number` | `90` | no |

## Outputs

No output.

<!--- END_TF_DOCS --->

## Author

Module managed by [DNX Solutions](https://github.com/DNXLabs).

## License

Apache 2 Licensed. See [LICENSE](https://github.com/DNXLabs/terraform-aws-audit-root/blob/master/LICENSE) for full details.