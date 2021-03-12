export PROJECT_ID=24996431
export GITLAB_PASSWORD=${GITLAB_ACCESS_TOKEN}
export GITLAB_USERNAME=aasanchez
export TF_ADDRESS=https://gitlab.com/api/v4/projects/${PROJECT_ID}/terraform/state/website
export TF_VAR_AWS_ACCESS_KEY=$(shell aws configure get default.aws_secret_key_id)
export TF_VAR_AWS_SECRET_KEY=$(shell aws configure get default.aws_secret_access_key)
CURRENT_DIR ?= ../..


ifneq (,$(findstring xterm,${TERM}))
	BLACK        := $(shell tput -Txterm setaf 0)
	RED          := $(shell tput -Txterm setaf 1)
	GREEN        := $(shell tput -Txterm setaf 2)
	YELLOW       := $(shell tput -Txterm setaf 3)
	LIGHTPURPLE  := $(shell tput -Txterm setaf 4)
	PURPLE       := $(shell tput -Txterm setaf 5)
	BLUE         := $(shell tput -Txterm setaf 6)
	WHITE        := $(shell tput -Txterm setaf 7)
	RESET        := $(shell tput -Txterm sgr0)
else
	BLACK        := ""
	RED          := ""
	GREEN        := ""
	YELLOW       := ""
	LIGHTPURPLE  := ""
	PURPLE       := ""
	BLUE         := ""
	WHITE        := ""
	RESET        := ""
endif

default: server

.PHONY: help
help:
	@grep -E '^[a-zA-Z_0-9%-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "${GREEN}%-12s${RESET} %s\n", $$1, $$2}'

.PHONY: bootstrap
bootstrap: ## is used solely for fulfilling dependencies of the project
	@echo "website: ${RED}boostrap${RESET}"
	@source $(CURRENT_DIR)/scripts/terraform.sh && terraformInit "$(CURRENT_DIR)/website/infrastructure"

.PHONY: server
server: bootstrap ## is used to start the application
	@echo "website: ${RED}server${RESET}"
	@terraform apply

.PHONY: test
test: bootstrap ## is used to run the test suite of the application
	@terraform validate

.PHONY: clean
clean: ## is used to reset the infrastructure o an inditial state
	@rm -rf .terraform/

.PHONY: destroy
destroy: ## is used to reset the infrastructure o an inditial state
	@terraform destroy -force
