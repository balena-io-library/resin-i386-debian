#!/bin/bash

set -o errexit

dir=$(mktemp --tmpdir=/var/tmp -d)
	
./mkimage.sh -t $REPO:$SUITE --dir=$dir debootstrap --variant=minbase --arch=i386 --include=sudo $SUITE $MIRROR
