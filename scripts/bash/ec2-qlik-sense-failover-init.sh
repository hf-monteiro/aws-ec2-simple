#!/bin/bash
set -e -x

##terraform init for modules and dependency download from example Share node
echo "=== example Sense Central Node Failover creation start ==="
pushd ../example-sense-failover
terragrunt init
terragrunt apply
popd

