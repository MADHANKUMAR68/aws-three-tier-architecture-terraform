# AWS Three-Tier Architecture using Terraform

## Project Overview

This project demonstrates  deploy a scalable AWS Three-Tier Architecture using Terraform Infrastructure as Code.

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


## Deployment Steps

### Step 1 – Clone the Repository

Clone the GitHub repository containing the Terraform project.

Navigate into the project directory.

### Step 2 – Configure AWS Access

Configure AWS CLI credentials on your system so Terraform can interact with AWS resources.

Verify that your account has permissions to create networking, compute, storage, and database resources.

### Step 3 – Prepare Terraform Backend

Create the Terraform backend infrastructure used to store state remotely.

This includes:

An S3 bucket for storing Terraform state files

A DynamoDB table for state locking

Remote state ensures safe collaboration and prevents infrastructure conflicts.

### Step 4 – Initialize Terraform

Navigate into the Terraform infrastructure directory.

Initialize Terraform to:

Download provider plugins

Configure backend storage

Prepare the working directory

### Step 5 – Review Infrastructure Plan

Run a Terraform plan to review the resources that will be created.

This step validates configuration and shows a preview of infrastructure changes.

### Step 6 – Deploy Infrastructure

Apply the Terraform configuration to create AWS resources.

Terraform will provision the following components:

### Networking Layer

Virtual Private Cloud (VPC)

Public and Private Subnets

Internet Gateway

Route Tables

### Security Layer

Security Groups for ALB, EC2, and RDS

IAM Role for EC2 access to S3

### Application Layer

Application Load Balancer

Target Group

Launch Template

Auto Scaling Group

EC2 instances

### Data Layer

Amazon RDS MySQL database

Database subnet group

### Storage

Amazon S3 bucket for website assets

### Monitoring

CloudWatch alarms

Auto Scaling policies

### Step 7 – Upload Website Files to S3

Upload the website application files to the S3 bucket.

These files are automatically downloaded by EC2 instances during startup and served through the Apache web server.

### Step 8 – Auto Scaling Instance Initialization

When EC2 instances launch:

The system updates packages

Installs Apache web server

Installs AWS CLI

Downloads website files from S3

Starts the Apache service

The instance then registers with the load balancer target group.

### Step 9 – Verify Infrastructure

After deployment completes, verify the infrastructure in the AWS console:

VPC and subnets are created

EC2 instances are running

Auto Scaling Group maintains desired capacity

Target group shows healthy instances

RDS database status is available

CloudWatch alarms are configured

### Step 10 – Access the Application

Terraform outputs the Application Load Balancer DNS name after deployment.

Open the DNS address in a web browser to access the deployed website.

The request flow is:

User → Load Balancer → EC2 Instance → Website Content

### Monitoring and Scaling

CloudWatch monitors CPU utilization of EC2 instances.

Scaling rules:

Condition	Action
CPU > 70%	Launch new EC2 instance
CPU < 30%	Terminate extra instance

This ensures automatic scaling based on traffic demand.

### Security Design

Security is implemented using:

Security Groups restricting network access

RDS database placed in private subnets

IAM role allowing EC2 to securely access S3

Terraform state encryption in S3

DynamoDB state locking

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
