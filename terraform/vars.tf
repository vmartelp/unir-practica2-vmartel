#En este archivo de terraform declaramos las variables 
#var.location de tipo string con descripcion y valor West Europe
variable "location" {
  type = string
  description = "Región de Azure donde crearemos la infraestructura"
  default = "West Europe"
}

#var.vm_size de tipo strin con descripcion y valores para el recurso
variable "vm_size" {
  type = string
  description = "Tamaño de la máquina virtual"
  default = "Standard_D1_v2" # 3.5 GB, 1 CPU 
}
