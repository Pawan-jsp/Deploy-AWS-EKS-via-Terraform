resource "aws_iam_role" "eks_prometheus" {
  name               = "eks-prometheus-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRoleWithWebIdentity"]
    effect  = "Allow"
    principals {
      type        = "Federated"
      identifiers = [aws_iam_openid_connect_provider.eks.id]
    }
    condition {
      test     = "StringEquals"
      variable = "eks.amazonaws.com:sub"
      values   = ["system:serviceaccount:monitoring:prometheus"]
    }
  }
}
