provider "aws" {
  region = "us-west-2"
}

resource "aws_s3_bucket" "gimbal-sightings" {
  bucket        = "gimbal-sightings"
  force_destroy = false
  region        = "us-west-2"

  versioning {
    enabled = true
  }

  replication_configuration {
    role = "arn:aws:iam::722695891552:role/service-role/replication_role_for_gimbal-sightings_to_gimbal-sightings-virgin"

    rules = {
      id     = "gimbal-sightings"
      prefix = ""
      status = "Enabled"

      destination = {
        bucket = "arn:aws:s3:::gimbal-sightings-virginia"
      }
    }
  }
}

data "aws_iam_policy_document" "gimbal-sightings" {
  statement {
    sid    = "CrossAccountActions"
    effect = "Allow"

    actions = [
      "s3:List*",
      "s3:Get*",
    ]

    principals = {
      type        = "AWS"
      identifiers = ["arn:aws:iam::717456749013:root"]
    }

    resources = [
      "arn:aws:s3:::gimbal-sightings",
      "arn:aws:s3:::gimbal-sightings/*",
    ]
  }
}

resource "aws_s3_bucket_policy" "gimbal-sightings" {
  bucket = "${aws_s3_bucket.gimbal-sightings.id}"
  policy = "${data.aws_iam_policy_document.gimbal-sightings.json}"
}

# resource "aws_s3_bucket_notification" "sightings-notifications" {
#   bucket = "${aws_s3_bucket.gimbal-sightings.id}"
#
#   queue {
#     queue_arn     = "${aws_sqs_queue.fluentd-s3-input.arn}"
#     id            = "dev-sightings-events"
#     events        = ["s3:ObjectCreated:*"]
#     filter_prefix = "shared_dev/"
#     filter_suffix = ".gz"
#   }
#
#   queue {
#     queue_arn     = "${aws_sqs_queue.stage-fluentd-s3-input.arn}"
#     id            = "stage-sightings-events"
#     events        = ["s3:ObjectCreated:*"]
#     filter_prefix = "awsstage/"
#     filter_suffix = ".gz"
#   }
#
#   queue {
#     queue_arn     = "${aws_sqs_queue.prod-fluentd-s3-input.arn}"
#     id            = "prod-sightings-events"
#     events        = ["s3:ObjectCreated:*"]
#     filter_prefix = "awsprod/"
#     filter_suffix = ".gz"
#   }
# }

