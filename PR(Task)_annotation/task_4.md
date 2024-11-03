1. Task: https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/3_ci-configuration/task_4.md
2. Screenshot: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_4_vasylk/Screens
3. Code: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_4_vasylk
4. Tasks and my job review.

- **Helm Installation and Verification (10 points)**
   - [x] Helm is installed and verified by deploying the Nginx chart.
      - ***My comment:*** generally was added only code/resources/scripts in ec2 module [dir_link](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_3_vasylk/task_3_dir/modules/ec2). Added user_data scripts, refactored instances code and etc for K3S.

- **Cluster Requirements (10 points)**
   - [x] The cluster has a solution for managing persistent volumes (PV) and persistent volume claims (PVC).
    - ***My comment:*** K3S cluster (master and workers) were deployed via user_data -> [install_scripts](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_3_vasylk/task_3_dir/modules/ec2/user_data_sh) and [master_node](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/7cfdd142b8857f5d57d76d3ec2d6267a814b9e2b/task_3_dir/modules/ec2/instances.tf#L27), [worker](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/7cfdd142b8857f5d57d76d3ec2d6267a814b9e2b/task_3_dir/modules/ec2/instances.tf#L46).

- **Jenkins Installation (50 points)**
   - [x] Jenkins is installed using Helm in a separate namespace.
    - ***My comment:*** SS from local terminal [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/Screens/Cluster_nodes_from_local.png).
   - [x] Jenkins is available from the internet.
    - ***My comment:*** SS from local terminal [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/Screens/Cluster_nodes_from_local.png).

- **Jenkins Configuration (10 points)**
   - [x] Jenkins configuration is stored on a persistent volume and is not lost when Jenkins' pod is terminated.
     - ***My comment:*** Provided in task link gives 404, so I created the same simple nginx container. SS from local terminal [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/Screens/Cluster_nodes_from_local.png). 

- **Verification (10 points)**
   - [x] A simple Jenkins freestyle project is created and runs successfully, writing "Hello world" into the log.
     - ***My comment:*** Please check [README.md](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/README.md)

- **Additional Tasks (10 points)**
   - [x] A GHA pipeline is set up to deploy Jenkins. (5 points)
     - ***My comment:*** Please check [README.md](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/README.md)
   - [x] Authentication and security settings are configured for Jenkins. (5 points)
     - ***My comment:*** Please check [README.md](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_3_vasylk/README.md)

  P.S. In case something is unclear or you need clarification to rate it, please contact me in the Discord -> @lunnoe_solnce.