resource "azurerm_mssql_server" "sql" {
  name                         = "mssqlserverazcli123"
  resource_group_name          = "${var.rg_name}"
  location                     = "${var.rg_location}"
  version                      = "12.0"
  administrator_login          = "mradministrator"
  administrator_login_password = "thisIsDog11"

  tags = {
    environment = "production"
  }
}