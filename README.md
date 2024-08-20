# AWS S3 Resume Hosting with Terraform

This project uses Terraform to set up an AWS infrastructure for hosting a static resume website on S3, fronted by an Application Load Balancer.

## Infrastructure Overview

- S3 bucket for hosting the static resume website
- Application Load Balancer (ALB) to handle traffic
- VPC with appropriate networking setup
- S3 bucket for Terraform state storage
- DynamoDB table for Terraform state locking

## Prerequisites

- AWS Account
- Terraform installed (version X.X or later)
- AWS CLI configured with appropriate credentials

## Quick Start

1. Clone this repository
2. Initialize Terraform: terraform init
3. Review the Terraform plan: terraform plan
4. Apply the Terraform configuration: terraform apply
5. After successful application, Terraform will output the ALB DNS name. Use this to access your resume website.

## Project Structure

- `main.tf`: Main Terraform configuration file
- `variables.tf`: Variable definitions
- `outputs.tf`: Output definitions
- `terraform.tfvars`: Variable values (do not commit this file if it contains sensitive information)

## Customization

To customize this project for your own use:

1. Update the `terraform.tfvars` file with your specific values (S3 bucket names, region, etc.)
2. Modify the `main.tf` file if you need to adjust the infrastructure setup

## Cleaning Up

To destroy the created resources: terraform destroy
## Security Considerations

- Ensure your AWS credentials are kept secure and not committed to the repository
- Review and adjust the security group rules as needed
- Consider enabling logging and monitoring for your resources