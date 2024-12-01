1. Task: https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/4_monitoring-configuration/task_7.md
2. Screenshot: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_7_vasylk/Screens
3. Code: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_7_vasylk
4. GIT with conf: https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/prom/prometheus-values.yaml
5. Tasks and my job review.

- **Prometheus Installation (20 points)**
   - [x] Prometheus is installed and running on the K8s cluster.
      - ***My comment:*** Please check user_data script as CI/CD for PROM installation and [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/Screens/prom_pod.png) with result.

- **Deployment Automation (30 points)**
   - [x] Automation of deployment with IaC or CI/CD pipeline is created.
      - ***My comment:*** Please check user_data script as CI/CD for PROM installation [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/task_7_dir/modules/ec2/user_data_sh/k3s_master.sh).

- **Web interface is available (10 points)**
   - [x] Metrics can be checked via Prometheus web interface.
      - ***My comment:*** Please check this [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/Screens/node_mem.png) from browser with metrics data.

- **Metrics Collection (35 points)**
   - [x] Prometheus is collecting essential cluster-specific metrics, such as nodes' memory usage.
     - ***My comment:*** Please check this [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/Screens/node_mem.png) from browser with metrics data.

- **Documentation is created (5 points)**
   - [x] A README file is created or updated documenting the Prometheus deployment and configuration.
     - ***My comment:*** Please check README.md [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_7_vasylk/README.md#task-7-setup--prometheus-setup).

  P.S. In case something is unclear or you need clarification to rate it, please contact me in the Discord -> @lunnoe_solnce.