# ----------------------------
# EKS Cluster Outputs
# ----------------------------

output "cluster_id" {
  description = "The name/id of the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.id
}

output "cluster_arn" {
  description = "The Amazon Resource Name (ARN) of the cluster."
  value       = aws_eks_cluster.eks_cluster.arn
}

output "cluster_certificate_authority_data" {
  description = "Base64 encoded certificate data required to communicate with your cluster."
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "The endpoint for your EKS Kubernetes API."
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_version" {
  description = "The Kubernetes server version for the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.version
}

output "cluster_iam_role_name" {
  description = "IAM role name of the EKS cluster."
  value       = aws_iam_role.eks_master_role.name 
}

output "cluster_iam_role_arn" {
  description = "IAM role ARN of the EKS cluster."
  value       = aws_iam_role.eks_master_role.arn
}

output "cluster_oidc_issuer_url" {
  description = "The URL on the EKS cluster OIDC Issuer."
  value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}

output "cluster_primary_security_group_id" {
  description = "The cluster primary security group ID created by the EKS cluster."
  value       = aws_eks_cluster.eks_cluster.vpc_config[0].cluster_security_group_id
}

# ----------------------------
# EKS Node Group Outputs
# ----------------------------

# Core Apps Node Group
output "core_apps_ng_id" {
  description = "Core Apps Node Group ID"
  value       = aws_eks_node_group.core_apps_ng.id
}

output "core_apps_ng_arn" {
  description = "Core Apps Node Group ARN"
  value       = aws_eks_node_group.core_apps_ng.arn
}

output "core_apps_ng_status" {
  description = "Core Apps Node Group status"
  value       = aws_eks_node_group.core_apps_ng.status
}

output "core_apps_ng_version" {
  description = "Core Apps Node Group Kubernetes Version"
  value       = aws_eks_node_group.core_apps_ng.version
}

# Common System Node Group
output "common_system_ng_id" {
  description = "Common System Node Group ID"
  value       = aws_eks_node_group.common_system_ng.id
}

output "common_system_ng_arn" {
  description = "Common System Node Group ARN"
  value       = aws_eks_node_group.common_system_ng.arn
}

output "common_system_ng_status" {
  description = "Common System Node Group status"
  value       = aws_eks_node_group.common_system_ng.status
}

output "common_system_ng_version" {
  description = "Common System Node Group Kubernetes Version"
  value       = aws_eks_node_group.common_system_ng.version
}

