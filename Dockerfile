FROM postgres:latest

COPY aidb_pg10.sql /go/src/project/
WORKDIR /go/src/project/
