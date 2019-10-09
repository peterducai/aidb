#!/bin/bash

# dnf -y install podman skopeo buildah

# DISTROS
rhel_container=$(buildah from registry.redhat.io/rhel8/postgresql-10)
fedora_container=$(buildah from fedora)

#mnt=(buildah mount $rhel_container)
#dnf -y install --installroot $mnt postgresql-server -y
buildah run "$rhel_container" -- dnf update -y
buildah run "$rhel_container" -- dnf install postgresql-server -y

buildah copy \$newcontainer ./1_aidb_deploy.sql /usr/local/bin
buildah config --cmd /usr/local/bin/1_aidb_deploy.sql \$newcontainer
#CMD pg_ctl -D /var/lib/postgresql/data -l logfile -w restart start 
buildah run $container pg_ctl -D /var/lib/postgresql/data -l logfile -w restart start 

# buildah run $container bash  # only for debugging purpose






# $ cat > lighttpd.sh <<"EOF"
# #!/usr/bin/env bash -x

# ctr1=$(buildah from "${1:-fedora}")

# ## Get all updates and install our minimal httpd server
# buildah run "$ctr1" -- dnf update -y
# buildah run "$ctr1" -- dnf install -y lighttpd

# ## Include some buildtime annotations
# buildah config --annotation "com.example.build.host=$(uname -n)" "$ctr1"

# ## Run our server and expose the port
# buildah config --cmd "/usr/sbin/lighttpd -D -f /etc/lighttpd/lighttpd.conf" "$ctr1"
# buildah config --port 80 "$ctr1"

# ## Commit this container to an image name
# buildah commit "$ctr1" "${2:-$USER/lighttpd}"