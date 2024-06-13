# Проект "HA Infra Deploy"

Этот проект предназначен для развертывания высокодоступной инфраструктуры с использованием Ansible и Terraform.

## Структура проекта

.
├── ansible-playbooks
│ ├── inventory.ini
│ ├── playbooks
│ │ ├── first_playbook.yaml
│ │ ├── second_playbook_postgresql.yaml
│ │ ├── third_playbook_postgresql.yaml
│ │ └── vault.yml
│ └── roles
│ └── nginx
│ └── templates
│ └── nginx_load_balancer.conf
├── backend
│ ├── app.py
│ └── templates
│ └── index.html
├── postgresql
│ ├── server_2
│ │ ├── create_table.sh
│ │ ├── pg_hba.conf
│ │ └── postgresql.conf
│ └── server_3
│ └── postgresql.conf
├── terraform
│ ├── main.tf
│ ├── my_vault_password.txt
│ ├── terraform.tfstate
│ └── terraform.tfstate.backup
└── README.md


## Описание структуры файлов

- **ansible-playbooks**: Директория для плэйбуков Ansible, конфига nginx и инвентари файла.
  - **inventory.ini**: Инвентарный файл для управления хостами Ansible.
  - **playbooks**: Директория с плэйбуками Ansible.
  - **roles**: Директория для ролей Ansible и конфигом nginx.
- **backend**: Директория с файлами приложения backend.
  - **app.py**: Основной файл приложения на Python.
  - **templates**: Шаблоны HTML для приложения.
- **postgresql**: Директория с конфигурационными файлами PostgreSQL для серверов.
- **terraform**: Директория с файлами Terraform для управления инфраструктурой.
  - **main.tf**: Основной файл конфигурации Terraform.
  - **my_vault_password.txt**: Файл с паролем для расшифровки зашифрованных данных в Ansible Vault. (Для работы Terraform необходимо создать файл)
  - **terraform.tfstate** и **terraform.tfstate.backup**: Файлы состояния Terraform.