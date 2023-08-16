import boto3
import os
import datetime

def lambda_handler(event, context):
    try:
        instance_id = event['instance_id']
        max_backup_count = int(event['max_backup_count'])
        s3_bucket_name = 'aws03tms'

        # Creating EC2
        ec2_client = boto3.client('ec2')
        # Getting information about host
        instance = ec2_client.describe_instances(InstanceIds=[instance_id])

        # Backup path
        backup_folder_path = '/home/ec2-user/backups'

        # Checking if backup folder exists
        if not os.path.exists(backup_folder_path):
            raise Exception(f"Backup folder '{backup_folder_path}' does not exist on the instance.")

        # Creating new backup name based on current date and time
        current_datetime = datetime.datetime.now().strftime('%Y-%m-%d_%H-%M-%S')
        backup_name = f'backup_{instance_id}_{current_datetime}.zip'

        # Creating zip-archive
        os.system(f'zip -r {backup_name} {backup_folder_path}')

        # Getting S3 files list
        s3_client = boto3.client('s3')
        s3_objects = s3_client.list_objects_v2(Bucket=s3_bucket_name)
        backup_count = len(s3_objects['Contents'])

        # If number of backups exceeds specified limit - delete the oldest
        if backup_count >= max_backup_count:
            oldest_backup = min(s3_objects['Contents'], key=lambda x: x['LastModified'])
            s3_client.delete_object(Bucket=s3_bucket_name, Key=oldest_backup['Key'])

        # Uploading backup to S3
        s3_client.upload_file(backup_name, s3_bucket_name, backup_name)

        # Deleting temporary archive
        os.remove(backup_name)
