# AWS DevOps Course. Readme.

This repository contains the Terraform configuration files used for provisioning and managing infrastructure. The following document explains the structure and purpose of each file and directory in the project.

## File Structure
```
    │   README.md
    │
    ├───.github
    │   └───workflows
    │           terraform.yml
    │           terraform_destroy.yml
    │
    ├───PR(Task)_annotation
    │       task_2.md
    │
    ├───Screens
    └───task_2_dir
        │   .gitignore
        │   .terraform.lock.hcl
        │   backend.tf
        │   main.tf
        │   outputs.tf
        │   variables.tf
        │
        ├───.terraform
        │   └───terraform.tfstate
        │
        └───modules
            ├───ec2
            │       eips.tf
            │       instances.tf
            │       nats.tf
            │       outputs.tf
            │       security_group.tf
            │       variables.tf
            │
            ├───iam
            │       iam_roles.tf
            │       outputs.tf
            │       variables.tf
            │
            ├───s3
            │       outputs.tf
            │       s3.tf
            │       variables.tf
            │
            └───vpc
                    nacl.tf
                    outputs.tf
                    routes.tf
                    subnets.tf
                    variables.tf
                    vpc.tf
```

### Directory & File Overview

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
- **```outputs.tf```** (in each module):  
  These file contains all resources that should be STDOUT to console or pass data to different modules.
- **```variables.tf```** in each module):  
  This file defines used variables for the each module to use.
- **```main.tf```**:  
  The main configuration file where the core infrastructure is defined.
- **```security_group.tf | eips.tf and all resource specific files```**:  
  These files contains all configuration for each resourse in our infrastructure.

### GitHub variables and GitHub Secrets variables
 1. The default aws region variable ```AWS_DEF_REGION```, the Terraform version variable ```TERRAFORM_VERSION``` and working directory variable ```WORK_DIR``` are stored in GitHub Variables.
 2. IAM Role for GitHub Actions secret ```AWS_ROLE_TO_ASSUME``` is stored in GitHub Secrets. 

## Terraform config

### Variables

  - All variables with descriptions are locaked in variables.tf in each module directory + in root module (root dir). Change them if you need.

## Workflow Overview (Terraform CI/CD Workflow)
  The GitHub Actions workflow consists of 3 jobs:
  - **terraform-check**: Checks the formatting of Terraform files.
  - **terraform-plan**: Initializes Terraform and creates an execution plan.
  - **terraform-apply**: Applies the changes to the AWS infrastructure (conditions: PR to main | push to task_2_vasylk | manual run only if your workflow file in default branch ).

## Workflow Overview (Terraform Destroy)
  The GitHub Actions workflow consists of 1 job:
  - **terraform-destroy**: Destoys all your terrafrom infrustructure (conditions: manual run only if your workflow file in default branch ). This is very useful, because you can perform destroy from moblie GH app or browser to stop billing.

## How to Use

1. **Create S3 bucket and DynamoDB table manually (best practice, to avoid deletion of a key files on "terraform destroy"):**  
   Create S3 for terraform project backend (tfstate) and DynamoDB for state lock. And copy paste S3 and DB path/link in config file "main.tf"
2. **Clone the Repository:**
   ```bash
   1. git clone https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024.git
   2. cd task_2_dir
   ```
3. **Configure the AWS CLI:**  
   Ensure you have configured the AWS CLI with the credentials of your IAM user.

4. **Set Up GitHub Secrets:** 
   In your GitHub repository, navigate to Settings > Secrets and Variables > Actions. Add the following secrets:
   - AWS_DEF_REGION: Default AWS region.
   - TERRAFORM_VERSION: Terraform version to use in workflow.
   - WORK_DIR: Working directory (should be name on directory where all .tf files located, on this case task_2_vasylk)
   - AWS_ROLE_TO_ASSUME: AWS GitHub Actions role arn. (Better to create manually, to not lose connection with GitHab Actions.)

5. **Make changes to terraform config**  
   1. Make changes to basic config and variables.
   2. Push them to work branch or do PR to main.
   3. Monitor the Actions tab for the workflow run status.