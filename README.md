# aidb
AIDB stands for **asset inventory database** also known as CMDB (configuration management database).



# Bare PG


> /usr/bin/postgresql-setup --initdb
> systemctl enable postgresql
> systemctl restart postgresql

```
sudo -u postgres psql
postgres=# create database aidb;
postgres=# create user aidbuser with encrypted password 'aidbpass#@666';
postgres=# grant all privileges on database aidb to aidbuser;
\q
```

> sudo -u postgres psql < aidb.sql



psql -U postgres -d postgres -c "alter user produser with password 'produser';"

I used the following settings:
pg_hba.conf

local   all             all                                     peer
# IPv4 local connections:
host    all             all             127.0.0.1/32            password  
# IPv6 local connections:
host    all             all             ::1/128                 password

Connection is successful finally for the following command:

psql -U produser -d dbname -h localhost -W 


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