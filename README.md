# AWS Three-Tier Architecture using Terraform

## Project Overview

This project demonstrates how to deploy a scalable AWS Three-Tier Architecture using Terraform Infrastructure as Code.

The architecture includes networking, load balancing, compute, storage, database, and monitoring services.

---

## Architecture Components

### Networking
- VPC
- Public Subnets
- Private Subnets
- Internet Gateway
- Route Tables

### Compute
- EC2 Launch Template
- Auto Scaling Group

### Load Balancing
- Application Load Balancer
- Target Group

### Storage
- Amazon S3 for website files

### Database
- Amazon RDS (MySQL)

### Monitoring
- Amazon CloudWatch
- Auto Scaling alarms

### Terraform Backend
- S3 bucket for remote state
- DynamoDB for state locking

---

## Architecture Flow

User → Application Load Balancer → EC2 Auto Scaling Group → RDS Database

Website files are downloaded from S3 during EC2 instance startup.

---

## Project Structure

aws-three-tier-terraform/

terraform/
- backend.tf
- provider.tf
- variables.tf
- outputs.tf
- vpc.tf
- security-groups.tf
- alb.tf
- ec2.tf
- autoscaling.tf
- rds.tf
- cloudwatch.tf
- iam.tf

modules/

scripts/
- deploy.sh
- destroy.sh

docs/
- architecture-diagram.png

website/
- index.html
- style.css

README.md

---

## Deployment Steps

Clone the repository

git clone https://github.com/YOUR_USERNAME/aws-three-tier-architecture-terraform.git

Navigate to terraform directory

cd terraform

Initialize terraform

terraform init

Plan infrastructure

terraform plan

Deploy infrastructure

terraform apply

---

## Access Application

After deployment Terraform outputs the ALB DNS name.

Open the ALB DNS in a browser to access the application.

---

## Technologies Used

Terraform  
AWS EC2  
AWS VPC  
AWS ALB  
AWS Auto Scaling  
AWS S3  
AWS RDS  
AWS CloudWatch

---

## Author

Madhan Kumar
Cloud & DevOps Learner
