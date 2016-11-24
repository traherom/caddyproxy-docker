# Local work
build: Dockerfile conf-builder.sh entry-point.sh
	docker build -t traherom/caddyproxy-docker:latest .

run: build
	docker run -it traherom/caddyproxy-docker

version: build
	docker run -it traherom/caddyproxy-docker:latest /usr/bin/caddy --version