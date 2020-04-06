#!/bin/bash

aidb=aidb

# dnf -y install podman skopeo buildah

# DISTROS
buildah from --name aidb fedora
#fedora_container=$(buildah from fedora)

#mnt=(buildah mount $aidb)
#dnf -y install --installroot $mnt postgresql-server -y
buildah run $aidb -- dnf update -y
buildah run $aidb -- rm -rf /var/lib/postgresql/aidb
buildah run $aidb -- dnf install postgresql-server -y
buildah run $aidb -- systemctl enable postgresql

buildah copy $aidb ./aidb.sql /usr/local/bin
sleep 2
echo 'AIDB.sql COPIED!!!'
sleep 2
buildah config --cmd /usr/local/bin/aidb.sql $aidb


buildah config --user postgres aidb
buildah config --env POSTGRES_USER=postgres aidb
buildah config --env PGDATA=/var/lib/postgresql/aidb aidb
buildah config --env POSTGRES_PASSWORD=postgres aidb
buildah config --port 5432 $aidb
buildah run aidb -- /bin/initdb -D /var/lib/pgsql/aidb
buildah run aidb -- psql -h 0.0.0.0:5432 -d aidb -U postgres  -a -f /usr/local/bin/aidb.sql


# only for debugging purpose
# buildah run $container bash  
#buildah commit aidb "quay.io/peterducai/aidb"
buildah commit aidb "peterducai/aidb"




echo "> > > Waiting for PostgreSQL to start"
# until podman exec postgres psql -U postgres -c '\list'
# do
#   echo "> > > > > > PostgreSQL is not ready yet"
#   sleep 1
# done







# buildah commit "$ctr1" "${2:-$USER/lighttpd}"

# podman run -e PGDATABASE=test -e PGUSERNAME=test -e PGPASSWORD=test --detach -p 5432:5432 localhost/peterducai/aidb

# psql -p 5432 -h localhost -U test test


# podman run -d --pod postgresql -e POSTGRES_PASSWORD=password postgres:latest
# podman run -d --pod postgresql -e DATA_SOURCE_NAME="postgresql://postgres:password@localhost:5432/postgres?sslmode=disable" wrouesnel/postgres_exporter
# curl localhost:9187/metrics


# podman generate kube postgresql > postgresql.yaml
# podman pod rm postgresql -f
# podman play kube postgresql.yaml