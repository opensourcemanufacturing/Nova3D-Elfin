#!/bin/sh
set -x
/mnt/extsd/busybox cp /mnt/extsd/busybox /bin
cd /bin
rm cat
rm cp
rm mv
ln -s busybox cat
ln -s busybox cp
ln -s busybox mv
ln -s busybox vi
ln -s busybox which
ln -s busybox who
ln -s busybox tar
ln -s busybox touch
ln -s busybox gzip
ln -s busybox gunzip
ln -s busybox dmesg
ln -s busybox su
ln -s busybox whoami
ln -s busybox grep
ln -s busybox dd
ln -s busybox find
ln -s busybox uname
ln -s busybox less
ln -s busybox seq
ln -s busybox du
ln -s busybox sed
