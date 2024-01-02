<!-- BEGIN_TF_DOCS -->
#### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | >= 1.5.3, < 2.0.0 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | ~> 5.31.0 |

#### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider_aws) | ~> 5.31.0 |

#### Resources

| Name | Type |
|------|------|
| [aws_dynamodb_table.state_lock](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/dynamodb_table) | resource |
| [aws_kms_alias.dynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.dynamodb](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_s3_bucket.state_file](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_public_access_block.public_access](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_s3_bucket_server_side_encryption_configuration.default](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_server_side_encryption_configuration) | resource |
| [aws_s3_bucket_versioning.state_file](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_versioning) | resource |

#### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | AWS region where resources are needed | `string` | yes |
| <a name="input_default_tags"></a> [default_tags](#input_default_tags) | Default tags to be attached to the AWS resources | `map(string)` | yes |
| <a name="input_dynamo_db_table_name"></a> [dynamo_db_table_name](#input_dynamo_db_table_name) | The name of the DynamoDB table to use for Terraform state locking. Must be unique in this AWS account. | `string` | yes |
| <a name="input_s3_bucket_name"></a> [s3_bucket_name](#input_s3_bucket_name) | The name of the S3 bucket to store the Terraform state file. Must be unique in this AWS account. | `string` | yes |

#### Outputs

| Name | Description |
|------|-------------|
| <a name="output_dynamodb_table_name"></a> [dynamodb_table_name](#output_dynamodb_table_name) | The name of the DynamoDB table |
| <a name="output_s3_bucket_arn"></a> [s3_bucket_arn](#output_s3_bucket_arn) | The ARN of the S3 bucket |
<!-- END_TF_DOCS -->