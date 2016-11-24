# Local work
build: 
	docker build -t traherom/caddyproxy:latest .

run: build
	docker run -it traherom/caddyproxy
