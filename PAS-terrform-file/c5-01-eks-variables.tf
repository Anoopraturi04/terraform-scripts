# EKS Cluster Input Variables
variable "cluster_name" {
  description = "Name of the EKS cluster. Also used as a prefix in names of related resources."
  type        = string
  default     = "eks-cluster"
}

variable "cluster_service_ipv4_cidr" {
  description = "service ipv4 cidr for the kubernetes cluster"
  type        = string
  default     = null
}

variable "cluster_version" {
  description = "Kubernetes minor version to use for the EKS cluster (for example 1.28)"
  type        = string
  default     = 1.32
}

variable "cluster_endpoint_private_access" {
  description = "Indicates whether or not the Amazon EKS private API server endpoint is enabled."
  type        = bool
  default     = true
}

variable "cluster_endpoint_public_access" {
  description = "Indicates whether or not the Amazon EKS public API server endpoint is enabled. When it's set to `false` ensure to have a proper private access with `cluster_endpoint_private_access = true`."
  type        = bool
  default     = false
}

variable "cluster_endpoint_public_access_cidrs" {
  description = "List of CIDR blocks which can access the Amazon EKS public API server endpoint."
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

# -------------------------------------------------------------------------------------
# EKS Node Group Variables (for core-apps-ng and common-system-ng using RHEL AMI)
# -------------------------------------------------------------------------------------

variable "core_apps_ng_instance_types" {
  description = "Instance types for core-apps-ng"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "common_system_ng_instance_types" {
  description = "Instance types for common-system-ng"
  type        = list(string)
  default     = ["t3.medium"]
}

variable "rhel_ami_id" {
  description = "Custom RHEL AMI ID"
  type        = string
}

variable "ssh_key_name" {
  description = "SSH Key name for remote access"
  type        = string
}

