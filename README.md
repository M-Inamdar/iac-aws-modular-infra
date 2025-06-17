# 🏗️ AWS Modular Infrastructure with Terraform

This project provides a **modular and scalable Terraform codebase** for deploying AWS infrastructure components such as VPC, subnets, and remote state management using S3 and DynamoDB.

---

## 📦 Project Structure
iac-aws-modular-infra/
├── modules/
│ └── vpc/
│ ├── main.tf
│ ├── variables.tf
│ └── outputs.tf
├── environments/
│ └── dev/
│ ├── main.tf
│ ├── terraform.tfvars
│ └── backend.tf
├── .gitignore
└── README.md


---

## 🎯 Features

- 🔁 **Reusable VPC module**
- ☁️ **Remote backend setup** using S3 + DynamoDB
- 🌐 Public and private subnets support
- 🔒 Secure outputs and variables
- 🚀 Production-grade structure ready for EC2, EKS, RDS modules

---

## 🧰 Tools Used

- **Terraform** v1.5+
- **AWS CLI**
- **S3 & DynamoDB** (for backend)
- **GitHub**

---

## ⚙️ How to Use

### 1️⃣ Clone the Repo

```bash
git clone https://github.com/M-Inamdar/iac-aws-modular-infra.git
cd iac-aws-modular-infra/environments/dev
```

---

### 2️⃣ Configure Backend (Optional)
Modify backend.tf:
```hcl
terraform {
  backend "s3" {
    bucket         = "your-terraform-bucket"
    key            = "dev/vpc/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
```

---

Run:
```bash
terraform init
```

---

### 3️⃣ Customize Variables
Edit terraform.tfvars:

```h
region         = "ap-south-1"
vpc_cidr       = "10.0.0.0/16"
public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnets = ["10.0.101.0/24", "10.0.102.0/24"]
```

---

### 4️⃣ Deploy Infra

```bash
terraform plan
terraform apply
```

---

### 📤 Outputs
After terraform apply, the module will return:

VPC ID

Public/Private Subnet IDs

CIDR block references

---

### 🧱 Module - VPC
Sample usage from main.tf:

```hcl
module "vpc" {
  source          = "../../modules/vpc"
  region          = var.region
  vpc_cidr        = var.vpc_cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
}
```

---

### ✌️Author
### M. M. Inamdar

DevOps Architect | Cloud Infra Specialist
