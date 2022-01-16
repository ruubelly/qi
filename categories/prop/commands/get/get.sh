#!/bin/bash

get() {
    if [ $# -eq 0 ]; then
      echo "Properties available"
      echo "    TF_PATH - path to terraform project"
      echo "    UI_PATH - path to ui project"
      echo "    ECR_URL - URL to Elastic Container Registry to use"
      exit 0
    fi

    if [[ $# -ne 1 ]]; then
      echo "Set requires exactly one parameters: key_name"
      exit 1
    fi

  local prop_key="${1}"

  local prop_line
  prop_line=$(grep "${prop_key}=" "${PROPS_PATH}")
  prop_val=$(echo "$prop_line" | awk '{split($0,a,"="); print a[2]}')

  printf "%s" "${prop_val}"
}

get "$@"
