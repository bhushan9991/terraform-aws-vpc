# Terraform to create VPC, Public Subnet with IGW

>Terraform version = v0.12.18

**Terraform code structure**
- This project contains vpc.tf, main.tf, terraform.tfvars, backend.tf and variables.tf. And this code lint proof!
- The module is written in the common directory and the main directory has the main.tf and environment-specific tf.vars and backend.tf file.

```
~/dev/my-vpc ls -lrth
drwxrwxr-x  common
-rw-rw-r--  main.tf
-rw-rw-r--  terraform.tfvars
-rw-rw-r--  variables.tf
-rw-rw-r--  backend.tf
-rwxrwxr-x  envconfig.sh

~/dev/my-vpc/common$ ls -lrth
-rw-rw-r-- provider.tf
-rw-rw-r-- vpc.tf
-rw-rw-r-- variables.tf
```

- To run this project go to the my-vpc directory and run **terraform init** and then **terraform plan**
- No values hardcoded in vpc.tf, all the variables, and their values are declared in tfvars file.

## Bonus
```
- This terraform code is written in such a way that you can use the same code for multi accounts or multi regions.
- For that, you just have to create multiple .tfvars and backend.tf file under the my-vpc directory.
 e.g:
      1. terraform.tfvars.dev and backend.tf.dev
      2. terraform.tfvars.prod and backend.tf.prod
 
 - If you want create VPC for Dev account just symlink both the files(terraform.tfvars.dev and backend.tf.dev) with terraform.tfvars and backend.tf
 - How to symlink files?
 - There is a script provided under the my-vpc directory to set up config for the dev environment.
This script creates a symlink between your environment-specific **terraform.tfvars.dev** with default **terraform.tfvars** also **backend.tf.dev** with **backend.tf**

e.g: To create vpc for the dev environment:-
-$ cd my-vpc/
-$ ./envconfig.sh dev
-$ ls -la
-$ lrwxrwxrwx  backend.tf -> backend.tf.dev
-$ rw-rw-r--   backend.tf.dev
-$ rw-rw-r--   backend.tf.prod
-$ rw-rw-r--   main.tf
-$ rwxrwxrwx   terraform.tfvars -> terraform.tfvars.dev
-$ rw-rw-r--   terraform.tfvars.dev
-$ rw-rw-r--   terraform.tfvars.prod
-$ rw-rw-r--   variables.tf

```

Next, run the commands **terraform init** and then **terraform plan**

------------------------------------------------------------------------------

## Note: Please update region as per your requirement in backend.tf

> Terraform won't allow you to use the variable in the backend.tf file where your s3 bucket is, so you cant use your declared variable there.
