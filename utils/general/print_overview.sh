#!/bin/bash -xe

print_cmd_overview() {
  local cmd_name="$1"
  local overview="$2"
  local example_usage="$3"
  local options=("$4")

  printf "Command Name: %s\n" "${cmd_name}"

  printf "Overview\n"
  printf "  %s\n\n" "${overview}"

  # eg. qi tf <option> <ip_address>
  printf "Commmand Syntax\n"
  printf "  qi %s\n" "${cmd_name}"

  printf "Example Invocation\n"
  printf "  %s\n\n" "${example_usage}"

  printf "Available Options\n"

  for option in "${options[@]}"; do
    printf "  %s\n" "${option}"
  done

  printf "\n"
}
