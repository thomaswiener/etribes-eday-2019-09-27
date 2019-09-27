## Basics

### First File

Configuration is stored in .tf files.
You can use multiple files, as long as they end with .tf. 


```
//in base.tf

provider "aws" {
  region = "eu-central-1"
}
```

### Initialize provider

```
$ terraform init


Initializing the backend...
...

```

A new folder is created with provider libs in .terraform


### Apply configuration

```
$ terraform apply

Apply complete! Resources: 0 added, 0 changed, 0 destroyed.
```

A new file is created: terraform.tfstate
It contains information about resources created by terraform.

### Show help

```
$ terraform help
```
