terraform {
  backend "s3" {
    bucket = "eks-tfstate-bucket24"
    key    = "eks/terraform.tfstate"
    region = "ap-south-1"
  }
}
