
import os
import json
import uuid
import boto3
from datetime import datetime

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table(os.environ['TABLE_NAME'])

def lambda_handler(event, context):
    try:
        body = json.loads(event['body'])

        item = {
            'submission_id': str(uuid.uuid4()),
            'name': body['name'],
            'email': body['email'],
            'message': body['message'],
            'timestamp': datetime.utcnow().isoformat()
        }

        table.put_item(Item=item)

        return {
            'statusCode': 200,
            'body': json.dumps({'message': 'Submission received'})
        }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'error': str(e)})
        }
