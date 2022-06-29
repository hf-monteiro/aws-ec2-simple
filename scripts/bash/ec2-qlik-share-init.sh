#!/bin/bash
set -e -x

##terraform init for modules and dependency download from example Share node
echo "=== example Share creation start ==="
pushd ../example-share
terragrunt init
terragrunt apply
popd

