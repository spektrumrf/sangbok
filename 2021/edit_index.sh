#!/bin/bash

OLD_IFS="$IFS"
IFS=$'\n'

cp sangbok.ind sangbok.ind.bak

function itemLine() {

	line=$1
	
	#echo "$line"
	#echo "${line%'{'*}"
	
	item="${line%%' '*}"
	#echo "ITEM [$item]"
	
	text="${line%\\hyperpage*}"
	text="${text#*\\item }"
	#echo "TEXT [$text]"
	
	page_number="${line##*'{'}"
	page_number="${page_number%'}'}"
	#echo "PAGE NUMBER [$page_number]"
	
	new_line="$item \hyperlink{page.$page_number}{$text $page_number}"
	#echo "$new_line"
	
	echo "$new_line"
}

while read -r line; do
	if [[ $line == *\\item* ]]; then
		line=$(itemLine $line)
	fi
	echo "$line"
done < sangbok.ind


IFS="$OLD_IFS"