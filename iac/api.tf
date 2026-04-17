resource "docker_container" "api" {
  name  = "api-${terraform.workspace}-01"
  image = "lab/api"

   ports {
    internal = "3000"
    external = var.api_port[terraform.workspace]
  }

  networks_advanced{
    name = docker_network.app_network.name
   }

   env = [
    "DB_HOST=${docker_container.db.name}",
    "DB_PORT=5432",
    "DB_PASSWORD=password" 
  ]

  ports {
    internal = 3000
    external = var.api_port[terraform.workspace]
  }
}
