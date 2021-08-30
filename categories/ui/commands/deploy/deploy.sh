#!/bin/bash -e

build_and_copy_ui() {
    pushd "${UI_PATH}"
    npm run build

    local tf_ui_static_asset_dir="${TF_PATH}/static-resources/foreign/shendit-ui"
    mkdir -p "${tf_ui_static_asset_dir}"

    rm -rf "${tf_ui_static_asset_dir:?}/*"
    cp build/* "${tf_ui_static_asset_dir}"

    popd
}

deploy_terraform(){
    pushd "${TF_PATH}"
    terraform apply
    popd
}

deploy() {
    build_and_copy_ui
    deploy_terraform
}

deploy "$@"
