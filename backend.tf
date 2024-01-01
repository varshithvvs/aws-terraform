# Setup remote backend for the repostory

terraform {
  backend "s3" {
    bucket         = "terraform-remote-playground"
    key            = "terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}