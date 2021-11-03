build:
	docker build -t yandexcloud-yc .

run:
	docker run \
		-v $${PWD}/ubuntu:/home/ubuntu \
		yandexcloud-yc:latest tail -f /dev/null

exec:
	docker exec -it $$(docker ps |awk '/yandexcloud-yc/{print $$1}') bash
