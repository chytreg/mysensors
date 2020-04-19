IMG := chytreg/mysensors:rs485-mqtt-latest

build:
	docker build -t $(IMG) .

push:
	docker push $(IMG)
