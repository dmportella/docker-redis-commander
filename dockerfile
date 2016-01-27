from node:argon
MAINTAINER Daniel Portella
LABEL version="1.0.0"
LABEL description="Redis commander default install"

RUN mkdir app && cd app

ADD app-run.sh /app/

RUN chmod -x /app/app-run.sh

RUN npm install -g redis-commander --silent

RUN groupadd -r appgroup -g 433 && \
    useradd -u 431 -r -g appgroup -d /app -s /sbin/nologin -c "app user" app-user && \
    chown -R app-user:appgroup /app && \
    chmod -R 777 /app

EXPOSE 8080

USER app-user

WORKDIR /app

CMD ["/app/app-run.sh"]
