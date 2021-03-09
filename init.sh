#!/usr/bin/env bash

terraform init \
  -backend-config="address=https://gitlab.com/api/v4/projects/24996431/terraform/state/unnamd" \
  -backend-config="lock_address=https://gitlab.com/api/v4/projects/24996431/terraform/state/unnamd/lock" \
  -backend-config="unlock_address=https://gitlab.com/api/v4/projects/24996431/terraform/state/unnamd/lock" \
  -backend-config="username=aasanchez" \
  -backend-config="password=BRo1Gezkp8uppmaDDdpC" \
  -backend-config="lock_method=POST" \
  -backend-config="unlock_method=DELETE" \
  -backend-config="retry_wait_min=5"
