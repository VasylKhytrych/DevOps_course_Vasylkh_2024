#!/bin/bash

# Jenkins details
jenkins_url="http://127.0.0.1:30000"  # Replace <host_ip> with your Jenkins host IP
username="admin"                 # Replace with your Jenkins username
api_token=""            # Replace with your Jenkins API token

# Job configuration file
job_config_file="hello_world_job.xml"

# Check if job-config.xml exists
if [[ ! -f "$job_config_file" ]]; then
    echo "Job configuration file '$job_config_file' not found!"
    exit 1
fi

# Create the job
curl -s -o /dev/null -w "%{http_code}" -X POST "${jenkins_url}/createItem?name=HelloWorldJob" \
    -u "${username}:${api_token}" \
    -H "Content-Type: application/xml" \
    --data-binary @"$job_config_file"

# Run the job
curl -s -o /dev/null -w "%{http_code}" -X POST "${jenkins_url}/job/HelloWorldJob/build" \
    -u "${username}:${api_token}"