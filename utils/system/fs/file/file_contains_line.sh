#!/bin/bash -e

# Example
#    file_contains_line file_path line
file_contains_line() (
    [[ "$#" -ne 2 ]] && printf "Error in file_contains_line.sh: Exactly 2 arguments required. You passed %s" "$*" && exit 1
    [[ ! -f "$1" ]] && printf "Error in file_contains_line.sh: File path %s is not valid." "$1" && exit 1

    local file_path="$1"
    local line="$2"
    if grep -qFx "${line}" "${file_path}"; then exit 0; else exit 1; fi
)
