module "vpc" {
  source = "./modules/vpc"
  
  vpc_info = {
    cidr_block           = "10.0.0.0/16"
    enable_dns_hostnames = true
    tags = {
      Name = "Dev"
    }
    description = "this is for vpc."
  }

  public_subnets = [{
    cidr_block = "10.0.0.0/24"
    az         = "ap-south-1a"
    tags = {
      Name = "web-1"
    }
    description = "pub subnet"
  }]


  private_subnets = [{
    cidr_block = "10.0.3.0/24"
    az         = "ap-south-1b"
    tags = {
      Name = "db-1"
    }
    description = "pvt subnet"
  }]

}
