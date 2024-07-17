resource "azurerm_network_interface" "mynic" {
  name                = "${var.nic_name}"
  location            = "${var.rg_location}"
  resource_group_name = "${var.rg_name}"

  ip_configuration {
    name                          = "${var.nic_name}"
    subnet_id                     = "${var.vm_subnet_id}"
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_virtual_machine" "myvm" {
  name                  = "${var.vm_name}"
  location            = "${var.rg_location}"
  resource_group_name = "${var.rg_name}"
  network_interface_ids = [azurerm_network_interface.mynic.id]
  vm_size               = "${var.vm_size}"

  storage_image_reference {
    publisher = "OpenLogic"
    offer     = "CentOS"
    sku       = "7_9-gen2"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "${var.vm_name}"
    admin_username = "${var.vm_username}"
    admin_password = "${var.vm_pass}"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = "${var.tags}"
}