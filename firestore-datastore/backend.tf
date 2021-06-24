terraform {
  backend "gcs" {
    bucket = "atpk226"
    prefix = "prod/global/networking/cloud_lb/http_lb"
  }
}
