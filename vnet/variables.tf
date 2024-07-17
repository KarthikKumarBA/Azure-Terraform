variable "vnet_name" {}
variable "rg_location" {}
variable "rg_name" {}
variable "vnet_cidr" {
        type = string
}
variable "tags" {
        type = map
}
variable "vnet_sub_cidr" {
        type = map


}