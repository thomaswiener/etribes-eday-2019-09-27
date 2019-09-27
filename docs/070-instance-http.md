## Instance HTTP

There is a webserver running on port 80. Connect to it.
Traffic is blocked! We need to create a new security group and attach it to the instance.

--- 

#### Security Group

Add additional security_group

```
//in security_group.tf

resource "aws_security_group" "http" {
  name        = "http"
  description = "http for all instances"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "6"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
```

#### Attach Security Group and Key to Instance
```
//in instance.tf

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

```

```
$ terraform apply --var-file=prod.tfvars

// Type yes when asked to do so
```

#### Cleanup
```
 terraform destroy --var-file=prod.tfvars
```
