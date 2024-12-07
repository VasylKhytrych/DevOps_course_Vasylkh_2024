1. Task: https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/4_monitoring-configuration/task_8.md
2. Screenshot: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_8_vasylk/Screens
3. Code: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_8_vasylk
4. GIT with conf files: https://github.com/VasylKhytrych/Helm-Jenkins-WP/tree/main/grafana
5. Tasks and my job review.

- **Grafana Installation (30 points)**
   - [x] Grafana is installed on the K8s cluster using the Helm chart by Bitnami.
      - ***My comment:*** Please check user_data script as CI/CD for PROM installation and [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/Screens/prom_pod.png) with result.
   - [x] A data source pointing to the existing Prometheus installation is added.
      - ***My comment:*** Please check user_data script as CI/CD for PROM installation and [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/Screens/prom_pod.png) with result.

- **Dashboard Creation (40 points)**
   - [x] A dashboard is created with basic metrics visualized, such as CPU and memory utilization, storage usage, etc.
      - ***My comment:*** Please check user_data script as CI/CD for PROM installation [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/task_7_dir/modules/ec2/user_data_sh/k3s_master.sh).

- **Deployment Automation (10 points)**
   - [x] Automation of deployment with IaC or CI/CD pipeline is created.
      - ***My comment:*** Please check this [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/Screens/node_mem.png) from browser with metrics data.

- **Additional Tasks (20 points)**
   - [x] Admin user password is created with a separate secret. (10 points)
     - ***My comment:*** Please check this [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/Screens/node_mem.png) from browser with metrics data.
   - [x] A JSON file of the dashboard layout is provided. (5 points)
     - ***My comment:*** Please check this [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/Screens/node_mem.png) from browser with metrics data.
   - [x] The Grafana setup, including the dashboard creation, is documented in a README file. (5 points)
     - ***My comment:*** Please check this [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/Screens/node_mem.png) from browser with metrics data.

  P.S. In case something is unclear or you need clarification to rate it, please contact me in the Discord -> @lunnoe_solnce.