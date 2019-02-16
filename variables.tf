variable "name" {
  description = "The name of the ELB"
}
variable "instances" {
  description = "The name of the ELB"
  type = list
}
variable "instance_count" {
  description = "The name of the ELB"
  default = 2
}
