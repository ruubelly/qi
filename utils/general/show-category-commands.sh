#!/bin/bash -xe

# Given a category - show all commands available
show_category_commands() {
  test $# -eq 1 # assert number of inputs
  local category="${1}"

  local cmd_dirs

  cmd_dirs=(${APP_DIR}/categories/${category}/commands/*/) # This creates an array of the full paths to all subdirs
  cmd_dirs=("${cmd_dirs[@]%/}")                                         # This removes the trailing slash on each item
  cmd_dirs=("${cmd_dirs[@]##*/}")                                       # This removes the path prefix, leaving just the dir names

  for cmd in "${cmd_dirs[@]}"; do
    printf "%s\n" "$cmd"
  done
}
