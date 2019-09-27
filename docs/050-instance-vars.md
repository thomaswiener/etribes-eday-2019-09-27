## Instance

Create prod.tfvars

```
name = "{your-name}"
ami  = "ami-067ee10914e74ffee"
type = "t2.micro"
```

Update base.tf
```
//in base.tf

variable "name" {}
variable "ami" {}
variable "type" {}
...
```

Update instance.tf
```
//in instance.tf

resource "aws_instance" "web" {
  ami           = "${var.ami}"
  instance_type = "${var.type}"

  tags = {
    Name = "${var.name}"
  }
}
```

Run terraform apply with prod vars
```
$ terraform apply --var-file=prod.tfvars

// Type yes when asked to do so
```
