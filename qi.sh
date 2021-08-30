#!/bin/bash -e

export PROPS_PATH="$HOME/.qi/qi.properties"
export TMP="$HOME/.qi/tmp"
mkdir -p "$TMP"


source_props(){
  if [[ -f "${PROPS_PATH}" ]]; then
    # shellcheck disable=SC1090
    source "${PROPS_PATH}"
    else
      printf "Error in qi.sh - Could not find %s. You should rerun the setup script.\n" "${PROPS_PATH}"
      exit 1
  fi
}

print_qi_into() {
    printf "\n"
    printf "Categories\n"
    printf "    mac \n"
    printf "    ui \n"
    printf "\n\n"
}

qi() {
  source_props

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
