FROM postgres

ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD post123
ENV POSTGRES_DB aidb

COPY aidb_deploy.sql /docker-entrypoint-initdb.d/
