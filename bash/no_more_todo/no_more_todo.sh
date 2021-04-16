#!/bin/bash

test_ret=$(grep -E -R -n "^.*?( |\/|#)(T|t)(O|o)-?(D|d)(O|o)s?(:| )?.*?$" *)

if [ "$?" -eq "0" ]; then
	printf "Unremoved TO-DOs:\n"
	printf "%s" "$test_ret"
	printf "\n"
	exit 1
fi
