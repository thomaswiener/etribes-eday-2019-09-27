## Instance SSH

In order to connect via ssh to your instance, we need to setup a few things:

1. Security Group: All traffic is blocked by default. Allow port 22 inbound.
2. SSH Key: We need to set our public ssh key to login.
3. Attach Security Group: We need to attach the security group to the instance.
4. External IP: Determine IP after instance creation

--- 


#### Security Group

Create security_group.tf

```
//in security_group.tf

resource "aws_security_group" "ssh" {
  name        = "ssh"
  description = "ssh for all instances"

  ingress {
    from_port   = 22
    to_port     = 22
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

#### SSH Key

```
//in instance.tf

resource "aws_key_pair" "developer" {
  key_name   = "${var.name}"
  public_key = "${file("~/.ssh/id_rsa.pub")}"
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
    //other resouces are named like
    //{resource_type}.{name}.{properties}
    "${aws_security_group.ssh.name}"
  ]
  tags = {
    Name = "${var.name}"
  }
}

```

#### Figure out the instance external ip

```
//in instance.tf

output "instance_external_ip" {
  value = "${aws_instance.web.public_ip}"
}
```

```
$ terraform apply --var-file=prod.tfvars

// Type yes when asked to do so

...
Outputs:

instance_ip = "0.0.0.0"

```

Login to instance

```
$ ssh ubuntu@{external-ip}

```

Get information about current resource stack
```
$ terraform show
```
