# Local work
build: 
	docker build -t traherom/caddyproxy-docker:latest .

run: build
	docker run -it traherom/caddyproxy-docker
