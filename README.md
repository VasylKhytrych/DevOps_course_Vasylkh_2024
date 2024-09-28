# AWS DevOps Course. Readme.

This repository contains the Terraform configuration files used for provisioning and managing infrastructure. The following document explains the structure and purpose of each file and directory in the project.

## File Structure
```
├───.github/
│   └───workflows/
│       └───terraform.yml
├───PR(Task)_annotation/
│   └───task_1
├───Screens/
├───terraform_project/
│   ├───backend.tf
│   ├───iam_roles.tf
│   ├───main.tf
│   ├───outputs.tf
│   ├───s3.tf
│   ├───security_group.tf
│   ├───variables.tf
│   ├───vpc.tf
│   └───instance_module
│       ├───instance.tf
│       └───variables.tf
└───README.md
```

### Directory & File Overview
Will be described only files and folders required for 1-st task.

- **```.github/workflows/```**:  
  This directory is a special folder in a GitHub repository that contains YAML files defining GitHub Actions workflows. 
- **```PR(Task)_annotation/```**:  
  This directory contains the explanation note for my 1-st task.
- **```Screens/```**:  
  This directory contains screenshots that verify the correct configuration of AWS accounts and installed software versions.
- **```.gitignore```**:  
  This file specifies which files or directories should be ignored by Git when tracking changes in a repository.
- **```terraform_project/```**:  
  This directory contains the files for my terraform project (infrastructure).
- **```backend.tf```**:  
  The backend terraform configuration.
- **```iam_roles.tf```**:  
  This file contains all recources which were created in IAM (roles, providers, policies).
- **```main.tf```**:  
  The main configuration file where the core infrastructure is defined.
- **```s3.tf```**:  
  This file contains all S3 buckets.
- **```security_group.tf```**:  
  This file contains all sec groups in our infrastructure.
- **```variables.tf```**:  
  This file defines the basic, rarely changed, widely used variables for the project.

### GitHub variables and GitHub Secrets variables
 1. The default aws region variable ```AWS_DEF_REGION``` and the Terraform version variable ```TERRAFORM_VERSION``` are stored in GitHub Variables.
 2. IAM Role for GitHub Actions secret ```AWS_ROLE_TO_ASSUME``` is stored in GitHub Secrets. 

## How to Use

1. **Create S3 bucket and DynamoDB table manually (best practice, to avoid deletion of key files on "terraform destroy"):**  
   Create S3 for terraform project backend (tfstate) and DynamoDB for state lock. And copy paste S3 and DB path/link in config file "main.tf"
2. **Initialize Terraform:**  
   Create basic tf file in S3.
   ```terraform init```
3. **Plan and Apply Changes:**  
   Review changes by running:
   ```terraform plan```  
   Apply changes by running:
   ```terraform apply```
4. **Now you have up and running Terraform using S3 bucket and Dynamo DB as a backend**  