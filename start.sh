#!/bin/bash

# Start LocalStack
localstack start &

# Wait for LocalStack to start
sleep 10

# Start the Django application
python ./portfolio-backend/manage.py migrate
python ./portfolio-backend/manage.py runserver