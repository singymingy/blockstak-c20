variable "region" {
  default = "ap-southeast-2"
}
variable "azs" {
  default = ["ap-southeast-2a", "ap-southeast-2b", "ap-southeast-2c"]
}
variable "lbweb_port" {
  default = 80
}
variable "p2p_port" {
  default = 20444
}
variable "web_port" {
  default = 20443
}
variable "ssh_port" {
  default = 22
}
variable "myip" {
  default = "113.197.96.228/32"
}
variable "ami" {
  default = "ami-0260047fd6ea07d0d"
}
variable "instance_type" {
  default = "t2.micro"
}