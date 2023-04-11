# AWS key pair Terraform module

Author: [Yurii Onuk](https://onuk.org.ua)

Terraform module which creates
[Amazon EC2 Key Pairs](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-key-pairs.html)
on AWS.

Next types of resources are supported:

* [AWS key pair](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/key_pair)

## Terraform version compatibility

- 0.12.29
- 1.1.5

## Usage

main.tf:

```hcl-terraform
module "key_pair" {
  source = "git@github.com:equinor/flowify-terraform-aws-key-pair.git?ref=1.1.x"
  region = "${var.region}"
  create_keys = "${var.create_keys}"
  
  # List of names the public key material
  public_key_name = ["dev-ops", "tract-eng", "tract-cse", "ops-atlas", "ops-prod"]
}
```

outputs.tf:

```hcl-terraform
output "key_name" {
  value       = "${module.key_pair.key_name}"
  description = "SSH key name"
}
```

## Inputs

 Variable             | Type     | Default  | Required | Purpose
:---------------------|:--------:| ---------| -------- | :-------------------------------- |
 `public_key_material`| `map`    | `yes`    |   `no`   | `List of the public key material` |
 `public_key_name`    | `list`   | `["dev-ops"]` | `no` | `List of names the public key material` |
 `create_keys`        | `bool`   | `true`   |  `no`    | `Indicates, if we need to add key pairs to the AWS (true), or they are already there (false)` |
 
## Terraform Validate Action

Runs `terraform validate -var-file=validator` to validate the Terraform files 
in a module directory via CI/CD pipeline.
Validation includes a basic check of syntax as well as checking that all variables declared.

### Success Criteria

This action succeeds if `terraform validate -var-file=validator` runs without error.

### Validator

If some variables are not set as default, we should fill the file `validator` with these variables.
