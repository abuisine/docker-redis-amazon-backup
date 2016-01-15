#!/bin/bash

S3_USE_SIGV4="True" duplicity full /backups --s3-use-new-style --s3-european-buckets "s3://s3-$AWS_REGION.amazonaws.com/$AWS_BUCKET/$AWS_FOLDER/"