app=hadoop

build-hadoop:
	docker build -t ${app} -f Dockerfile .

start-hadoop:
	docker run -it --name ${app} --rm -p 50070:50070 -p 8088:8088 ${app}:latest
