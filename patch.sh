#!/usr/bin/env bash

IFS=$'\n'
OUTDIR=/media/markham/floppy/patches
PATCH_SCRIPT="$OUTDIR/patch.sh"
ct=0
echo > $PATCH_SCRIPT
mkdir -p $OUTDIR

find "$OUTDIR" -name \*.patch -exec rm {} \;

for line in `git status -s`; do
	line=`echo $line | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'`
	if [[ $line =~ ^M ]]; then
		ct=$(( ct + 1 ))
		file=`echo $line | cut -d' ' -f3`
		patchfile=minix.$ct.patch
		# echo $file
		# git difftool --extcmd=diff --no-prompt --cached -- $file
		git difftool --extcmd=diff --no-prompt --cached -- $file > $OUTDIR/$patchfile
		echo patch /usr/src/${file#minix} $patchfile >> $PATCH_SCRIPT
	fi
done
