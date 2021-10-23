variable "subnet_id" {
  default     = ""
  description = "description"
}

variable "ami" {
  type        = string
  default     = "ami-09e67e426f25ce0d7"
  description = "description"
}

variable "instance_type" {
  type        = string
  default     = "t2.micro"
  description = "description"
}


variable "security_group" {
  default     = []
  description = "description"
}

variable "key" {
  type        = string
  default     = ""
  description = "description"
}

variable "environment" {
  type        = string
  default     = ""
  description = "description"
}

variable "ssh_user" {
  type        = string
  default     = "ubuntu"
  description = "description"
}

variable "private_key_path" {
  type        = string
  default     = ""
  description = "description"
}


