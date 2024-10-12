1. Task: https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/1_basic-configuration/task_2.md
2. Screenshot: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_2_vasylk/Screens
3. Code: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_2_vasylk
4. Tasks and my job review.

- **Terraform Code Implementation (50 points)**
   - [+] Create Terraform code to configure the following:
     - VPC
     - 2 public subnets in different AZs
     - 2 private subnets in different AZs
     - Internet Gateway
     - [+] Routing configuration:
       - Instances in all subnets can reach each other
       - Instances in public subnets can reach addresses outside VPC and vice-versa
        - ***My comment:*** for VPC, 4 subnets, IG please check terraform code VPC module [link](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_2_vasylk/task_2_dir/modules/vpc) and [resource_map_SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/Screens/VPC_resource_map.png) and [IG_info](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/Screens/IG_info.png) and. For routing config please check terraform code in /vpc/routes.tf and nacl.tf and /ec2/nats.tf and security_group.tf and [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/Screens/Curl_ping_test.png) with curl and ping tests. 

- **Code Organization (10 points)**
   - [+] Variables are defined in a separate variables file.
   - [+] Resources are separated into different files for better organization.
    - ***My comment:*** You can check my files [tree](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_2_vasylk/task_2_dir) and files content.

- **Verification (10 points)**
   - [+] Terraform plan is executed successfully.
   - [+] A resource map screenshot is provided (VPC -> Your VPCs -> your_VPC_name -> Resource map).
    - ***My comment:*** GitHub Actions with my terraform plan [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/actions/runs/11307584579). Resource map [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/Screens/VPC_resource_map.png).

- **Additional Tasks (30 points)**
   - **Security Groups and Network ACLs (5 points)**
     - Implement security groups and network ACLs for the VPC and subnets.
       - ***My comment:*** You can check SG config [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/task_2_dir/modules/ec2/security_group.tf) and NACL config [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/task_2_dir/modules/vpc/nacl.tf).
   - **Bastion Host (5 points)**
     - Create a bastion host for secure access to the private subnets.
       - ***My comment:*** You can check SG config (bastion SG part) [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/task_2_dir/modules/ec2/security_group.tf) and Bastion instance config [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/task_2_dir/modules/ec2/instances.tf).
   - **NAT is implemented for private subnets (10 points)**
     - Orginize NAT for private subnets with simpler or cheaper way
     - Instances in private subnets should be able to reach addresses outside VPC.
       - ***My comment:*** You can check NAT config [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/task_2_dir/modules/ec2/nats.tf) and curl tests [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/Screens/Curl_ping_test.png).
   - **Documentation (5 points)**
     - Document the infrastructure setup and usage in a README file.
       - ***My comment:*** Please check [README.md](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_2_vasylk/README.md)
   - **Submission (5 points)**
     - A GitHub Actions (GHA) pipeline is set up for the Terraform code.
       - ***My comment:*** You can check result/logs for [this](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/actions/runs/11307584579) workflow or take a look on workflow in this PR.

  P.S. In case something is unclear or you need clarification to rate it, please contact me in the Discord -> @lunnoe_solnce.