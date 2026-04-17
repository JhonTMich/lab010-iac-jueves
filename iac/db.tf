resource "docker_container" "db" {
  name  = "db-${terraform.workspace}-01"
  image = "postgres:16"
  env = [
    "POSTGRES_PASSWORD=password"
  ]

   ports {
    internal = "5432"
    external = var.db_port[terraform.workspace]
  }
}