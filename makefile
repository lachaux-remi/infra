start:
	@docker compose -f $(service)/docker-compose.yml up -d --build

stop:
	@docker compose -f $(service)/docker-compose.yml down

restart:
	@make stop service=$(service)
	@make start service=$(service)

update:
	@docker compose -f $(service)/docker-compose.yml pull
	@make restart service=$(service)