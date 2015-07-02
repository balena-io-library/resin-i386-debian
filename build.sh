#!/bin/bash

set -o errexit

SUITES='wheezy jessie'
MIRROR='http://ftp.uk.debian.org/debian/'
REPO='resin/i386-debian'
LATEST='jessie'

for suite in $SUITES; do
	dir=$(mktemp --tmpdir=/var/tmp -d)
	date=$(date +'%F')
	
	./mkimage.sh -t $REPO:$suite --dir=$dir debootstrap --variant=minbase --arch=i386 --include=sudo $suite $MIRROR
	rm -rf $dir
	
	docker tag -f $REPO:$suite $REPO:$suite-$date
	if [ $LATEST == $suite ]; then
		docker tag -f $REPO:$suite $REPO:latest
	fi
done
