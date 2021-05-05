#!/bin/bash

blue='\e[0;34m'
green='\e[0;32m'
red='\e[0;31m'
endColor='\e[0m'

function remove_files {
	for file in $1; do
		if [ -e $file ]; then
			echo "[info] Removing \"$file\""
		
			# Removing the .mx1 and .mx2 files
			# The .mx2 file is setting the music score correctly
			rm $file
		fi
	done
}

# Cleaning away all the pdflatex generated files.

echo -e "${blue}[info] ==========================================${endColor}"
echo -e "${green}[info] Removing LaTex output...${endColor}"
	
remove_files "./*.aux"
remove_files "**/*.aux"
remove_files "./*.log"
remove_files "**/*.log"
remove_files "./*.mx*"
remove_files "**/*.mx*"
remove_files "./*.out"
remove_files "**/*.out"
remove_files "./*.toc"
remove_files "**/*.toc"
remove_files "./*.synctex.gz"
remove_files "**/*.synctex.gz"
remove_files "./*.dvi"
remove_files "**/*.dvi"
remove_files "./*.ind.bak"
remove_files "**/*.ind.bak"

remove_files "./*.idx"
remove_files "**/*.idx"
remove_files "./*.ilg"
remove_files "**/*.ilg"
remove_files "./*.ind"
remove_files "**/*.ind"

remove_files "./*.bbl"
remove_files "**/*.bbl"
remove_files "./*.bcf"
remove_files "**/*.bcf"
remove_files "./*.blg"
remove_files "**/*.blg"
remove_files "./*.run.xml"
remove_files "**/*.run.xml"

echo -e "${green}[info] Done!${endColor}"
