#!/bin/bash -xe

restart(){
  printf "restarting computer .... jk\n"
  shutdown -r now
}

restart "$@"