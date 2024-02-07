.PHONY: build up down

all: checkDocker build up

build:
	docker-compose build

up:
	docker-compose up

down:
	docker-compose down

checkDocker:
	@if [ -z "$$(systemctl is-active docker)" ]; then \
        echo "Docker service is not running. Starting it..."; \
        systemctl start docker; \
    else \
        echo "Docker service is already running."; \
    fi
