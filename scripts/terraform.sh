#!/usr/bin/env bash
function terraformInit(){
  if [ ! -d "$CURRENT_DIR"/.terraform ]; then 
    terraform init -backend-config=address="${TF_ADDRESS}" \
    -backend-config=lock_address="${TF_ADDRESS}"/lock \
    -backend-config=unlock_address="${TF_ADDRESS}"/lock \
    -backend-config=username="${GITLAB_USERNAME}" \
    -backend-config=password="${GITLAB_PASSWORD}" \
    -backend-config=lock_method=POST \
    -backend-config=unlock_method=DELETE \
    -backend-config=retry_wait_min=5
  fi
}
