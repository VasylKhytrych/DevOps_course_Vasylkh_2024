1. Task: https://github.com/rolling-scopes-school/tasks/blob/master/devops/modules/1_basic-configuration/task_1.md
2. Screenshot: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_1_vasylk/Screens
3. Code: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_1_vasylk
4. Tasks and my job review.

- MFA User configured (10 points)
  - [+] Provide a screenshot of the non-root account secured by MFA (ensure sensitive information is not shared).
    My comment: https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/tree/task_1_vasylk/Screens

- Bucket and GithubActionsRole IAM role configured (30 points)
  - Terraform code is created and includes:
  - [+] A bucket for Terraform states
    My comment: Created S3 bucket and DynamoDB table manually (best practice, to avoid deletion of a key files on "terraform destroy"). Copy pasted S3 and DB path/link in config file **"main.tf"**. Performed just bucket creation as approve for this task, please check **s3.tf** file and workflow status.

  - [+] IAM role with correct Identity-based and Trust policies
    My comment: all created via Terraform, please check **iam_roles.tf** and workflow actions.

- Github Actions workflow is created (30 points)
  - [+] Workflow includes all jobs
  - My comment: all created. Work flow link is [here](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/actions/runs/11086528731). Also you can check **.github/workflows/terraform.yml**.

- Code Organization (10 points)
  - [+] Variables are defined in a separate variables file.
  - My comment: I have used a few widely used variables, check them in **variables.tf**.

  - [+] Resources are separated into different files for better organization.
  - My comment: See **.tf** files tree.

- Verification (10 points)
  - [+] Terraform plan is executed successfully for GithubActionsRole
  - My comment: Check screens dir for access and use history. Also worflow can be checked in actions.

  - [+] Terraform plan is executed successfully for a terraform state bucket
  - My comment: Check screens dir for access and use history. Also worflow can be checked in actions.

- Additional Tasks (10 points)
  - [+] Documentation (5 points)
  - My comment: [**Check README.md**](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_1_vasylk/README.md).

  - [+] Document the infrastructure setup and usage in a README file.
  - My comment: [**Check README.md**](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/blob/task_1_vasylk/README.md).

  Submission (5 points)
  - [+] A GitHub Actions (GHA) pipeline is passing
  - My comment: [Terraform CI/CD Workflow page](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/actions/workflows/terraform.yml) and 1 [successfull run](https://github.com/VasylKhytrych/DevOps_course_Vasylkh_2024/actions/runs/11086528731).

  - P.S. In case something is unclear or you need clarification to rate it, please contact me in the Discord -> @lunnoe_solnce.