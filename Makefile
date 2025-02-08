.PHONY: help
help: ## display this help screen
	@awk 'BEGIN {FS = ":.*##"; printf "\nUsage:\n  make \033[36m<target>\033[0m\n"} /^[a-zA-Z_-]+:.*?##/ { printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2 } /^##@/ { printf "\n\033[1m%s\033[0m\n", substr($$0, 5) } ' $(MAKEFILE_LIST)

.PHONY: kind
kind: ## make kind
	@kind create cluster --config ./kind/config.yaml

.PHONY: develop
develop: ## make develop
	@kubectl kustomize k8s/overlays/develop 
	@kubectl apply --kustomize ./k8s/overlays/develop

.PHONY: production
production: ## make production
	@kubectl kustomize k8s/overlays/production
	@kubectl apply --kustomize ./k8s/overlays/production

.PHONY: destroy
destroy: ## make destroy
	@kind delete cluster
