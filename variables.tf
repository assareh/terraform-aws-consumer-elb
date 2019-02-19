variable "name" {
  description = "The name of the ELB or app.  example: Consumer-App"
}
variable "instances" {
  description = "A list containing ec2 instances for the load balancer to use.  examples: ["${module.ec2_instance.id}"]"
  type = "list"
}
variable "number_of_instances" {
  description = "The number of EC2 instances to deploy behind the load balancer.  default: 2"
  default = 2
}
