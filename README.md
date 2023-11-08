<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_archive"></a> [archive](#provider\_archive) | n/a |
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_api_gateway_deployment.handson_deployment](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_deployment) | resource |
| [aws_api_gateway_integration.lambda_integration](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_integration) | resource |
| [aws_api_gateway_method.route_methods](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method) | resource |
| [aws_api_gateway_method_response.route_method_responses](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_method_response) | resource |
| [aws_api_gateway_resource.handson](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_resource.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_resource) | resource |
| [aws_api_gateway_rest_api.handson](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api) | resource |
| [aws_iam_policy.policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_policy) | resource |
| [aws_iam_role.handson](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role) | resource |
| [aws_iam_role_policy_attachment.api_gateway](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_iam_role_policy_attachment.handson](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role_policy_attachment) | resource |
| [aws_lambda_function.lambda_functions](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lambda_function) | resource |
| [archive_file.lambda_archives](https://registry.terraform.io/providers/hashicorp/archive/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_lambda_functions"></a> [lambda\_functions](#input\_lambda\_functions) | n/a | <pre>map(object({<br>    function_name    = string<br>    handler          = string<br>    source_code_path = string<br>  }))</pre> | n/a | yes |
| <a name="input_name_role"></a> [name\_role](#input\_name\_role) | n/a | `any` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `any` | n/a | yes |
| <a name="input_routes"></a> [routes](#input\_routes) | n/a | <pre>map(object({<br>    method = string<br>    path   = string<br>  }))</pre> | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_api_gateway_urls"></a> [api\_gateway\_urls](#output\_api\_gateway\_urls) | n/a |
<!-- END_TF_DOCS -->

## list action for deploy on gitlabci

### requirement aws

**create oidc**

![oidc](docs/identity_provider.png)

**create role**

![IAM ROLE](docs/create_role_iam.png)

add trust relationship on custom trust policy

        {
            "Version": "2012-10-17",
            "Statement": [
                {
                    "Effect": "Allow",
                    "Principal": {
                        "Federated": "arn_oidc"
                    },
                    "Action": "sts:AssumeRoleWithWebIdentity",
                    "Condition": {
                        "StringEquals": {
                            "gitlab.revolve.team:sub": "project_path:name_orga/name_repo:ref_type:branch:ref:branch_name"
                        }
                    }
                }
            ]
        }

change:

- arn_oidc
- name_orga
- name_repo
- branch_name (default `main`)

add policie for deploy terraform

### requirement gitlabci

download zip [here](https://gitlab.revolve.team/jeremy.monnier/handson-cicd)

create repo on gitlabci

add variable on project in gitlabci settings/cicd:

- ROLE_ARN

![variable](docs/variable_gitlabci.png)
