#!/bin/bash

ecr_login(){
  #https://docs.aws.amazon.com/AmazonECR/latest/userguide/getting-started-cli.html
  docker login -u AWS -p "$(aws ecr get-login-password)" "${ECR_URL}"
}

ecr_login "$@"