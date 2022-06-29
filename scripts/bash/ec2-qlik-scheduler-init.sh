#!/bin/bash
set -e -x

##terraform init for modules and dependency download from example Share node
echo "=== example Scheduler creation start ==="
pushd ../example-scheduler
terragrunt init
terragrunt apply
popd

