# lab02-iac-jueves
# Despliegue

Vamos a utilizar terraform.
Lo primero es habilitar los proveedores, desde la carpeta donde se encuentra terraform

```
cd iac
```

```
terraform init
```

Deben documentar como crear los ambientes y seleccionar los ambientes

api.tf:
```
resource "docker_container" "api" {
  name  = "api-${terraform.workspace}-01"
  image = "lab/api"

   ports {
    internal = "3000"
    external = var.api_port[terraform.workspace]
  }
}
```

web.tf: 
```
resource "docker_container" "web" {
  name  = "web-${terraform.workspace}-01"
  image = "lab/web"

   ports {
    internal = "80"
    external = var.web_port[terraform.workspace]
  }
}
```

db.tf:
```
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
```

terraform.tfvars:
```
web_port={
    localhost = 4001
    dev = 5001
}
api_port={
    localhost = 4002
    dev = 5002
}
db_port={
    localhost = 4003
    dev = 5003
}
```
variables.tf:
```
variable "api_port" {}
variable "web_port" {}
variable "db_port" {}
```

Creacion de workspaces

```
terraform workspace new localhost 
terraform workspace new dev
```
Crear puertos
```
terraform workspace select localhost
terraform plan
terraform apply
```
- Para los puerto 4001:80 4002:3000 4003:5432
```
terraform workspace select dev
terraform plan
terraform apply
```
- Para los puerto 5001:80 5002:3000 5003:5432