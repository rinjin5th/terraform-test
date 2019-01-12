variable "azs" {
  default = [
    "ap-northeast-1a",
    "ap-northeast-1c"
  ]
}

variable "public-subnet-cidr-blocks" {
  default = [
    "172.16.0.0/24",
    "172.16.2.0/24"
  ]
}

variable "private-subnet-cidr-blocks" {
  default = [
    "172.16.1.0/24",
    "172.16.3.0/24"
  ]
}
variable "web-private-ip-addresses" {
  default = [
    "172.16.1.4",
    "172.16.3.4"
  ]
}