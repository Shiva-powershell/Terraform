variable "aws_region" {
    description = "Region where resources are created"
    type = string
    default = "ap-south-1"
}

variable "instance_type" {
  description = "Instance type"
  type = string
  default = "t2.micro"
}
variable "key_pair" {
    description = "Key pair to aws instances"
    type = string
    default = "terraform-key"
}

