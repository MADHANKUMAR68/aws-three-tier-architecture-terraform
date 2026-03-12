terraform {
  backend "s3" {
    bucket         = "madhan-terraform-state-bucket-2026"
    key            = "three-tier-architecture/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-state-locks"
    encrypt        = true
  }
}
