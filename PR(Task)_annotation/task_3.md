1. Task: https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/2_cluster-configuration/task_3.md
2. Screenshot: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_3_vasylk/Screens
3. Code: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_3_vasylk
4. Tasks and my job review.

- **Terraform Code for AWS Resources (10 points)**
   - [x] Terraform code is created or extended to manage AWS resources required for the cluster creation.
      - ***My comment:*** generally was added only code/resources/scripts in ec2 module [dir_link](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_3_vasylk/task_3_dir/modules/ec2). Added user_data scripts, refactored instances code and etc for K3S.
   - [x] The code includes the creation of a bastion host.
      - ***My comment:*** Please check bastion config [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/7cfdd142b8857f5d57d76d3ec2d6267a814b9e2b/task_3_dir/modules/ec2/instances.tf#L1)

- **Cluster Deployment (60 points)**
   - [x] A K8s cluster is deployed using either kOps or k3s.
    - ***My comment:*** K3S cluster (master and workers) were deployed via user_data -> [install_scripts](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_3_vasylk/task_3_dir/modules/ec2/user_data_sh) and [master_node](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/7cfdd142b8857f5d57d76d3ec2d6267a814b9e2b/task_3_dir/modules/ec2/instances.tf#L27), [worker](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/7cfdd142b8857f5d57d76d3ec2d6267a814b9e2b/task_3_dir/modules/ec2/instances.tf#L46)
   - [x] The deployment method is chosen based on the user's preference and understanding of the trade-offs.
    - ***My comment:*** K3S was chosen to manage underlying infra by myself for better understanding.

- **Cluster Verification (10 points)**
   - [x] The cluster is verified by running the kubectl get nodes command from the local computer.
    - ***My comment:*** SS from local terminal [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/Screens/Cluster_nodes_from_local.png).
   - [x] A screenshot of the kubectl get nodes command output is provided.
    - ***My comment:*** SS from local terminal [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/Screens/Cluster_nodes_from_local.png).

- **Workload Deployment (10 points)**
   - [x] A simple workload is deployed on the cluster using kubectl apply -f https://k8s.io/examples/pods/simple-pod.yaml.
     - ***My comment:*** Provided in task link gives 404, so I created the same simple nginx container. SS from local terminal [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/Screens/Cluster_nodes_from_local.png). 
   - [x] The workload runs successfully on the cluster.
     - ***My comment:*** You can check previous SS with nodes and pods from local terminal and this [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/Screens/Nginx_responce.png) with curl to nginx from worker node. For now, I have no time to configure access to nginx from other hosts or from internet (but this is not required in this task).

- **Additional Tasks (10 points)**
   - [x] Document the cluster setup and deployment process in a README file.
     - ***My comment:*** Please check [README.md](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/README.md)

  P.S. In case something is unclear or you need clarification to rate it, please contact me in the Discord -> @lunnoe_solnce.