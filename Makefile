.PHONY: .all
.all: build

.PHONY: build
build:
	docker build -t flared/tailscale-nginx-auth .

.PHONY: run-exec
run-exec: build
	docker run -it flared/tailscale-nginx-auth sh
