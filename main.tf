terraform {
  backend "s3" {
    region = "ap-northeast-1"
    bucket = "iguwo-tfstate"
    key = "terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-northeast-1"
}