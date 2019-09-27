## Instance HTTP



1. Security Group
All traffic is blocked by default.

2. SSH Key
We need to set our public ssh key to login.

3. Attach Security Group
We need to attach the security group to the instance.

--- 

1. Security Group

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

2. Attach Security Group and Key to Instance
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

Cleanup
```
 terraform destroy --var-file=prod.tfvars
```
