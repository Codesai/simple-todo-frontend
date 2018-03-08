help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

build: ## Initialize containers for prepare the application
	docker-compose build

bundle: ## Bundle the web for production environment
	docker-compose build
	docker-compose run altas yarn build

run: ## Starts the developer environment with hot reloading
	docker-compose build
	docker-compose up --force-recreate

clean: ## Clean all related containers from this compose
	docker-compose down -v --remove-orphans

deep_clean: ## Clean all related containers and images from this compose
	docker-compose down -v  --rmi 'all' --remove-orphans