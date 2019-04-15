variable "name" {
  description = "The name of the ELB or app.  example: Consumer-App"
}
variable "instances" {
  description = "A list containing ec2 instances for the load balancer to use.  Can be interpolated from ec2_instance module"
  type = "list"
}
variable "number_of_instances" {
  description = "The number of EC2 instances to deploy behind the load balancer.  default: 2"
  default = 2
}

variable "environment" {
  description = "The environment this will be deployed into.  examples: dev, stage, <br/> prod | more info: https://github.com/mocofound/terraform-aws-consumer-elb/edit/master/readme.md"
}
