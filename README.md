# Terraform Sightings Bucket
This simply manages the sightings bucket and the associated sqs queues used by fluentd to injest the data.

`sightings.tf`
Configures bucket and the object  notifications.

`sqs.tf`
Sets up the sqs queues for the notifications.


## Outputs

| Name | Description |
|------|-------------|
| sightings-bucket |  |
| sightings-bucket-arn |  |
| sightings-bucket-region |  |

