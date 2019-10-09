#!/bin/sh
ctr=$(buildah from fedora)
mnt=($buildah mount $ctr)
dnf -y install --installroot $mnt httpd
make install DESTDIR=$mnt myapp
rm -rf $mnt/var/cache $mnt/var/log/*
buildah config --command /usr/bin/myapp -env foo=bar --working-dir=/root $ctr
buildah commit $ctr myapp
buildah push myapp http://quay.io/username/myapp