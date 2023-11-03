requirement:
	wget https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip && \
    unzip terraform_${TF_VERSION}_linux_amd64.zip -d /opt/

init: requirement
	terraform init
plan: init
	terraform plan --var-file=variables.tfvars

apply: init
	terraform apply --var-file=variables.tfvars --auto-approve

