.DEFAULT_GOAL := help
.PHONY: help
help: ## Display this help
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

DOMAIN = localhost
.PHONY: config-update
config-update: ## Update configuration for all services with DOMAIN variable (e.g. make config-update DOMAIN=example.com)
	@echo "Updating configuration for all services..."
	@sed -i -- 's/localhost/${DOMAIN}/g' **/*.* */**/*.*

.PHONY: traefik-start
traefik-start: ## Start Traefik
	@echo "Starting Traefik..."
	@docker-compose -f traefik/docker-compose.yml up -d

.PHONY: traefik-stop
traefik-stop: ## Stop Traefik
	@echo "Stopping Traefik..."
	@docker-compose -f traefik/docker-compose.yml down

.PHONY: traefik-restart
traefik-restart: traefik-stop traefik-start ## Restart Traefik

.PHONY: portainer-start
portainer-start: ## Start Portainer
	@echo "Starting Portainer..."
	@docker-compose -f portainer/docker-compose.yml up -d

.PHONY: portainer-stop
portainer-stop: ## Stop Portainer
	@echo "Stopping Portainer..."
	@docker-compose -f portainer/docker-compose.yml down

.PHONY: portainer-restart
portainer-restart: portainer-stop portainer-start ## Restart Portainer

.PHONY: bitwarden-start
bitwarden-start: ## Start Bitwarden
	@echo "Building Bitwarden..."
	@docker-compose -f docker-compose.yml up -d

.PHONY: bitwarden-stop
bitwarden-stop: ## Stop Bitwarden
	@echo "Stopping Bitwarden..."
	@docker-compose -f docker-compose.yml down

.PHONY: bitwarden-restart
bitwarden-restart: bitwarden-stop bitwarden-start ## Restart Bitwarden
