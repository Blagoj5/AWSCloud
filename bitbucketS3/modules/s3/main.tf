data "template_file" "bucket_policy" {
  template = "${file("${path.module}/bucketpolicy.json")}"
  vars {
    # origin_access_identity_arn = "${aws_cloudfront_origin_access_identity.origin_access_identity.cloudfront_access_identity_path}"
    bucket = "${aws_s3_bucket.b.arn}"
  }
}

resource "aws_s3_bucket" "b" {
  bucket = "www.${var.bucket_name}"
  acl    = "public-read"

  website {
    index_document = "${var.index_document_name}"
    error_document = "${var.error_document_name}"
    policy = "${data.template_file.bucket_policy.rendered}"
    routing_rules = <<EOF
    [{
        "Condition": {
            "KeyPrefixEquals": "*/"
        },
        "Redirect": {
            "ReplaceKeyPrefixWith": "/"
        }
    }]
    EOF
  }
  tags = {
      Name = "${var.bucket_name}"
  }
}
