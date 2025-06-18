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
### 🔧 Module - EC2 (Added in v1.0.1)

Sample usage from `main.tf` in `environments/dev`:

```hcl
module "ec2" {
  source             = "../../modules/ec2"
  ami_id             = var.ami_id
  instance_type      = var.instance_type
  key_name           = var.key_name
  subnet_id          = var.public_subnet_id
  security_group_ids = var.security_group_ids
}
```


### 🖥️ EC2 Variables (terraform.tfvars)
Make sure these variables are defined in your terraform.tfvars:

```hcl
ami_id             = "ami-020cba7c55df1f615"
instance_type      = "t2.micro"
key_name           = "your-key-pair-name"
public_subnet_id   = "subnet-xxxxxxxx"
security_group_ids = ["sg-xxxxxxxx"]
```

---

### 📥 Outputs After EC2 Creation

EC2 Instance ID

Public IP

Availability Zone

---

### 🏷️ Releases
v1.0.0 – Modular VPC

v1.0.1 – Modular EC2 provisioning added

---

### ✌️Author
### M. M. Inamdar

DevOps Architect | Cloud Infra Specialist
