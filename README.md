# ha-infra-deploy
.
├── ansible-playbooks
│   ├── inventory.ini
│   ├── playbooks
│   │   ├── first_playbook.yaml
│   │   ├── second_playbook_postgresql.yaml
│   │   └── third_playbook_postgresql.yaml
│   ├── roles
│   │   └── nginx
│   │       └── templates
│   │           └── nginx_load_balancer.conf
│   └── vault.yml
├── backend
│   ├── app.py
│   └── templates
│       └── index.html
├── my_vault_password.txt
├── postgresql
│   ├── server_2
│   │   ├── create_table.sh
│   │   ├── pg_hba.conf
│   │   └── postgresql.conf
│   └── server_3
│       └── postgresql.conf
├── README.md
└── terraform
    ├── main.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    └── variable.tfs