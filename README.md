<!-- This file was automatically generated by the `build-harness`. Make all changes to `README.yaml` and run `make readme` to rebuild this file. -->

[![Cloud Posse](https://cloudposse.com/logo-300x69.svg)](https://cloudposse.com)

# terraform-aws-dynamodb-autoscaler [![Build Status](https://travis-ci.org/cloudposse/terraform-aws-dynamodb-autoscaler.svg?branch=master)](https://travis-ci.org/cloudposse/terraform-aws-dynamodb-autoscaler) [![Latest Release](https://img.shields.io/github/release/cloudposse/terraform-aws-dynamodb-autoscaler.svg)](https://github.com/cloudposse/terraform-aws-dynamodb-autoscaler/releases/latest) [![Slack Community](https://slack.cloudposse.com/badge.svg)](https://slack.cloudposse.com)


Terraform module to provision DynamoDB autoscaler.

Autoscaler scales up/down the provisioned OPS for a DynamoDB table based on the load.


---

This project is part of our comprehensive ["SweetOps"](https://docs.cloudposse.com) approach towards DevOps. 


It's 100% Open Source and licensed under the [APACHE2](LICENSE).










## Usage

```hcl
module "dynamodb_autoscaler" {
  source                       = "git::https://github.com/cloudposse/terraform-aws-dynamodb-autoscaler.git?ref=master"
  namespace                    = "eg"
  stage                        = "dev"
  name                         = "cluster"
  dynamodb_table_name          = "eg-dev-cluster-terraform-state-lock"
  dynamodb_indexes             = [ "first-index", "second-index" ]
  dynamodb_table_arn           = "arn:aws:dynamodb:us-east-1:123456789012:table/eg-dev-cluster-terraform-state-lock"
  autoscale_write_target       = 50
  autoscale_read_target        = 50
  autoscale_min_read_capacity  = 5
  autoscale_max_read_capacity  = 20
  autoscale_min_write_capacity = 5
  autoscale_max_write_capacity = 20
}
```






## Makefile Targets
```
Available targets:

  help                                Help screen
  help/all                            Display help for all targets
  help/short                          This help short screen
  lint                                Lint terraform code

```

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




## Related Projects

Check out these related projects.

- [terraform-aws-dynamodb](https://github.com/cloudposse/terraform-aws-dynamodb) - Terraform module that implements AWS DynamoDB with support for AutoScaling
- [terraform-aws-tfstate-backend](https://github.com/cloudposse/terraform-aws-tfstate-backend) - Provision an S3 bucket to store terraform.tfstate file and a DynamoDB table to lock the state file to prevent concurrent modifications and state corruption



## Help

**Got a question?**

File a GitHub [issue](https://github.com/cloudposse/terraform-aws-dynamodb-autoscaler/issues), send us an [email][email] or join our [Slack Community][slack].

## Commercial Support

Work directly with our team of DevOps experts via email, slack, and video conferencing. 

We provide [*commercial support*][commercial_support] for all of our [Open Source][github] projects. As a *Dedicated Support* customer, you have access to our team of subject matter experts at a fraction of the cost of a full-time engineer. 

[![E-Mail](https://img.shields.io/badge/email-hello@cloudposse.com-blue.svg)](mailto:hello@cloudposse.com)

- **Questions.** We'll use a Shared Slack channel between your team and ours.
- **Troubleshooting.** We'll help you triage why things aren't working.
- **Code Reviews.** We'll review your Pull Requests and provide constructive feedback.
- **Bug Fixes.** We'll rapidly work to fix any bugs in our projects.
- **Build New Terraform Modules.** We'll develop original modules to provision infrastructure.
- **Cloud Architecture.** We'll assist with your cloud strategy and design.
- **Implementation.** We'll provide hands-on support to implement our reference architectures. 


## Community Forum

Get access to our [Open Source Community Forum][slack] on Slack. It's **FREE** to join for everyone! Our "SweetOps" community is where you get to talk with others who share a similar vision for how to rollout and manage infrastructure. This is the best place to talk shop, ask questions, solicit feedback, and work together as a community to build *sweet* infrastructure.

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/cloudposse/terraform-aws-dynamodb-autoscaler/issues) to report any bugs or file feature requests.

### Developing

If you are interested in being a contributor and want to get involved in developing this project or [help out](https://github.com/orgs/cloudposse/projects/3) with our other projects, we would love to hear from you! Shoot us an [email](mailto:hello@cloudposse.com).

In general, PRs are welcome. We follow the typical "fork-and-pull" Git workflow.

 1. **Fork** the repo on GitHub
 2. **Clone** the project to your own machine
 3. **Commit** changes to your own branch
 4. **Push** your work back up to your fork
 5. Submit a **Pull Request** so that we can review your changes

**NOTE:** Be sure to merge the latest changes from "upstream" before making a pull request!


## Copyright

Copyright © 2017-2018 [Cloud Posse, LLC](https://cloudposse.com)



## License 

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0) 

See [LICENSE](LICENSE) for full details.

    Licensed to the Apache Software Foundation (ASF) under one
    or more contributor license agreements.  See the NOTICE file
    distributed with this work for additional information
    regarding copyright ownership.  The ASF licenses this file
    to you under the Apache License, Version 2.0 (the
    "License"); you may not use this file except in compliance
    with the License.  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing,
    software distributed under the License is distributed on an
    "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
    KIND, either express or implied.  See the License for the
    specific language governing permissions and limitations
    under the License.









## Trademarks

All other trademarks referenced herein are the property of their respective owners.

## About

This project is maintained and funded by [Cloud Posse, LLC][website]. Like it? Please let us know at <hello@cloudposse.com>

[![Cloud Posse](https://cloudposse.com/logo-300x69.svg)](https://cloudposse.com)

We're a [DevOps Professional Services][hire] company based in Los Angeles, CA. We love [Open Source Software](https://github.com/cloudposse/)!

We offer paid support on all of our projects.  

Check out [our other projects][github], [apply for a job][jobs], or [hire us][hire] to help with your cloud strategy and implementation.

  [docs]: https://docs.cloudposse.com/
  [website]: https://cloudposse.com/
  [github]: https://github.com/cloudposse/
  [commercial_support]: https://github.com/orgs/cloudposse/projects
  [jobs]: https://cloudposse.com/jobs/
  [hire]: https://cloudposse.com/contact/
  [slack]: https://slack.cloudposse.com/
  [linkedin]: https://www.linkedin.com/company/cloudposse
  [twitter]: https://twitter.com/cloudposse/
  [email]: mailto:hello@cloudposse.com


### Contributors

|  [![Andriy Knysh][aknysh_avatar]][aknysh_homepage]<br/>[Andriy Knysh][aknysh_homepage] | [![Michele Cantelli][emmekappa_avatar]][emmekappa_homepage]<br/>[Michele Cantelli][emmekappa_homepage] |
|---|---|

  [aknysh_homepage]: https://github.com/aknysh
  [aknysh_avatar]: https://github.com/aknysh.png?size=150
  [emmekappa_homepage]: https://github.com/emmekappa
  [emmekappa_avatar]: https://github.com/emmekappa.png?size=150


