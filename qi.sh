#!/bin/bash -e

export APP_DIR="/Users/jedangarcia/Documents/code/qi"
export APP_NAME="qi"

print_qi_into() {
    printf "\n"
    printf "Categories\n"
    printf "    mac \n"

    printf "\n\n"
}

qi() {
    if [[ $# -lt 1 ]]; then
        print_qi_into
    else
        local category="${1}"
        local categoryScriptPath="${APP_DIR}/categories/${category}/${category}.sh"

        if [[ -f "${categoryScriptPath}" ]]; then
            # shellcheck disable=SC1090
            source "${categoryScriptPath}" "$@"
        else
            printf "The category you tried to invoke does not exist.\n"
            exit 1
        fi
    fi
}

qi "$@"
