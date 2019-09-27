resource "aws_instance" "web" {
  ami           = "ami-092f99959d64efffc"
  instance_type = "t2.micro"
}
