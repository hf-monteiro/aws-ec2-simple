#!/bin/bash
set -e -x

##terraform init for modules and dependency download from example Central node
echo "=== example Central node creation start ==="
pushd ../example-sense-central
terragrunt init
terragrunt apply -auto-approve
popd

##terraform init for modules and dependency download from example Failover node
echo "=== example Failover creation start ==="
pushd ../example-sense-failover
terragrunt init
terragrunt apply -auto-approve
popd

##terraform init for modules and dependency download from example Scheduler node
echo "=== example Scheduler creation start ==="
pushd ../example-scheduler
terragrunt init
terragrunt apply -auto-approve
popd

##terraform init for modules and dependency download from example Consumer node
echo "=== example Consumer creation start ==="
pushd ../example-consumer
terragrunt init
terragrunt apply -auto-approve
popd

##terraform init for modules and dependency download from example Share node
echo "=== example Share creation start ==="
pushd ../example-share
terragrunt init
terragrunt apply -auto-approve
popd
