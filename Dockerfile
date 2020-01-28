FROM postgres

ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD post123
ENV POSTGRES_DB aidb

COPY aidb.sql /docker-entrypoint-initdb.d/aidb.sql

CMD pg_ctl -D /var/lib/postgresql/data -l logfile -w restart start 