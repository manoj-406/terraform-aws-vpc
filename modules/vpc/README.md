Here's a sample `README.md` file that you can use for your Terraform module, explaining the variables, locals, and how to use the module:

---

# VPC Module

This module creates a Virtual Private Cloud (VPC) along with public and private subnets in AWS. It supports enabling DNS hostnames, and tagging resources, and provides flexibility for the number of subnets.

## Usage

```hcl
module "vpc" {
  source = "./vpc"

  vpc_info = {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name        = "my-vpc"
      Environment = "production"
    }
  }

  public_subnets = [
    {
      cidr_block = "10.0.1.0/24"
      az         = "us-east-1a"
      tags = {
        Name = "public-subnet-1"
      }
    },
    {
      cidr_block = "10.0.2.0/24"
      az         = "us-east-1b"
      tags = {
        Name = "public-subnet-2"
      }
    }
  ]

  private_subnets = [
    {
      cidr_block = "10.0.3.0/24"
      az         = "us-east-1a"
      tags = {
        Name = "private-subnet-1"
      }
    },
    {
      cidr_block = "10.0.4.0/24"
      az         = "us-east-1b"
      tags = {
        Name = "private-subnet-2"
      }
    }
  ]
}
```

## Inputs

| Name               | Type   | Description                          |
|--------------------|--------|--------------------------------------|
| `vpc_info`         | object | Contains VPC details (CIDR block, DNS hostnames, and tags). |
| `public_subnets`   | list   | List of objects defining public subnets (CIDR block, availability zone, and tags). |
| `private_subnets`  | list   | List of objects defining private subnets (CIDR block, availability zone, and tags). |

### `vpc_info` Object

- **cidr_block**: (string) The CIDR block for the VPC.
- **enable_dns_hostnames**: (bool) Whether or not to enable DNS hostnames in the VPC.
- **tags**: (map) A set of tags to assign to the VPC.

### `public_subnets` Object

- **cidr_block**: (string) The CIDR block for the public subnet.
- **az**: (string) The availability zone for the public subnet.
- **tags**: (map) A set of tags to assign to the public subnet.

### `private_subnets` Object

- **cidr_block**: (string) The CIDR block for the private subnet.
- **az**: (string) The availability zone for the private subnet.
- **tags**: (map) A set of tags to assign to the private subnet.

## Outputs

| Name               | Description                           |
|--------------------|---------------------------------------|
| `vpc_id`           | The ID of the created VPC.            |
| `public_subnet_ids`| List of IDs for the public subnets.    |
| `private_subnet_ids`| List of IDs for the private subnets.  |

## Local Variables

| Name                        | Description                                                  |
|-----------------------------|--------------------------------------------------------------|
| `do_we_have_public_subnets`  | Boolean to check if public subnets are defined.              |
| `do_we_have_private_subnets` | Boolean to check if private subnets are defined.             |
| `anywhere`                   | The CIDR block `0.0.0.0/0`, representing all IP addresses.   |

## Example

This example shows how to call the module and provide the necessary variables to create a VPC with both public and private subnets.

---

Feel free to customize the README further depending on your specific module structure or additional features. Once created, place this `README.md` in the root directory of the submodule to ensure Terraform recognizes it.