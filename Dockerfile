FROM alpine:latest
LABEL maintainer="Christian Mehlmauer <FireFart@gmail.com>"

ENV APP_USER appuser

RUN adduser -g "App User" -D $APP_USER

COPY crontab /var/spool/cron/crontabs/$APP_USER
RUN chmod 0600 /var/spool/cron/crontabs/$APP_USER

ENTRYPOINT "crond"

CMD ["-f", "-d", "8"]