terraform {
    backend "s3" {
        bucket = "terraform-s3-bucket-2025-a"
        key = "terraform.tfsate"
        region = "us-east-1"

    }
}
