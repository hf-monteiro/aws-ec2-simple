# How to configure example Failover Server

1. Deploy Failover (using Terraform or Terragrunt).
2. Run Ansible playbook failover_domain.yml in order to add geoanalyti server to domain

```shell
 ansible-playbook -i inventory failover_domain.yml --user ansible --ask-pass
 ```

# Install Failover Node

1. Run the ansible playbook as follow in order to update node:
``` sh
ansible-playbook -i inventory example_failover_install.yml
```

# Register Failover Node

1. Run the ansible playbook as follow in order to Add the Failover node into Central Node:
``` sh
ansible-playbook -i inventory example_failover_register.yml --user ansible --ask-pass
```

