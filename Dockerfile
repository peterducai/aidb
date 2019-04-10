FROM postgres

ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD post123
ENV POSTGRES_DB aidb

COPY 1_aidb_deploy.sql /docker-entrypoint-initdb.d/1_aidb_deploy.sql

CMD pg_ctl -D /var/lib/postgresql/data -l logfile -w restart start 