#!/usr/bin/env bash

IFS=$'\n'
OUTDIR=./floppy/floppy
PATCH_SCRIPT="$OUTDIR/patch.sh"
INITIAL_COMMIT=bc9bcff4c56599645728fa4da9895846eeb37301
ct=0
echo > $PATCH_SCRIPT
mkdir -p $OUTDIR

find "$OUTDIR" -name \*.src -exec rm {} \;

for file in `git diff --name-only $INITIAL_COMMIT -- kernel include boot commands drivers etc lib servers tools`; do
	ct=$(( ct + 1 ))
	tempname="$ct.` basename "$file"`.src"
	cp "$file" "$OUTDIR/$tempname"
	echo "cp '$tempname' '/usr/src/$file'" >> "$PATCH_SCRIPT"
done

rm -rf $OUTDIR/.Trash*
rm -rf $OUTDIR/../.Trash*