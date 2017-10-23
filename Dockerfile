FROM postgres

RUN mkdir /app
WORKDIR /app

ADD *.sh /app/
