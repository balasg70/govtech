# Cloud Infrastructure on AWS

## Overview

This documentation outlines the Infrastructure as Code (IaC) implementation using Terraform and Terragrunt to provision a highly available, scalable, and cost-effective 3-tier web architecture for Symbiosis on AWS. The solution hosts a Node.js-MySQL CRUD application and supports public access with secure, managed backend infrastructure.

---

## Architecture Diagram

---

## Architecture Components

### 1. VPC Module
- **VPC** with CIDR `10.0.0.0/16`
- **Public Subnets** for ALB and EC2: `10.0.1.0/24`, `10.0.2.0/24`
- **Private Subnets** for RDS: `10.0.3.0/24`, `10.0.4.0/24`
- **Internet Gateway** and **Route Table** for internet access
- **High Availability** using multiple Availability Zones (us-east-1a, us-east-1b)

### 2. Application EC2 Module
- **Launch Template** with Node.js user data script
- **Auto Scaling Group (ASG)** for dynamic scaling (min: 2, max: 4)
- **Deployed App**: Node.js-MySQL CRUD application from GitHub
- **Public Access** through ALB

### 3. RDS Module
- **Amazon RDS for MySQL** (db.t3.micro)
- **Multi-AZ Deployment**
- **DB Subnet Group** for secure subnet placement
- **Private Accessibility**

### 4. Application Load Balancer (ALB)
- Public-facing **ALB** across public subnets
- Routes traffic to **Auto Scaling Group**
- Integrated with **Target Group and Health Checks**

---

## Monitoring Metrics (Recommended)
To enhance customer satisfaction and ensure system reliability:

- **ALB**: `HTTPCode_ELB_5XX_Count`, `TargetResponseTime`, `RequestCount`
- **EC2/ASG**: `CPUUtilization`, `NetworkIn/Out`, `GroupInServiceInstances`
- **RDS**: `CPUUtilization`, `FreeStorageSpace`, `DatabaseConnections`
- **Cost Optimization**: `AWS Budgets`, `CloudWatch Alarms`

---

---

## Deployment Instructions

1. Install Terraform and Terragrunt.
2. Clone the repo and navigate to `environments/dev/`.
3. Run:
   ```bash
   terragrunt init
   terragrunt apply
   ```
4. Access the application via the ALB DNS name after deployment.

---
