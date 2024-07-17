output "myvnetname" {
        value = "${azurerm_virtual_network.myvnet.name}"
}

output "mysubnames" {
        value = values(azurerm_subnet.mynet_sub)[*].id
        #value = [ for i in azurerm_subnet.mynet_sub: i.name ]
}