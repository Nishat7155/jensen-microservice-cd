The  Jensen PDF Converter project is a simple application that converts Word documents into PDF format. This project includes a Python script (to-pdf.py) and a Dockerfile to containerize the application. The PDF Converter processes are designed to run as serverless functions, providing a scalable and efficient solution for document conversion.Steps for deploying the PDF converter
Getting Started with the project with complete CI/CD.

The PDF Converter project, when deployed manually, faces several challenges:

1. Manual Setup: Each deployment step, from authentication and configuration to building, pushing, and deploying the Docker image, must be performed manually. This is time-consuming and prone to human error.

2. Maintenance Issues: Once the service is deployed, maintaining it (e.g., updating configurations, scaling the service) requires manual intervention. This contradicts the principles of automation and can lead to inefficiencies.

3. Deletion Challenges: Deleting the deployed service or making changes to the setup is cumbersome. There is no straightforward way to automate the cleanup process, resulting in potential leftover resources that could incur costs and cause clutter.

By highlighting these issues, it becomes clear that an automated pipeline and infrastructure management tool, such as Terraform, would significantly improve the deployment process, making it more efficient and less error-prone. This would ensure that deployments are consistent and easily repeatable, aligning with best practices in DevOps and cloud management.

This pipeline automates the process of deploying code changes to the production environment, ensuring that new features and updates are released quickly and reliably. The configuration includes various workflows to build, test, and deploy the application, adhering to best practices for continuous integration and delivery.

.github contains the workflow to deploy the code in cloud run project-setup-tf folder contains initial terraform setup for gcp infrastructure.

To run Deploy the projet in cloud run follow this steps: 
Step 1: 
Download the project in to your local computer and log into th egoogle cloud from your terminal (given that you have terraform cli and gcp cli installed)
Step 2:
Change the working directory to project-setup-tf folder
Step 3:
Create gcp bucket with this command for a tftsate bucket: (Given that you are logged in to right gcp project)
 gsutil mb -l europe-west3 gs:// (any name for your tfstate bucket)

If your are not logged into gcp from local, type: gcloud init . Then log in and select right project
Step 4:
If the bucket is created then type:
 terraform init -reconfigure -backend-config=environments/dev.backend.json

Step 5:
Create initial GCP infrastrusture that requires to deploy this react service in gcp:
Type:
 terraform plan -var-file=environments/dev.json -out=PLAN

Then type:
 terraform apply PLAN

Now wait till everything is created successfully.
Step 6:
Create environmemt variable and secrets accordignto the workflow fie in your github setting
Now go to github actions and run the workflow manually or push some changes to create pull request.
If merged the dev workflow will trigger to build and deploy to the cloud run.
