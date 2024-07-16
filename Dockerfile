ARG ALPINE_VERSION="3.20"
ARG GOLANG_VERSION="1.22"

FROM golang:${GOLANG_VERSION}-alpine${ALPINE_VERSION} as build

RUN apk add git

ARG TAILSCALE_VERSION="1.68.2"
RUN GOBIN=/opt go install tailscale.com/cmd/nginx-auth@v${TAILSCALE_VERSION}

RUN ls -l ${GOBIN}

FROM alpine:${ALPINE_VERSION}

COPY --from=build /opt/nginx-auth /opt/nginx-auth
