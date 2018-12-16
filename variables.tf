variable "name" {
  description = "Name to be used on all the resources as identifier"
  default     = "test"
}

variable "region" {
  description = "AWS region"
}

variable "access_key" {
  description = "AWS Access key"
}

variable "secret_key" {
  description = "AWS Secret Key"
}

variable "environment" {
  description = "The name of the environment"
}

variable "ecs_cluster" {
  description = "The name of the ECS Cluster"
  default = "default"
}

variable "cidr" {
  description = "The CIDR block for the VPC. Default value is a valid CIDR, but not acceptable by AWS and should be overriden"
  default     = "0.0.0.0/0"
}

variable "azs" {
  description = "A list of availability zones in the region"
  type        = "list"
  default     = ["ap-southeas-1a", "ap-southeas-1b", "ap-southeas-1c"]
}

variable "public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = "list"
}

variable "private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = "list"
}

variable "enable_nat_gateway" {
  description = "Should be true if you want to provision NAT Gateways for each of your private networks"
  default     = true
}

variable "single_nat_gateway" {
  description = "Should be true if you want to provision a single shared NAT Gateway across all of your private networks"
  default     = true
}

variable "instance_type" {
  description = "ECS EC2 instance type"
}

variable "ecs_key_pair_name" {
  description = "ECS Key pair name "
}

variable "max_instance_size" {}

variable "min_instance_size" {}

variable "desired_capacity" {}
