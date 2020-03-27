#!/bin/bash

dcig_error() {
	printf "\n\e[91mAn error occurred:\e[39m\n"
	echo $1
	[[ -z "$2" ]] || cat $2
}

dcig() {
	echo "Removing images with keyword $1"

	output=`docker images | tail -n +2 | egrep -i "$1"`

	[[ -z "$output" ]] && \
	dcig_error "No images with the keyword $1" && \
	return 1

	names=`echo "$output" | awk '{ printf "\t- %s:%s\n", $1, $2 }'`

	echo "Images to be removed:"
	printf "$names\n"
	
	error_file=`mktemp`
	echo "$output" | awk '{ print $3 }' | \
	xargs -r docker rmi -f 2> $error_file || dcig_error "" "$error_file"
}
