<!-- markdownlint-disable -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.0 |
| aws | >= 2.0 |
| null | >= 2.0 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.0 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| attributes | Additional attributes (e.g. `1`) | `list(string)` | `[]` | no |
| autoscale\_max\_read\_capacity | DynamoDB autoscaling max read capacity | `number` | `20` | no |
| autoscale\_max\_write\_capacity | DynamoDB autoscaling max write capacity | `number` | `20` | no |
| autoscale\_min\_read\_capacity | DynamoDB autoscaling min read capacity | `number` | `5` | no |
| autoscale\_min\_write\_capacity | DynamoDB autoscaling min write capacity | `number` | `5` | no |
| autoscale\_read\_target | The target value for DynamoDB read autoscaling | `number` | `50` | no |
| autoscale\_write\_target | The target value for DynamoDB write autoscaling | `number` | `50` | no |
| delimiter | Delimiter to be used between `namespace`, `environment`, `stage`, `name` and `attributes` | `string` | `"-"` | no |
| dynamodb\_indexes | List of DynamoDB indexes | `list(string)` | `[]` | no |
| dynamodb\_table\_arn | DynamoDB table ARN | `string` | n/a | yes |
| dynamodb\_table\_name | DynamoDB table name | `string` | n/a | yes |
| enabled | Set to false to prevent the module from creating any resources | `bool` | `true` | no |
| environment | Environment, e.g. 'prod', 'staging', 'dev', 'pre-prod', 'UAT' | `string` | `""` | no |
| name | Solution name, e.g. 'app' or 'jenkins' | `string` | `""` | no |
| namespace | Namespace, which could be your organization name or abbreviation, e.g. 'eg' or 'cp' | `string` | `""` | no |
| stage | Stage, e.g. 'prod', 'staging', 'dev', OR 'source', 'build', 'test', 'deploy', 'release' | `string` | `""` | no |
| tags | Additional tags (e.g. `map('BusinessUnit','XYZ')` | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| appautoscaling\_read\_target\_id | Appautoscaling read target ID |
| appautoscaling\_read\_target\_index\_id | Appautoscaling read target index ID |
| appautoscaling\_write\_target\_id | Appautoscaling write target ID |
| appautoscaling\_write\_target\_index\_id | Appautoscaling write target index ID |
| autoscaler\_iam\_role\_arn | Autoscaler IAM Role ARN |
| autoscaler\_iam\_role\_id | Autoscaler IAM Role ID |

<!-- markdownlint-restore -->
