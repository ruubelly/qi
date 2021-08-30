#!/bin/bash -e

# Example:
#   entry_in_path /usr/local/bin
entry_in_path() (
    [[ $# -ne 1 ]] && printf "Error in entry_in_path.sh - there is exactly one require parameter" && exit 1
    local entry="$1"
    if [[ ":$PATH" == *":${entry}:"* ]]; then printf 'true'; else printf 'false'; fi
)
