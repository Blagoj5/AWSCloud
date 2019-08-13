provider "aws" {
    region = "${var.region}"
  
}

module "s3_bucket" {
  source              = "./modules/s3"
  bucket_name         = "${var.bucket_name}"
  index_document_name = "${var.index_document_name}"
  error_document_name = "${var.error_document_name}"
  
}

variable "bucket_name" {
    description = "Name for the bucket"
}

variable "index_document_name" {
    description = "enter the index document name"
    default     = "index.html"
}

variable "error_document_name" {
    description = "enter the error document name"
    default     = "error.html"
}

variable "region" {
    description = "enter region"
}
