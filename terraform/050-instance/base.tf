variable "name" {}
variable "ami" {}
variable "type" {}

provider "aws" {
  region = "eu-central-1"
}