output "myrgname" {
        value = "${azurerm_resource_group.myrg.name}"
}
output "myrglocation" {
	value = "${azurerm_resource_group.myrg.location}"
}