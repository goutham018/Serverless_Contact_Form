terraform {
  required_version = ">= 1.1.0"
  backend "s3" {
    bucket  = "serverless-testing-bucketttttttttttttttttttt"
    key     = "goutham/terraform.tfstate"
    region  = "us-east-1"
    encrypt = true
  }
}
