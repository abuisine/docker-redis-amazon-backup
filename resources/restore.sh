#!/bin/bash
set -e

echo 'WARNING !!!'
echo 'This will restore the latest backup from Amazon S3, and replace this running database'
echo 'The container will be stopped at the end of the process'
read -r -p "Are you sure? [yes/N] " response
if [[ $response =~ ^([yY][eE][sS])$ ]]
then
	echo
	echo 'Restoring backup'
	S3_USE_SIGV4="True" duplicity restore --s3-use-new-style --s3-european-buckets "s3://s3-$AWS_REGION.amazonaws.com/$AWS_BUCKET/$AWS_FOLDER/" /restores \
	 && ( echo 'Done'; echo 'Stopping container'; kill 1 ) \
	 || echo 'Failed'
else
	echo 'Not doing anything then ...'
fi