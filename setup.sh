#!/bin/bash -e
source "./utils/system/env/entry_in_path.sh"
source "./utils/system/fs/file/prepend_line_to_file.sh"
source "./utils/system/fs/file/file_contains_line.sh"

# QI Setup Script - Installs QI into path and creates / updates ~/.qi/qi.properties
setup_path() {
    # shellcheck disable=SC2016
    local add_path_cmd_str='export PATH=${PATH}:$HOME/bin'
    local zshrc_path="$HOME/.zshrc"
    local bashrc_path="$HOME/.bashrc"

    if [ ! "$(entry_in_path "$HOME/bin")" == 'true' ]; then
        # Update zshrc
        if [[ -f "$zshrc_path" ]]; then
            if ! file_contains_line "$zshrc_path" "$add_path_cmd_str"; then
                prepend_line_to_file "$add_path_cmd_str" "$zshrc_path"
                printf "    - %s updated successfully.\n" "$zshrc_path"
            else
                printf "    - %s already had the necessary PATH command. Skipping...\n" "$zshrc_path"
            fi
        else
            printf "    - Attempted to update .zshrc, but %s doesn't exist. Skipping...\n" "$zshrc_path"
        fi

        # Update bashrc
        if [[ -f "$bashrc_path" ]]; then
            if ! file_contains_line "$bashrc_path" "$add_path_cmd_str"; then
                prepend_line_to_file "$add_path_cmd_str" "$bashrc_path"
                printf "    - %s updated successfully.\n" "$bashrc_path"
            else
                printf "    - %s already had the necessary PATH command. Skipping...\n" "$bashrc_path"
            fi
        else
            printf "    - Attempted to update .bashrc, but %s doesn't exist. Skipping...\n" "$bashrc_path"
        fi

        printf "*** Please restart your terminal for path changes to take effect ***"
    fi
}

create_qi_alias() {
    local qi_dir
    qi_dir="$(pwd)"

    local qi_bin_dir_path="$HOME/bin"
    mkdir -p "${qi_bin_dir_path}"

    echo """#!/bin/bash -e
export APP_DIR=${qi_dir}
source ${qi_dir}/qi.sh \$@
""" >"${qi_bin_dir_path}/qi"

    chmod +x "${qi_bin_dir_path}/qi"
}

create_properties_file() {
    local terraform_path
    local ui_path

    read -rp "Enter the path to your terraform directory: " terraform_path
    if [[ -d "${terraform_path}" ]]; then
        terraform_path=${terraform_path%/} # remove trailing slash
    else
        printf "Error - %s is not a valid directory path. \n" "${terraform_path}"
        exit 1
    fi

    read -rp "Enter the path to your ui directory: " ui_path
    if [[ -d "${ui_path}" ]]; then
        ui_path=${ui_path%/} # remove trailing slash
    else
        printf "Error - %s is not a valid directory path. \n" "${ui_path}"
        exit 1
    fi

    mkdir -p "$HOME/.qi"
    printf "TF_PATH=%s\nUI_PATH=%s\n" "${terraform_path}" "${ui_path}" >"$HOME/.qi/qi.properties"
}

setup_qi() {
    printf "Hello! Welcome to Qi! Your favorite dragon maid, disguised as a bash script.\n\n"

    printf "Step 1: Creating an alias for qi within %s...\n" "$HOME/bin"
    create_qi_alias
    printf "Done!\n\n"

    printf "Step 2: Let's setup your path so that you can actually call qi from anywhere.\n"
    setup_path
    printf "Done!\n\n"

    printf "Step 2: Let's gather properties for commands you will run later, these will be stored in ~/.qi/qi.properties\n"
    create_properties_file

    printf "Congrats! You're done with setup!\n"
}

setup_qi
