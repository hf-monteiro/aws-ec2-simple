#!/bin/bash
set -e -x

##terraform init for modules and dependency download from example Share node
echo "=== example Sense Central Node creation start ==="
pushd ../example-sense-central
terragrunt init
terragrunt apply
popd

