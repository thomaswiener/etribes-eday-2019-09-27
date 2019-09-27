resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.type}"

  tags = {
    Name = "${var.name}"
  }
}
