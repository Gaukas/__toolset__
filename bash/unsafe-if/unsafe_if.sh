#!/bin/bash

test_ret=$(grep -E -R -n "^ ?if(\ |\().*?$" * | sed 's/\/\/.*/\/\//' | sed 's/#.*/#/' | grep "=" | grep -v "==" | grep -v "!=" | grep -v "<=" | grep -v ">=")

if [ "$?" -eq "0" ]; then
	printf "Unsafe If statements:\n"
	printf "%s" "$test_ret"
	printf "\n"
	exit 1
fi

printf "No Vulnerabilities found. \n"
