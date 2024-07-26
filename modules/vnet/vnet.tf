resource "azurerm_virtual_network" "myvnet" {
  name                = "${var.vnet_name}"
  location            = "${var.rg_location}"
  resource_group_name = "${var.rg_name}"
  address_space       = ["${var.vnet_cidr}"]

  tags = "${var.tags}"
}

resource "azurerm_subnet" "mynet_sub" {
  for_each = "${var.vnet_sub_cidr}"
  name                 = "${azurerm_virtual_network.myvnet.name}-${each.key}"
  resource_group_name = "${var.rg_name}"
  virtual_network_name = "${azurerm_virtual_network.myvnet.name}"
  address_prefixes     = ["${each.value}"]

}