# Learn Terraform Modules

Learn what Terraform modules are and when to use them.

Follow along with the [Learn guide](https://learn.hashicorp.com/terraform/modules/modules-overview) at HashiCorp Learn.


##Upload files to bucket:
aws s3 cp modules/aws-s3-static-website-bucket/www/ s3://$(terraform output website_bucket_name)/ --recursive

##Remove files from bucket
aws s3 rm s3://$(terraform output website_bucket_name)/ --recursive