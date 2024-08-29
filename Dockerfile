FROM postgres:alpine
COPY ./*.sql /docker-entrypoint-initdb.d/
COPY ./setup/*.sql /docker-entrypoint-initdb.d/
