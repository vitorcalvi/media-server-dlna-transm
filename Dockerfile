FROM debian:stable-slim

ENV DEBIAN_FRONTEND noninteractive
ENV UID=1000
ENV GID=200

RUN apt-get update && apt upgrade -y && apt autoremove -y
