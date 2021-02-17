FROM arm32v7/debian:10-slim

ENV DEBIAN_FRONTEND noninteractive

ENV UID=1000
ENV GID=200

RUN apt-get update
