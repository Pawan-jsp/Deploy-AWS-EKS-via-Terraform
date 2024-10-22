terraform {
  backend "s3" {
    bucket = "useastbucket24"
    key    = "jenkins/terraform.tfstate"
    region = "us-east-2"
  }
}
