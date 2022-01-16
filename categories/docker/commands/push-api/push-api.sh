#!/bin/bash

push_api(){
  local tag
  tag='latest'

  local cmd
  cmd="docker push"

  # default to latest
  if [ $# -eq 0 ]; then
    cmd="${cmd} ${ECR_URL}:latest"
    else
      for var in "$@"
        do
          cmd="${cmd} ${ECR_URL}:${var}"
        done
  fi

  $cmd
}

push_api "$@"