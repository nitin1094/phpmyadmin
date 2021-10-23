provider "aws" {
    region = var.region
    profile = var.profile
}

### Creating the VPC and the subnetework  ###
module "network" {
    source = "../module/network"
    region = "us-east-1"
    environment = "staging"
}

module "security" {
    source = "../module/security"
    vpc = module.network.vpc
    vpc_id = module.network.vpc_id
    environment = "staging"
}

module "instance" {
    source = "../module/instance"
    subnet_id = module.network.subnet_id[0]
    security_group = module.security.security_group
    environment = "staging"
    key = "ongraph-new"
    ssh_user = "ubuntu"
    private_key_path = "/home/ubuntu/ongraph.pem"
}

locals {
    vpc_id = module.network.vpc_id
    subnet_id = module.network.subnet_id
    ssh_user = "ubuntu"
    key_name = "ongraph-new"
    private_key_path = "/home/ubuntu/ongraph.pem"
}
