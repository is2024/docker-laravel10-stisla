setup:
	@make build
	@make up
	@make composer-update
	docker exec stisla /bin/sh -c "php artisan key:generate"

build:
	docker-compose build --no-cache --force-rm

stop:
	docker-compose stop

up:
	docker-compose up -d

composer-update:
	docker exec stisla /bin/sh -c "composer update"

data:
	docker exec stisla /bin/sh -c "php artisan migrate"