FROM arm64v8/debian:bullseye-slim

ENV DEBIAN_FRONTEND noninteractive

ENV UID=1000
ENV GID=200

RUN apt-get update
