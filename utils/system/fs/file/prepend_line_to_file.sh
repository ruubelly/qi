#!/bin/bash -e


# call this function to write to stderr
printf_stderr ()
{
    printf "$@" >&2
}

# Example invocation:
#   prepend_line_to_file line_to_prepend file_path
prepend_line_to_file() (
    local line_to_prepend="$1"
    local file_path="$2"

    # Assertions
    [[ "$#" -ne 2 ]] && printf_stderr "Error in prepend_line_to_file.sh - Requires exactly 2 parameters, you passed: %s\n" "$*" && exit 1
    [[ -z "$line_to_prepend" ]] && printf_stderr "Error in prepend_line_to_file.sh - line_to_prepend is empty string\n" && exit 1
    [[ ! -f "$file_path" ]] && printf_stderr "Error in prepend_line_to_file.sh - file_path: %s is not a valid file\n" "$file_path" && exit 1

    printf "%s" "$(cat <(echo "$line_to_prepend") <(cat "$file_path"))" > "$file_path"
)
