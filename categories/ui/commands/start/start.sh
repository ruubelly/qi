#!/bin/bash -e

start_ui_webdev() (
    pushd "${UI_PATH}"

    if [[ ! -d "${UI_PATH}/node_modules" ]]; then
      npm install
    fi

    npm run start
    popd
)

start() {
    start_ui_webdev
}

start "$@"
