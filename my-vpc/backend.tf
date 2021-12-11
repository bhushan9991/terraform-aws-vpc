terraform {
  backend "s3" {
    bucket         = "my-tf-state"
    key            = "vpc/terraform.tfstate"
    region         = "eu-west-1"
    dynamodb_table = "my-tf-lock"
    encrypt        = true
  }
}
