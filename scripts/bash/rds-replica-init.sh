#!/bin/bash
set -e -x

##terraform init for modules and dependency download from Replica node of RDS
echo "=== RDS Replica creation start ==="
pushd ../rds-replica
terragrunt init
terragrunt apply
popd

