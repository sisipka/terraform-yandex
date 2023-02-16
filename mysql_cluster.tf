resource "yandex_mdb_mysql_cluster" "mysql-cluster" {
  name        = "mysql-cluster"
  environment = "PRESTABLE"
  network_id  = yandex_vpc_network.network-1.id
  version     = "8.0"
  deletion_protection = "true"

  resources {
    resource_preset_id = "b1.medium"
    disk_type_id       = "network-ssd"
    disk_size          = 20
  }

  database {
    name = "netology_db"
  }

  maintenance_window {
    type = "ANYTIME"
  }

  backup_window_start {
    hours = "23"
    minutes = "59"
  }

  user {
    name     = "user"
    password = "password"
    permission {
      database_name = "netology_db"
      roles         = ["ALL"]
    }
  }

  host {
    zone      = "ru-central1-a"
    subnet_id = yandex_vpc_subnet.private-subnet-a.id
  }

  host {
    zone      = "ru-central1-b"
    subnet_id = yandex_vpc_subnet.private-subnet-b.id
  }

  host {
    zone      = "ru-central1-c"
    subnet_id = yandex_vpc_subnet.private-subnet-c.id
  }

  depends_on = [
     yandex_vpc_network.network-1,
     yandex_vpc_subnet.private-subnet-a,
     yandex_vpc_subnet.private-subnet-b,
     yandex_vpc_subnet.private-subnet-b,
  ]
}