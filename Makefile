export CURRENT_DIR := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))
SHELL = /bin/bash

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

help:
	@grep -E '^[a-zA-Z_0-9%-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "${GREEN}%-12s${RESET} %s\n", $$1, $$2}'

.PHONY: bootstrap
bootstrap: ## is used solely for fulfilling dependencies of the project
	cd website/infrastructure && $(MAKE) bootstrap

.PHONY: setup
setup: ## is used to set up a project in an initial state
	@echo "is used to set up a project in an initial state"

.PHONY: update
update: ## is used to update the project after a fresh pull
	@echo "is used to update the project after a fresh pull"

.PHONY: server
server: ## is used to start the application
	cd website/infrastructure && $(MAKE)

.PHONY: test
test: ## is used to run the test suite of the application
	cd website/infrastructure && $(MAKE) test

.PHONY: destroy
destroy: ## is used to destroy your application
	cd website/infrastructure && $(MAKE) destroy

.PHONY: clean
clean: ## is used to reset the infrastructure o an inditial state
	@echo "is used to reset the infrastructure o an inditial state"