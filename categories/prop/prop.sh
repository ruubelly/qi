#!/bin/bash

source "${APP_DIR}/utils/general/show-category-commands.sh"
source "${APP_DIR}/utils/general/run-category-command.sh"

prop() {
    if [[ $# -lt 2 ]] || [[ "$2" == 'help' ]]; then
        show_category_commands "$1"
        exit 0
    else
        run_category_command "$@"
    fi
}

prop "$@"
