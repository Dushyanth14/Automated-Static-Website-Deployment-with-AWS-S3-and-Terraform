# Automated-Static-Website-Deployment-with-AWS-S3-and-Terraform
# Static Website Hosting on AWS S3 with Terraform

## Project Overview

This project demonstrates how to host a static website on AWS using S3 and Terraform. The infrastructure is provisioned using Terraform scripts, which automate the creation of AWS resources like an S3 bucket, an S3 bucket policy for public access, and the configuration needed to serve a static website. 

The project also includes a sample HTML file (`index.html`) and CSS file (`styles.css`) that will be hosted on the AWS S3 bucket. 

### Key Features
- **Automated AWS Resource Provisioning**: Using Terraform to create S3 buckets and other necessary configurations.
- **Static Website Hosting**: The website is hosted on an AWS S3 bucket with static content like HTML and CSS.
- **Terraform Infrastructure as Code (IaC)**: Define AWS resources using Terraform to manage the infrastructure.
- **Public Access**: Configured the bucket policy to allow public access to the static files.

## Requirements

- **Terraform**: Version 0.12 or later
- **AWS Account**: Active AWS account with IAM permissions to create S3 buckets and set policies.
- **AWS CLI**: Optionally installed for interacting with AWS.

## Steps to Run the Project

## Installation
Follow the installation guide for Terraform based on your operating system: https://learn.hashicorp.com/tutorials/terraform/install-cli

### 1. Clone the Repository:
Clone this repository to your local machine:

      ```bash
     git clone https://github.com/Dushyanth14/Automated-Static-Website-Deployment-with-AWS-S3-and-Terraform.git
 cd static-website-terraform

### 2. Set Up AWS Credentials:
  # Make sure your AWS credentials are configured using AWS CLI: 
    aws configure

### 3. Apply Terraform Configuration:
   # Run terraform apply to apply the configuration and provision the AWS resources:
     terraform apply

### 4. Access the Website:
 # Once the Terraform configuration is applied successfully, Terraform will output the website URL where your static site is hosted.
    op-id = "http://static-website-abc123.s3-website-us-east-1.amazonaws.com"


