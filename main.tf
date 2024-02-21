terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~>0.65.0"
    }
  }
}
# provider "yandex" {
#   token     = "<yours token>"
#   cloud_id  = "<yours cloud_id>"
#   folder_id = "<yours folder_id>"
#   zone      = "ru-central1-a"
# }
provider "yandex" {
   zone = "ru-central1-a"
   folder_id = "b1gshrppcjhgfj180qki"
#   service_account_key_file = "key.json"
}

resource "yandex_vpc_network" "network" {
  name = "swarm-network"
}

resource "yandex_vpc_subnet" "subnet" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}

module "swarm_cluster" {
  source        = "./modules/instance"
  vpc_subnet_id = yandex_vpc_subnet.subnet.id
  managers      = 1
  workers       = 2
}