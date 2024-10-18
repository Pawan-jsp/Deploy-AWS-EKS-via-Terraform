# Provider and EKS Cluster setup as before
provider "aws" {
  region = "us-west-2"
}

module "eks" {
  source = "terraform-aws-modules/eks/aws"
  # Cluster details...
}

# Apply Helm to install Prometheus and Grafana
resource "helm_release" "kube-prometheus-stack" {
  name             = "prometheus"
  repository       = "https://prometheus-community.github.io/helm-charts"
  chart            = "kube-prometheus-stack"
  namespace        = "monitoring"
  create_namespace = true
}
