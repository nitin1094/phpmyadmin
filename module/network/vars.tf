variable "region" {
  description = "us-east-1"
}

variable vpc_cidr {
  type        = string
  default     = "10.0.0.0/16"
  description = "description"
}

variable "environment" {
  description = "The Deployment environment"
}

variable "public_subnets_cidr" {
  type        = list
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  description = "The CIDR block for the public subnet"
}

variable "private_subnets_cidr" {
  type        = list
  default     = ["10.0.3.0/24", "10.0.4.0/24"]
  description = "The CIDR block for the public subnet"
}

variable "availability_zones" {
  type        = list
  default     = ["us-east-1a", "us-east-1b"]
  description = "The CIDR block for the private subnet"
}
