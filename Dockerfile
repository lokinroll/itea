FROM nginx

LABEL MAINTAINER="Mykola Pugach lokinroll@gmail.com"

ENV NAME=$NAME
ENV AGE=$AGE

RUN mkdir /var/www -p
RUN mkdir /app
WORKDIR /app

COPY docker-entrypoint.sh ./
RUN chmod +x ./docker-entrypoint.sh

ENTRYPOINT [ "./docker-entrypoint.sh"]