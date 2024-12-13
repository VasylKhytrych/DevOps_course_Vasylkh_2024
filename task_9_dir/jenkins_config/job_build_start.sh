#!/bin/bash

# Jenkins details
jenkins_url="http://127.0.0.1:32000"  # Replace <host_ip> with your Jenkins host IP
username="admin"                 # Replace with your Jenkins username
api_token="API"            # Replace with your Jenkins API token

# Job configuration file
job_config_file="hello_world_job.xml"

# Check if job-config.xml exists
if [[ ! -f "$job_config_file" ]]; then
    echo "Job configuration file '$job_config_file' not found!"
    exit 1
fi

# Create the job
create_response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "${jenkins_url}/createItem?name=HelloWorldJob" \
    -u "${username}:${api_token}" \
    -H "Content-Type: application/xml" \
    --data-binary @"$job_config_file")

# Check if job creation was successful
if [[ "$create_response" -eq 200 ]]; then
    echo "Job 'HelloWorldJob' created successfully."
else
    echo "Failed to create job. HTTP response code: $create_response"
    exit 1
fi

# Run the job
build_response=$(curl -s -o /dev/null -w "%{http_code}" -X POST "${jenkins_url}/job/HelloWorldJob/build" \
    -u "${username}:${api_token}")

# Check if job trigger was successful
if [[ "$build_response" -eq 201 ]]; then
    echo "Job 'HelloWorldJob' triggered successfully."
else
    echo "Failed to trigger job. HTTP response code: $build_response"
    exit 1
fi
