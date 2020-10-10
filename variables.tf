variable "aws_region" {
  default     = "us-east-1"
}

variable "aws_access_key" {
  default = "*********"
}

variable "aws_secret_key" {
  default = "**********"
}

# Need to provide a Red-Hat based image
variable "aws_ami" {
  default = "ami-032930428bf1abbff"
}

variable "aws_instance_type" {
  default     = "m3.medium"
}