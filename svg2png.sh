#!/bin/bash

if [ "$1" == "" ]; then
    echo "$0 svg_file1 [svg_file2 ...]"
    exit 0
fi

while [ "$1" != "" ]
do
    svg_file=$1
    if [ -f $svg_file ]; then
        svg_base=${svg_file%.*}
        png_file=${svg_base}.png
	echo inkscape -z -e $png_file $svg_file
	inkscape -z -e $png_file $svg_file
    fi
    shift
done
