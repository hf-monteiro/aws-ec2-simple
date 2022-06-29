#!/bin/bash
set -e -x

##terraform init for modules and dependency download from Master node of RDS
echo "=== RDS Master creation start ==="
pushd ../rds-master
terragrunt init
terragrunt apply
popd


