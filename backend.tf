terraform {
  backend "s3" {
    bucket         = "gimbal-terraform-state"
    key            = "sightings-bucket/terraform.tfstate"
    region         = "us-west-2"
    dynamodb_table = "terraform_locks"
  }
}
