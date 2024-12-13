1. Task: https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/4_monitoring-configuration/task_9.md
2. Screenshot: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_9_vasylk/Screens
3. Code: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_9_vasylk
4. GIT with conf files: https://github.com/VasylKhytrych/Helm-Jenkins-WP/tree/main/grafana
5. Tasks and my job review.

- **Contact Points created (10 points)**
      - ***My comment:*** Contact point was created on installation automatically (provisioned). You can check code [here](https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/bdc259b5783fe63d104650f5bfa44eafa1212b3b/grafana/grafana-default-values.yaml#L293) and [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_9_vasylk/Screens/Contact_points.png) from UI.

- **Alert Rules created (40 points)**
   - [x] Alert Rules are configured to send alerts for the following events:
      - High CPU utilization on any node of the cluster.
      - Lack of RAM capacity on any node of the cluster.
      - ***My comment:*** Alerts were created on installation automatically (provisioned). You can check code [here](https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/bdc259b5783fe63d104650f5bfa44eafa1212b3b/grafana/notifiers.yaml#L13-L359) 
   - [x] Alerts are configured to be delivered to your email address.
      - ***My comment:*** This config was done with contact point specs and alert configs. You can check configs [here](https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/bdc259b5783fe63d104650f5bfa44eafa1212b3b/grafana/notifiers.yaml#L13-L359) and [here](https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/bdc259b5783fe63d104650f5bfa44eafa1212b3b/grafana/grafana-default-values.yaml#L293).


- **Alert Rules are working as expected (20 points)**
   - [x] Alert Rules are firing when the specified events occur.
      - ***My comment:*** Please check [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_9_vasylk/Screens/Board_alerts.png) and [SS](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_9_vasylk/Screens/Board_alert_occured.png) from board and email notifications [1](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_9_vasylk/Screens/Email_pruff_1.png) and [2](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_9_vasylk/Screens/Email_pruff_2.png).

- **Email is received (10 points)**
     - ***My comment:*** Email notifications SSs [1](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_9_vasylk/Screens/Email_pruff_1.png) and [2](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_9_vasylk/Screens/Email_pruff_2.png).

- **Additional Tasks (20 points)**
   - [x] Documentation (10 points) | The Alertmanager setup and alert configuration are documented in a README file.
      - ***My comment:*** You can check [README.md](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_9_vasylk/README.md#task-9-setup--grafana-alering-setup) file.
   - [x] Configuration is done completely in code (10 points) | Alert Rules, Contact Points, and SMTP settings are configured using YAML files or other code-based methods.
      - ***My comment:*** SMTP config via k3s [secret](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/a96cf4b0c09fcd9551530c445896f1b17272b9e4/task_9_dir/modules/ec2/user_data_sh/k3s_master.sh#L121-L126) and reference for this k3s secrets in values file. Contact points and Alert rules in notifiers [file](https://github.com/VasylKhytrych/Helm-Jenkins-WP/blob/main/grafana/notifiers.yaml) and reference for this k3s secrets in values file.


  P.S. In case something is unclear or you need clarification to rate it, please contact me in the Discord -> @lunnoe_solnce.