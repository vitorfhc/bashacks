#!/bin/bash

cd "$(dirname ${BASH_SOURCE[0]})"
BASE_DIR="$(pwd)"
TARGET_FILE="$HOME/.bashrc"

hack_files=()

error() {
	printf "\e[91mERROR:\e[39m $1\n"
	exit 1
}

pre_install() {
	# Does hacks folder exists?
	[[ -d "hacks" ]] || \
	error "Directory $BASE_DIR hacks/ not found"
	
	# Append all files in hacks folder
	# to the hack_files array
	for f in hacks/*; do
		hack_files+=("`basename $f`")
	done

	# Is the hack_files array empty?
	[[ ${#hack_files[@]} -gt 0 ]] || \
	error "No files found in $BASE_DIR/hacks/"

	# Do you have the target file?
	[[ -f $TARGET_FILE ]] || \
	error "No $TARGET_FILE file found"
}

safe_source() {
	path="$BASE_DIR/hacks/$1"
	cmd="[[ -f $path ]] && source $path"
	
	printf "%s\n\n" "$cmd"
}

install() {
	printf "\n\n###### BASHACKS ######\n\n" >> $TARGET_FILE
	for item in ${hack_files[@]}; do
		echo $item
		safe_source "$item" >> $TARGET_FILE
	done
	printf "######################\n" >> $TARGET_FILE
}

pre_install
install
