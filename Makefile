


init:
    terraform init

plan: init
    terraform plan --var-file=variables.tfvars

apply: init
    terraform apply --var-file=variables.tfvars --auto-approve