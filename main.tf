locals {
        tags = {
                "env" = "dev"
                "dept" = "devops"
        }
	
}
variable "rgname" {
        default = "myrg"

}
variable "rgloc" {
        default = "eastus"
}
module "finalrg" {
        source = "./modules/rg/"
        rg_name = "${var.rgname}"
        rg_location = "${var.rgloc}"
}

module "network" {
        source = "./modules/vnet/"
        vnet_name = "myvnet"
        rg_location = "${var.rgloc}"
        rg_name = "${var.rgname}"
        #rg_name = module.rg.azurerm_resource_group.myrg.name
        vnet_cidr = "192.168.0.0/16"
        tags = local.tags
        vnet_sub_cidr = {
                "sub1" = "192.168.10.0/24"
                "sub2" = "192.168.20.0/24"
        }
}

module "server" {
	source = "./modules/vm/"
	rg_location = "${var.rgloc}"
	rg_name = "${var.rgname}"
	vm_subnet_id = "${module.network.mysubnames[0]}"
	vm_name = "myserver1"
	vm_size = "Standard_B1s"
	vm_username = "myadmin"
	vm_pass = "Mydevops@1234"
	tags = local.tags
	nic_name = "myserver1-nic1"

}