# # this is the queue for dev, poor naming unfortunately
# resource "aws_sqs_queue" "fluentd-s3-input" {
#   name = "fluentd-s3-input"
#
#   policy = <<POLICY
#   {
#     "Version": "2012-10-17",
#     "Id": "sqs-dev-sightings-policy",
#     "Statement": [
#       {
#         "Sid": "example-statement-ID",
#         "Effect": "Allow",
#         "Principal": {
#           "AWS": "*"
#         },
#         "Action": [
#           "SQS:SendMessage"
#         ],
#         "Resource": "arn:aws:sqs:us-west-2:722695891552:fluentd-s3-input",
#         "Condition": {
#           "ArnLike": {
#             "aws:SourceArn": "${aws_s3_bucket.gimbal-sightings.arn}"
#           }
#         }
#       }
#     ]
#   }
# POLICY
# }
#
# resource "aws_sqs_queue" "stage-fluentd-s3-input" {
#   name = "stage-fluentd-sightings-input"
#
#   policy = <<POLICY
#   {
#     "Version": "2012-10-17",
#     "Id": "sqs-stage-sightings-policy",
#     "Statement": [
#       {
#         "Sid": "example-statement-ID",
#         "Effect": "Allow",
#         "Principal": {
#           "AWS": "*"
#         },
#         "Action": [
#           "SQS:SendMessage"
#         ],
#         "Resource": "arn:aws:sqs:us-west-2:722695891552:stage-fluentd-sightings-input",
#         "Condition": {
#           "ArnLike": {
#             "aws:SourceArn": "${aws_s3_bucket.gimbal-sightings.arn}"
#           }
#         }
#       }
#     ]
#   }
# POLICY
# }
#
# resource "aws_sqs_queue" "prod-fluentd-s3-input" {
#   name = "prod-fluentd-sightings-input"
#
#   policy = <<POLICY
#   {
#     "Version": "2012-10-17",
#     "Id": "sqs-prod-sightings-policy",
#     "Statement": [
#       {
#         "Sid": "example-statement-ID",
#         "Effect": "Allow",
#         "Principal": {
#           "AWS": "*"
#         },
#         "Action": [
#           "SQS:SendMessage"
#         ],
#         "Resource": "arn:aws:sqs:us-west-2:722695891552:prod-fluentd-sightings-input",
#         "Condition": {
#           "ArnLike": {
#             "aws:SourceArn": "${aws_s3_bucket.gimbal-sightings.arn}"
#           }
#         }
#       }
#     ]
#   }
# POLICY
# }

