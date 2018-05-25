#!/bin/bash
#RENAME, TRIM, RESIZE

if (( $# != 3 ))
then
	echo "Usage: $(basename $0) <extension_from> <extension_to> <size>"
	echo "Example: $(basename $0) .jpg .png 200x"
	exit 1
fi

for f in *$1
do
	f_ren="${f%$1}$2"
	echo "Processing: $f -> $f_ren"
	convert $f $f_ren
	convert -trim $f_ren $f_ren
	convert -resize $3 $f_ren $f_ren
done