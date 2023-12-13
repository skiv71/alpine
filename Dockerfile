FROM debian:12-slim

ARG DEPS="iputils-ping netcat"

SHELL ["/bin/bash", "-c"]

RUN apt-get update >/dev/null && \
    apt-get install -y --no-install-recommends ${DEPS} &>/dev/null && \
    apt-get clean

COPY . .

RUN chmod +x *.sh

EXPOSE 4001 5001 8080-8081

ENTRYPOINT [ "./entrypoint.sh" ]
