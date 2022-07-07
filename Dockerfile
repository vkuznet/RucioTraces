FROM golang:latest as go-builder
MAINTAINER Valentin Kuznetsov vkuznet@gmail.com

ARG CGO_ENABLED=0
ADD server server
ADD etc etc
RUN mkdir /data && cd server && make && cp server /data/rucio-tracer && cp -r ../etc /data

FROM alpine:3.16
COPY --from=go-builder /data /data
