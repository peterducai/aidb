#!/bin/bash

# dnf -y install buildah

container=$(buildah from fedora)
mnt=($buildah mount $container)
dnf -y install --installroot $mnt postgresql-server -y # postgres 10.7 on fedora 29




buildah run $container bash  # only for debugging purpose