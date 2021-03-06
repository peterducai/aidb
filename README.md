# aidb
AIDB stands for **asset inventory database** also known as CMDB (configuration management database).


# Selinux & Firewalld

```
sudo semanage port -a -t postgresql_port_t -p tcp 5432
sudo firewall-cmd --add-port=5432/tcp --permanent
```

## Psql

```bash
export PGPASSWORD=<password>
psql -h <host> -d <database> -U <user_name> -p <port> -a -w -f <file>.sql
```

## Docker

to run DB use

```bash
sudo docker stop aidb1 && sudo docker rm aidb1
sudo docker run -it --name aidb1 -p 5432:5432 -e POSTGRES_PASSWORD=post123. -d peterducai/aidb:latest
sudo docker logs aidb1
```
# Bender Ansible

> pip3 install --user ansible-bender
> ansible-bender build ./bender_playbook.yaml


# Podman & Buildah

```
podman run -it aidb:latest echo "Hello world!"

```

> see also https://github.com/peterducai/aidb_portal


# TODOs

* remove docker, use podman
* rebuild and test
* test with PG11
* add Content views (Satellite friendly) like Dev, QA, and Production..

# copy of former dockerfile

```
FROM postgres

ENV POSTGRES_USER docker
ENV POSTGRES_PASSWORD post123
ENV POSTGRES_DB aidb

COPY 1_aidb_deploy.sql /docker-entrypoint-initdb.d/1_aidb_deploy.sql
 #will be executed automatically
```