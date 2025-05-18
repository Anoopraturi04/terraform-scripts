ami = "ami-053a0835435bf4f45"
#instance_type = "t3.micro"
/* as this is so hectic to modify the "terraform.tfvars" file 
 for different enviornments to tackle this we have two approachs 
 1. we can make multiple "tfvars" for each env 
    for ex: dev.tfvars, stage.tfvars,prod.tfvars etc.
    and use that files in terrform command
    terraform apply -var-file=dev.tfvars
 2.for second way go to the main.tf file */