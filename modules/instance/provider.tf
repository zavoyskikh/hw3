terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "~> 0.65.0"
    }
  }
}
provider "yandex" {
   zone = "ru-central1-a"
   folder_id = "b1gshrppcjhgfj180qki"
#   service_account_key_file = "key.json"
}