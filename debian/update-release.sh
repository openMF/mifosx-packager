#!/bin/bash

now_date=`date`
dir=$PWD
cd dists/stable
cat <<EOF > Release
Origin: mifos.sanjosesolutions.in
Label: Mifos X Repository
Suite: stable
Codename: stable
Date: $now_date
Architectures: i386 amd64
Components: main
Description: Debian Repository for Mifos X.
MD5Sum:
EOF
for f in `find main -type f`; do
	f_size=`stat -c %s $f`
	f_md5sum=`md5sum $f|cut -d ' ' -f1`
	echo " $f_md5sum $f_size $f" >> Release
done
gzip -c Release > Release.gz
cd $dir

