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
│       task_3.md
│
├───Screens
│       Cluster_nodes_from_local.png
│       Nginx_responce.png
│
└───task_3_dir
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
        │   │   eips.tf
        │   │   instances.tf
        │   │   nats.tf
        │   │   outputs.tf
        │   │   security_group.tf
        │   │   variables.tf
        │   │
        │   └───user_data_sh
        │           default_instance_setup.sh
        │           k3s_master.sh
        │           k3s_worker.sh
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
  This file defines used variables for each module to use.
- **```main.tf```**:  
  The main configuration file where the core infrastructure is defined.
- **```security_group.tf | eips.tf and all resource specific files```**:  
  These files contains all configuration for each resource in our infrastructure.
- **```modules/ec2/user_data_sh/*```**:  
  This directory contains user_data scripts for instances.

### GitHub variables and GitHub Secrets variables
 1. The default aws region variable ```AWS_DEF_REGION```, the Terraform version variable ```TERRAFORM_VERSION``` and working directory variable ```WORK_DIR``` are stored in GitHub Variables.
 2. IAM Role for GitHub Actions secret ```AWS_ROLE_TO_ASSUME``` is stored in GitHub Secrets. 

## Terraform config

### Variables

  - All variables with descriptions are located in variables.tf in each module directory + in root module (root dir). Change them if you need.

## Workflow Overview (Terraform CI/CD Workflow)
  The GitHub Actions workflow consists of 3 jobs + 1 gitguardian job:
  - **GigGuardian_check**: Scan code for secrets.
  - **terraform-check**: Checks the formatting of Terraform files.
  - **terraform-plan**: Initializes Terraform and creates an execution plan.
  - **terraform-apply**: Applies the changes to the AWS infrastructure (conditions: PR to main | push to task_2_vasylk | manual run only if your workflow file in default branch ).

## Workflow Overview (Terraform Destroy)
  The GitHub Actions workflow consists of 1 job:
  - **terraform-destroy**: Destroys all your terrafrom infrastructure (conditions: manual run only if your workflow file in default branch ). This is very useful, because you can perform destroy from mobile GH app or browser to stop billing.

## How to Use (Infrastructure part)

1. **Create S3 bucket and DynamoDB table manually (best practice, to avoid deletion of a key files on "terraform destroy"):**  
   Create S3 for terraform project backend (tfstate) and DynamoDB for state lock. And copy paste S3 and DB path/link in config file "main.tf"
2. **Clone the Repository:**
   ```bash
   1. git clone https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024.git
   2. cd task_3_dir
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
   1. Make changes to basic config and variables (all variables.tf files).
   2. Push them to work branch or do PR to main.
   3. Monitor the Actions tab for the workflow run status.

## How to Use (K8s part)

1. **In this config k3s master and worker nodes will be deployed and installed automatically, so you need only to configure access from local PC and run containers with apps**  
   1. Kubectl should be installed on your PC Win/Mac/Linux/. 
   2. Copy k3s config from master node (path: /etc/rancher/k3s/k3s.yaml) to your local PC.
   3. Add path to config file on local PC in $PATH or env variables.
   4. Create SSH Tunnel in scheme: local PC -> bastion -> master_node. 
   ```bash
   # if you are using SSH Forwarding
   ssh -f -N -A -L 6443:${SSH_PRIVATE_HOST_ADDR}:6443 ec2-user@${SSH_PUBLIC_HOST_ADDR}
   #-L: Specifies the port forwarding, where the format is local_port:host:remote_port (6443:10.0.100.217:6443).
   #login@${SSH_PUBLIC_HOST_ADDR}: SSH user and address of the public (bastion) host.

   # if you are not using SSH Forwarding
   ssh -f -N -L 6443:${SSH_PRIVATE_HOST_ADDR}:6443 ec2-user@${SSH_PUBLIC_HOST_ADDR} -i <path/to/your/key.pem>
   #-L: Specifies the port forwarding, where the format is local_port:host:remote_port (6443:10.0.100.217:6443).
   #login@${SSH_PUBLIC_HOST_ADDR}: SSH user and address of the public (bastion) host.
   ```
   5. Now you should be able to reach master node via local kubectl.