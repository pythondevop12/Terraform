def lambda_handler(event, context):
    print("Hello Python Lambda TF")
    return {
        'statusCode': 200,
        'body': 'Hello Python Lambda TF'
    }
