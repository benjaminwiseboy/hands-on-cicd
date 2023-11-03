import json


def handler(event, context):
    body = {
        "message": "Hello, World!"
    }

    response = {
        "statusCode": 200,
        "body": json.dumps(body)
    }

    return response
