## Instance

#### Create new instance.tf file


```
//in instance.tf

resource "aws_instance" "web" {
  ami           = "ami-067ee10914e74ffee"
  instance_type = "t2.micro"
}
```

#### Replace tags.Name with your name (alphanumeric)

```
$ terraform apply

// Type yes when asked to do so
```

Hint: Take a look into terraform.tfstate

#### Cleanup

```
$ terraform destroy

// Type yes when asked to do so
```
