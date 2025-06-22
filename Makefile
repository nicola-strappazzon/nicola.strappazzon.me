SHELL := /bin/bash
GREEN := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
RESET := $(shell tput -Txterm sgr0)

.PHONY: help

help: ## Show this help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "${YELLOW}%-16s${GREEN}%s${RESET}\n", $$1, $$2}' $(MAKEFILE_LIST)

save: ## Save changes into repository automatically.
	@git add .
	@git commit -m "Save changes at: $$(date +%s)"
	@git push

run: ## Run hugo server in local.
	@hugo server --disableFastRender --noHTTPCache --ignoreCache --cleanDestinationDir

svg: ## Create svg file from LaTex file.
	@if [ -z "$(FILE)" ]; then \
		echo "Usage: make svg FILE=formula01"; \
		exit 1; \
	fi
	@latex $(FILE).tex
	@dvisvgm --no-fonts --exact --bbox=min --scale=1.5 $(FILE).dvi

clean: ## Remove build files.
	rm -f *.aux *.log *.dvi
