#!/bin/bash

##
# Colors for the different outputs... Makes it easier to see
# 	when the different functions are run.
blue='\e[0;34m'
green='\e[0;32m'
red='\e[0;31m'
endColor='\e[0m'

##
# Removes the .mx* files to prepare for the 'musixflx' run
function remove_mx_files {
	echo -e "${blue}[info] ==========================================${endColor}"
	echo -e "${green}[info] trying to remove ./*.mx*${endColor}"

	for file in ./*.mx*; do
		if [ -e $file ]; then
			echo "[info] Removing \"$file\""
		
			# Removing the .mx1 and .mx2 files
			# The .mx2 file is setting the music score correctly
			rm $file
		fi
	done
}

##
# Run the command and check error codes if the process stops suddenly
# 	This function doesn't work properly with the 'pdflatex'
#	(it wont shutdown on error, but rather prompts for input.)
function run_command {
	"$@"
	
	local status=$?
	if [ $status -ne 0 ]; then
		echo -e "${red}[error] Exception while running $1${endColor}" >&2
	else
		echo -e "${green}[info] completed${endColor}"
	fi
	
	return $status
}

##
# Runs the 'pdflatex' and looks for specific keywords in the output.
#	Keywords:
#			info
#			Info
#			warning
#			Warning
#			error
#			Error
#			!
#			Underfull
#			Overfull
function run_pdflatex {
	echo -e "${blue}[info] ==========================================${endColor}"
	echo -e "${green}[info] Running pdflatex - $1${endColor}"
	
	run_command pdflatex sangbok | grep "info\|Info\|warning\|Warning\|error\|Error\|!\|Underfull\|Overfull"
}

##
# Runs the 'musixflx' command on the songbook. Generating the note sheets.
#	You should remove the .mx* files before running this function
function run_musixflx {
	echo -e "${blue}[info] ==========================================${endColor}"
	echo -e "${green}[info] Running musixflx - $1${endColor}"

	# Run musixflx to generate the .mx2 file
	run_command musixflx sangbok
}

##
# Runs 'texindy' on the songbook, generating the index.
#	The function 'index_fix' is needed to change the default letter group to
#	"0-9", so that numbers are shown under a header in the index.
function run_makeindex {
	echo -e "${blue}[info] ==========================================${endColor}"
	echo -e "${green}[info] Running makeindex${endColor}"

	# Run makeindex to create the index from .idx-file
	#run_command makeindex sangbok
	
	texindy -L swedish -C utf8 -M idxstyle.xdy sangbok.idx
}

##
# Hot fix to the default letter group in 'xindy'. All entries beginning on an
# 	Arabic Number are placed in the default letter group. Haven't found a way
# 	around this yet.
function index_fix {

	if [ -e sangbok.ind ]; then
		echo "Changing \lettergroupDefault{default} to \lettergroup{0-9}"
		sed s/lettergroupDefault{default}/lettergroup{0-9}/ sangbok.ind >sangbok_temp.ind
		mv sangbok_temp.ind sangbok.ind
		echo "Done!"
	fi
	
}

##
# 'xindy' makes a hyperpage link by clicking on the page number in the index
# 	this function replaces all hyperpage references with a hyperlink tag, 
#	making the entire line clickable instead of just the page number.
#
#	If you want more references to the same index entry, you shouldn't
#	use this function.
function change_hyperpage_to_hyperlink {
	
	if [ -e sangbok.ind ]; then
		echo "Changing hyperpage to hyperlink"
	fi
	
	./edit_index.sh > sangbok_temp.ind
	mv sangbok_temp.ind sangbok.ind
}


function run_biber {
	echo -e "${blue}[info] ==========================================${endColor}"
	echo -e "${green}[info] Running biber${endColor}"
	
	run_command biber sangbok
}



#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# BEGIN index hot fixes
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
index_fix
change_hyperpage_to_hyperlink
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# END index hot fixes
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


#--------------------------------
# Create the bibs
#--------------------------------
run_biber


#--------------------------------
# Fix reference links and
# Create the final PDF
#--------------------------------
run_pdflatex 3

run_pdflatex 4

