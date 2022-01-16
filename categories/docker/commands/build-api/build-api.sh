#!/bin/bash

api_build(){
  local tag
  tag='latest'

  local cmd
  cmd="docker build"

  # default to latest
  if [ $# -eq 0 ]; then
    cmd="${cmd} --tag ${ECR_URL}:latest"
    else
      for var in "$@"
        do
          cmd="${cmd} --tag ${ECR_URL}:${var}"
        done
  fi
  cmd="${cmd} ."

  $cmd
}

api_build "$@"