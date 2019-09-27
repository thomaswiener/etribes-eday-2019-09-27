resource "aws_key_pair" "developer" {
  key_name   = "${var.name}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.type}"

  key_name      = "${aws_key_pair.developer.key_name}"
  security_groups = [
    "${aws_security_group.ssh.name}",
    "${aws_security_group.http.name}"
  ]

  tags = {
    Name = "${var.name}"
  }
}

output "instance_ip" {
  value = "${aws_instance.web.public_ip}"
}