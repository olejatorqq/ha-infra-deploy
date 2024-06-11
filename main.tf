terraform {
  required_providers {
    selectel = {
      source  = "selectel/selectel"
      version = "5.1.0"
    }
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "2.0.0"
    }
  }
}

provider "selectel" {
  domain_name = var.domain_name
  username    = var.username
  password    = var.password
}

provider "openstack" {
  auth_url    = "https://cloud.api.selcloud.ru/identity/v3"
  domain_name = var.domain_name
  tenant_id   = var.project_id
  user_name   = var.username
  password    = var.password
  region      = var.region
}


resource "null_resource" "install_ansible" {
  provisioner "local-exec" {
    command = "ansible-playbook -i '${var.target_host},' -u ${var.ssh_user} --private-key=${var.private_key_path} install_ansible.yaml"
  }
}