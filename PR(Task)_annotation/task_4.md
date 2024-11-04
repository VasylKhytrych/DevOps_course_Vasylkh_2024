1. Task: https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/3_ci-configuration/task_4.md
2. Screenshot: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_4_vasylk/Screens
3. Code: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_4_vasylk
4. Tasks and my job review.

- **Helm Installation and Verification (10 points)**
   - [x] Helm is installed and verified by deploying the Nginx chart.
      - ***My comment:*** This was done manually (Nginx chart deploy/destroy), but really i can prove this by [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_4_vasylk/Screens/helm_verification.png) of working Jenkins via Helm.

- **Cluster Requirements (10 points)**
   - [x] The cluster has a solution for managing persistent volumes (PV) and persistent volume claims (PVC).
    - ***My comment:*** You can check config files [dir](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_4_vasylk/task_4_dir/jenkins_config) and SS from working Jenkis deploy [SS_PV_and_PVC](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_4_vasylk/Screens/PV_and_PVC.png).

- **Jenkins Installation (50 points)**
   - [x] Jenkins is installed using Helm in a separate namespace.
    - ***My comment:*** On [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_4_vasylk/Screens/helm_verification.png) we can see command with key "-n jenkins" that means that this is not default namespace and result of successful deployment.
   - [x] Jenkins is available from the internet.
    - ***My comment:*** SS from browser [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_4_vasylk/Screens/Jenkins_via_pub.png).

- **Jenkins Configuration (10 points)**
   - [x] Jenkins configuration is stored on a persistent volume and is not lost when Jenkins' pod is terminated.
     - ***My comment:*** Here is the [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_4_vasylk/Screens/PVC_on_local.png) with local dir where PVC is mounted. 

- **Verification (10 points)**
   - [x] A simple Jenkins freestyle project is created and runs successfully, writing "Hello world" into the log.
     - ***My comment:*** You can check .sh [script](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_4_vasylk/task_4_dir/jenkins_config/job_build_start.sh) for faster creation&start and [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_4_vasylk/Screens/Job_result.png) with result from UI.

- **Additional Tasks (10 points)**
   - [x] A GHA pipeline is set up to deploy Jenkins. (5 points)
     - ***My comment:*** Jenkins installation was integrated with user_data script, which you can check [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_4_vasylk/task_4_dir/modules/ec2/user_data_sh/k3s_master.sh) and workflow run [result](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/actions/runs/11652267216).
   - [x] Authentication and security settings are configured for Jenkins. (5 points)
     - ***My comment:*** Additional user was created in Jenkins UI for better user control, authentication and security -> [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_4_vasylk/Screens/New_user.png)

  P.S. In case something is unclear or you need clarification to rate it, please contact me in the Discord -> @lunnoe_solnce.