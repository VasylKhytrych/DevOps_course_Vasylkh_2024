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
│       task_4.md
│
├───Screens
│       helm_verification.png
│       WP_via_pub.png
│       Job_result.png
│       New_user.png
│       PVC_on_local.png
│       PV_and_PVC.png
│
└───task_4_dir
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
    ├───WP_config
    │       hello_world_job.xml
    │       WP-sa.yaml
    │       WP-values.yaml
    │       WP-volume.yaml
    │       job_build_start.sh
    │
    └───modules
        ├───ec2
        │   │   albs.tf
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

## How to Use

  1. **The most work was scripted and automated, you just need:**
    - git clone https://github.com/VasylKhytrych/Helm-WP-WP.git
    - change variables in values.yaml
    - run this workflow from GH Actions or locally with terraform

  2. **WP part** 
    - login to wp node
    - login in WP (port 32000) via admin account and pass
    - preform basic setup of WP
    - Congrats, now you have working wp site.
  

## Useful commands

### Upgrading the Chart

To upgrade the WP Helm chart with new values or chart updates, use:
```bash
helm upgrade wordpress ./wordpress-chart/ --namespace default
```
### Uninstalling the Chart

To uninstall the WP Helm chart and remove all associated resources, use:
```bash
helm uninstall wordpress --namespace default
```

### Monitoring and Logs

To check the status of the WP deployment, use:
```bash
kubectl get deployment wordpress -n default
```
To view the status of pods associated with WP, use:
```bash
kubectl get pods -n default
```
To view logs of the WP pod, first identify the pod name, then use:
```bash
kubectl logs <wp-pod-name> -n default
```
To follow the logs in real-time, use:
```bash
kubectl logs -f <wp-pod-name> -n default
```

## Task 7 setup | PROMETHEUS setup.

All information provided before will be useful for general understanding and infra debug. Generally prom should be installed one time on a server, that is why i added prom install in user data (CI/CD via GH Actions).

All you need to make this work is to:

1. Clone repo with "prometheus-values.yaml" from here -> https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/prom/prometheus-values.yaml OR just get file with WGET (as was done in user_data).

2. Initialize terraform setup.

What should be done:

Script will create all required folders, download values file, deploy prom via helm and expose prom to world. 
If you need to change config of Prometheus, you should do this in values file.

This actions will be enough in scope of task #7.

## Task 8 setup | Grafana setup.

All information provided before will be useful for general understanding and infra debug. Generally Grafana should be installed one time on a server, that is why i added Grafana install in user data (CI/CD via GH Actions).

All you need to make this work is to:

1. Clone and update repo with required from here -> https://github.com/VasylKhytrych/Helm-Jenkins-WP/tree/main/grafana OR just get files with WGET (as was done in user_data).

2. Update main_dashboard.json with your exported dashboard config JSON.

3. Create admin pass K8s secret manually, command you can check in "k3s_master.sh", in you don't want to fill your pass, then skip this step, random admin pass will be created.

4. Initialize terraform setup.

What should be done:

Script will create all required folders, download required file, deploy Grafana via helm, load pre-configured Dashboard setting (previously exported), will attach pre-configured Prometheus data source. 

## Task 9 setup | Grafana alering setup.

All information provided before will be useful for general understanding and infra debug. All Grafana configuration like contact points, alerting, boards and etc. will be provisioned (pre-installed) with YAMLs on setup.

All you need to make this work is to:

1. Manually create and configure AWS SNS endpoint, detailed step-by-step article [here](https://medium.com/@jayanthivikas123/integrating-aws-ses-smtp-with-grafana-helm-charts-for-seamless-email-notifications-68b279430526).

2. Then update [this](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/7f4e320a27a2a54b4c6c1a951891888da15d13f9/task_9_dir/modules/ec2/user_data_sh/k3s_master.sh#L123-L126) part with your values and perform manually or just update script with values (only if this is QA or DEV env).

3. Update email which should receive alert emails [here](https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/bdc259b5783fe63d104650f5bfa44eafa1212b3b/grafana/notifiers.yaml#L9).

4. All done. Initialize terraform setup.

5. You can test this with stress test on your host.

In case you need to change/add contact points/alert rules, please edit notifiers.yaml file from config GIT repo. 
Better to do it manually on UI and export config, due to large amount of config lines.