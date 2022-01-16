#!/bin/bash

set() {
    if [ $# -eq 0 ]; then
      echo "Properties available"
      echo "    TF_PATH - path to terraform project"
      echo "    UI_PATH - path to ui project"
      echo "    ECR_URL - URL to Elastic Container Registry to use"
      exit 0
    fi

    if [[ $# -ne 2 ]]; then
      echo "Set requires exactly two parameters: key_name value"
      exit 1
    fi

  update_properties_file "$@"

}

update_properties_file(){
  local propertiesContentsSansKey
  propertiesContentsSansKey=$(grep -v "${1}=" "${PROPS_PATH}" 2>/dev/null)

  echo "${propertiesContentsSansKey}" > "${PROPS_PATH}"
  echo "${1}=${2}" >> "${PROPS_PATH}"

}


set "$@"
