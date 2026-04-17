terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "4.2.0"
    }
  }
}

provider "docker" {
  # Configuration options
}

resource "docker_network" "app_network"{
  name= "network-${terraform.workspace}"
}