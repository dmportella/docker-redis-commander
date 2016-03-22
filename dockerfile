from node:argon
MAINTAINER Daniel Portella
ARG CONT_IMG_VER
ARG USER_ID=431
ARG GROUP_ID=433

LABEL version ${CONT_IMG_VER}
LABEL description Redis commander default install

ENV CONT_IMG_VER ${CONT_IMG_VER}
ENV COMMANDER_USER guest
ENV COMMANDER_USER_PWD guest

RUN mkdir app && cd app

ADD app-run.sh /app/

RUN chmod -x /app/app-run.sh

RUN npm install -g redis-commander@0.3.2 --silent

RUN groupadd -r appgroup -g ${GROUP_ID} && \
    useradd -u ${USER_ID} -r -g appgroup -d /app -s /sbin/nologin -c "app user" app-user && \
    chown -R app-user:appgroup /app && \
    chmod -R 774 /app

EXPOSE 8080

USER app-user

WORKDIR /app

CMD ["/app/app-run.sh"]
