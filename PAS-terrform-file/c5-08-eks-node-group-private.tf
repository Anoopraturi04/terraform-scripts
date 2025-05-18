
# --------------------------------------
# EKS Node Group: core-apps-ng
# --------------------------------------


resource "aws_eks_node_group" "core_apps_ng" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${local.name}-core-apps-ng"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = module.vpc.private_subnets
  version         = var.cluster_version

  ami_type        = "AL2_x86_64"
  capacity_type   = "ON_DEMAND"
  disk_size       = 60
  instance_types  = ["t3.medium"]

  remote_access {
    ec2_ssh_key = "prizm-pas"
  }

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  labels = {
    nodegroup = "core-apps-ng"
  }

  tags = {
    # Tags for the node group
    Name                        = "${local.name}-core-apps-ng"
    "kubernetes.io/cluster/${aws_eks_cluster.eks_cluster.name}" = "owned"
    "eks:nodegroup-name"        = "${local.name}-core-apps-ng"
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]
}

# --------------------------------------
# EKS Node Group: common-system-ng
# --------------------------------------
resource "aws_eks_node_group" "common_system_ng" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "${local.name}-common-system-ng"
  node_role_arn   = aws_iam_role.eks_nodegroup_role.arn
  subnet_ids      = module.vpc.private_subnets
  version         = var.cluster_version

  ami_type        = "AL2_x86_64"
  capacity_type   = "ON_DEMAND"
  disk_size       = 60
  instance_types  = ["t3.medium"]

  remote_access {
    ec2_ssh_key = "prizm-pas"
  }

  scaling_config {
    desired_size = 1
    min_size     = 1
    max_size     = 2
  }

  update_config {
    max_unavailable = 1
  }
  labels = {
    nodegroup = "common-system-ng"
  }


  tags = {
    Name = "${local.name}-common-system-ng"
    "kubernetes.io/cluster/${aws_eks_cluster.eks_cluster.name}" = "owned"
    "eks:nodegroup-name"        = "${local.name}-common-system-ng"
  }
  depends_on = [
    aws_iam_role_policy_attachment.eks-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.eks-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.eks-AmazonEC2ContainerRegistryReadOnly,
  ]
  
}

