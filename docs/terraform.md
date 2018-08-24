
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| attributes | Additional attributes (e.g. `1`) | list | `<list>` | no |
| autoscale_max_read_capacity | DynamoDB autoscaling max read capacity | string | `20` | no |
| autoscale_max_write_capacity | DynamoDB autoscaling max write capacity | string | `20` | no |
| autoscale_min_read_capacity | DynamoDB autoscaling min read capacity | string | `5` | no |
| autoscale_min_write_capacity | DynamoDB autoscaling min write capacity | string | `5` | no |
| autoscale_read_target | The target value for DynamoDB read autoscaling | string | `50` | no |
| autoscale_write_target | The target value for DynamoDB write autoscaling | string | `50` | no |
| delimiter | Delimiter to be used between `namespace`, `stage`, `name` and `attributes` | string | `-` | no |
| dynamodb_indexes | List of DynamoDB indexes | list | `<list>` | no |
| dynamodb_table_arn | DynamoDB table ARN | string | - | yes |
| dynamodb_table_name | DynamoDB table name | string | - | yes |
| enabled | Set to false to prevent the module from creating any resources | string | `true` | no |
| name | Name  (e.g. `app` or `cluster`) | string | - | yes |
| namespace | Namespace (e.g. `eg` or `cp`) | string | - | yes |
| stage | Stage (e.g. `prod`, `dev`, `staging`, `infra`) | string | - | yes |
| tags | Additional tags (e.g. map(`BusinessUnit`,`XYZ`) | map | `<map>` | no |

