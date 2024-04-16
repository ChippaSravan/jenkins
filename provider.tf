terraform {
 required_providers {
  aws={
   source="hashicorp/aws"
   version="5.45.0"
  }
 }
}
provider "default" {
  region     = var.region
  access_key = var.access_key
  secret_key = var.secret_key
  }
