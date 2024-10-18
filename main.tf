provider "aws" {
  region = "us-west-2"
}

# EKS Cluster
module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-eks-cluster"
  cluster_version = "1.21"

  node_groups = {
    eks_nodes = {
      desired_capacity = 1
      max_capacity     = 1
      min_capacity     = 1
      instance_type    = "t3.medium"
    }
  }

  vpc_id     = aws_vpc.my_vpc.id
  subnet_ids = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]
}

# VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-west-2a"
}

resource "aws_subnet" "subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-west-2b"
}
