#!/usr/bin/env bash

IFS=$'\n'
OUTDIR=./floppy/floppy
PATCH_SCRIPT="$OUTDIR/patch.sh"
export INITIAL_COMMIT=bc9bcff4c56599645728fa4da9895846eeb37301
ct=0

./mount.sh

mkdir -p $OUTDIR
echo > $PATCH_SCRIPT

find "$OUTDIR" -name \*.src -exec rm {} \;

for file in `git diff --name-only $INITIAL_COMMIT -- kernel include boot commands drivers etc lib servers tools`; do
	ct=$(( ct + 1 ))
	tempname="$ct.` basename "$file"`.src"
	cp "$file" "$OUTDIR/$tempname"
	echo "cp '$tempname' '/usr/src/$file'" >> "$PATCH_SCRIPT"
done

find floppy -name '.Trash*' -exec rm -r {} \;

sudo umount floppy

