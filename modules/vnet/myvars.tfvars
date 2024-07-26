vnet_name = "test-vnet"
rg_location = "eastus"
rg_name = "my-rg"
vnet_cidr = "192.168.0.0/16"
vnet_sub_cidr = {
        "sub1" = "192.168.10.0/24"
        "sub2" = "192.168.11.0/24"
}
tags = {
        "env" = "dev"
}