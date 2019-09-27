## Basics

#### Resources

```
resource "{resource_name}" "{name}" {
  key = "value"
}

// Example
resource "aws_instance" "web" {
  ami = "ami-12345678"
}

// resource will be managed by terraform
// resource_name: The type of resource (https://www.terraform.io/docs/providers/aws/r/instance.html)
// name: A name you can pick to describe the resource
// key: properties of the resource
// referenced: "${resource_name.name.key}"
//             "${aws_instance.web.public_ip)"

```

#### Data Sources

```
data "aws_instance" "foo" {
  instance_id = "i-instanceid"
}

// an already existing resource with properties that terraform should access
// resource_name: The type of resource (https://www.terraform.io/docs/providers/aws/r/instance.html)
// name: A name you can pick to describe the resource
// referenced: ${data.resource_name.name.key}"
//             ${data.aws_instance.web.public_ip}"

```

#### Output

```
output "foo" {
  value = "{value}"
}

output "foo" {
  value = "${aws_instance.web.public_ip}"
}

// outputs a specific value after terraform run succeeded

```

#### First File

Configuration is stored in .tf files.
You can use multiple files, as long as they end with .tf. 


```
//in base.tf

provider "aws" {
  region = "eu-central-1"
}
```

#### Initialize provider

```
$ terraform init


Initializing the backend...
...

```

A new folder is created with provider libs in .terraform


#### Apply configuration

```
$ terraform apply

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

A new file is created: terraform.tfstate
It contains information about resources created by terraform.

#### Show help

```
$ terraform help
```
