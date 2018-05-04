FROM postgres

ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD post123
ENV POSTGRES_DB aidb

ADD aidb_deploy.sql /docker-entrypoint-initdb.d  #will be executed automatically
