output "sightings-bucket" {
  value = "${aws_s3_bucket.gimbal-sightings.id}"
}

output "sightings-bucket-arn" {
  value = "${aws_s3_bucket.gimbal-sightings.arn}"
}

output "sightings-bucket-region" {
  value = "${aws_s3_bucket.gimbal-sightings.region}"
}
