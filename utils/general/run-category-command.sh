#!/bin/bash -xe

# Given a category - show all commands available
run_category_command() {
  test $# -ge 2 # Assert number of inputs - 1: category, 2: command

  local category="${1}"
  local command="${2}"
  shift;shift

  # shellcheck disable=SC1090
  source "${APP_DIR}/categories/${category}/commands/${command}/${command}.sh" "$@"
}
