1. Task: https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/4_monitoring-configuration/task_8.md
2. Screenshot: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_8_vasylk/Screens
3. Code: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_8_vasylk
4. GIT with conf files: https://github.com/VasylKhytrych/Helm-Jenkins-WP/tree/main/grafana
5. Tasks and my job review.

- **Grafana Installation (30 points)**
   - [x] Grafana is installed on the K8s cluster using the Helm chart by Bitnami.
      - ***My comment:*** Please check user_data script as CI/CD for Grafana installation and [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_8_vasylk/Screens/grafana_deploy.png) with result.
   - [x] A data source pointing to the existing Prometheus installation is added.
      - ***My comment:*** Please check [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_8_vasylk/Screens/Datasource.png) with result and [user_data](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/ad767716608bf35faa2cb7523c5014662f93ec0d/task_8_dir/modules/ec2/user_data_sh/k3s_master.sh#L118) script where we automatized DS creation (as a secret) and values [file](https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/e51afbaa4e0c44a6d3ecbad93b058e83aa042711/grafana/grafana-default-values.yaml#L270) where we are using recently created DS secret.

- **Dashboard Creation (40 points)**
   - [x] A dashboard is created with basic metrics visualized, such as CPU and memory utilization, storage usage, etc.
      - ***My comment:*** Please check prepared JSON with dashboard [config](https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/grafana/main_dashboard.json), this JSON will be loaded in Grafana during installation. Also please check my [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_8_vasylk/Screens/Dashboard.png) with the result with a few metrics.

- **Deployment Automation (10 points)**
   - [x] Automation of deployment with IaC or CI/CD pipeline is created.
      - ***My comment:*** Installation of Grafana will be during host setup via user_data, you can check this [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/ad767716608bf35faa2cb7523c5014662f93ec0d/task_8_dir/modules/ec2/user_data_sh/k3s_master.sh#L105-L140).

- **Additional Tasks (20 points)**
   - [x] Admin user password is created with a separate secret. (10 points)
     - ***My comment:*** I created K3S secret with the admin pass, which will be passed to deployment. Please check [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_8_vasylk/Screens/Grafana_admin.png) with the result, user_data [script](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/ad767716608bf35faa2cb7523c5014662f93ec0d/task_8_dir/modules/ec2/user_data_sh/k3s_master.sh#L113-L116) with example of command and reference to this secret in values [file](https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/e51afbaa4e0c44a6d3ecbad93b058e83aa042711/grafana/grafana-default-values.yaml#L84-L96).
   - [x] A JSON file of the dashboard layout is provided. (5 points)
     - ***My comment:*** You can check this [here](https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/grafana/main_dashboard.json).
   - [x] The Grafana setup, including the dashboard creation, is documented in a README file. (5 points)
     - ***My comment:*** Please check this [file](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_8_vasylk/README.md#task-8-setup--grafana-setup).

  P.S. In case something is unclear or you need clarification to rate it, please contact me in the Discord -> @lunnoe_solnce.