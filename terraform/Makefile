BUCKET ?= mysociety-generic-tfstate
KEY ?= cts-staging-mysociety-org.tfstate

.PHONEY: clean init plan apply destroy

clean:
	@echo "==> Removing state"
	rm -fr .terraform/

init: clean
	@echo "==> Getting modules"
	terraform get
	@echo "==> Initialising and configuring remote state"
	terraform init -backend-config="bucket=$(BUCKET)" -backend-config="key=$(KEY)"

plan: init
	@echo "==> Running plan"
	terraform plan

apply: plan
	@echo "==> Running apply"
	terraform apply

destroy:
        @echo "==> Disabled for this deployment"
