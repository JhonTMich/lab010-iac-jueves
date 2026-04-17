resource "docker_container" "db" {
  name  = "db-${terraform.workspace}-01"
  image = "lab/db"

   ports {
    internal = "5432"
    external = var.db_port[terraform.workspace]
  }
}