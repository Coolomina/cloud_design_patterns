build:
	docker-compose build

up:
	docker-compose up

install_deps:
	docker-compose run consumer bundle install
	docker-compose run backend1 bundle install

chaos:
	docker-compose pause backend1
