FROM golang:latest as go-builder
MAINTAINER Valentin Kuznetsov vkuznet@gmail.com

ARG CGO_ENABLED=0
RUN make
RUN mkdir /data && cp server/server /data/rucio-tracer && cp etc /data

FROM alpine
COPY --from=go-builder /data /
