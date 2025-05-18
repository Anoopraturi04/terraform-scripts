# Define Local Values in Terraform
locals {
  owners = var.business_divsion
  environment = var.environment
  name = "${var.business_divsion}-${var.environment}"
  eks_cluster_name = "${local.name}-${var.cluster_name}"  
  #name = "${local.owners}-${local.environment}"
    common_tags = {
      owners = local.owners
    environment = local.environment
    }
  }



#locals {
  #owners         = var.business_divsion
#  environment    = var.environment
#  name           = var.cluster_name  # Changed here
#  eks_cluster_name = var.cluster_name  # Changed here

#  common_tags = {
    #  owners      = local.owners
#    environment = local.environment
#    Name        = var.cluster_name  # Add this if you use local.common_tags for tagging
#  }
#}

