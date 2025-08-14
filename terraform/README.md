# 🚀 Infrastructure as Code (IaC) with Terraform

Infrastructure as Code (IaC) allows you to manage and provision your infrastructure **through code**, making it **automated, repeatable, and version-controlled**.

---

## 📜 Before IaC
Traditionally, infrastructure management was **manual and time-consuming**:

1. ⚙️ **Manual Server Configurations** → Prone to inconsistencies and errors.
2. ❌ **No Version Control** → Hard to track changes or roll back.
3. 📄 **Documentation Heavy** → Steps could become outdated quickly.
4. 🛠 **Limited Automation** → Mostly basic scripting.
5. 🐢 **Slow Provisioning** → Multiple manual steps caused delays.

---

## ✅ Why IaC?
IaC solves these problems by **automating infrastructure provisioning** using tools like:
- **Terraform**
- AWS CloudFormation
- Azure Resource Manager
- Google Deployment Manager

With IaC, you can:
- Define your infra **once** and deploy it **everywhere**.
- Use **version control** for infra changes.
- **Automate** provisioning in CI/CD pipelines.

---

## 🌟 Why Terraform?
Terraform stands out among IaC tools because:

1. **🌍 Multi-Cloud Support** — Works with AWS, Azure, GCP, on-premises, etc.
2. **📦 Large Ecosystem** — Thousands of pre-built providers and modules.
3. **📝 Declarative Syntax (HCL)** — Focus on *what* you want, not *how* to do it.
4. **📂 State Management** — Tracks current infra state for precise updates.
5. **🔍 Plan & Apply Workflow** — Preview changes before applying.
7. **🔗 Integration Friendly** — Works with Docker, Kubernetes, Ansible, Jenkins, etc.
8. **💡 Human-Readable Language** — Easy to learn, write, and maintain.

---

## 🏗 Terraform Basics
Here are **key terms** you should know:

| Term | Description |
|------|-------------|
| **Provider** | Plugin that lets Terraform manage resources for a specific platform (AWS, Azure, GCP). |
| **Resource** | The actual infrastructure component (VM, DB, Network,ec2. etc.). |
| **Module** | Reusable Terraform configuration packages. |
| **Configuration File** | `.tf` files defining desired infrastructure state. |
| **Variable** | Placeholder for dynamic values. |
| **Output** | Values returned after resource creation. |
| **State File** | Tracks current infrastructure state (`terraform.tfstate`). |
| **Remote Backend** | Stores state remotely for collaboration (e.g., S3, Terraform Cloud). |

---

## ⚡ Getting Started with Terraform for AWS

### 1️⃣ Install AWS CLI
Download & install from:  
👉 [AWS CLI Download Page](https://aws.amazon.com/cli/)

Verify installation:
```bash
aws --version
```

---

### 2️⃣ Create AWS IAM User
1. Login to **AWS Console** → Go to **IAM**.
2. Create a **new user** with:
   - Access type: **Programmatic access**.
   - Permissions: **AmazonEC2FullAccess** (and more if needed).
3. Save the **Access Key ID** and **Secret Access Key**.

---

### 3️⃣ Configure AWS CLI
Run:
```bash
aws configure
```
Enter:
```
AWS Access Key ID: <Your Key>
AWS Secret Access Key: <Your Secret>
Default region: ap-south-1   # Example
Default output format: json
```

---

### 4️⃣ Install Terraform
Download from:  
👉 [Terraform Download](https://developer.hashicorp.com/terraform/downloads)

Verify:
```bash
terraform -version
```

---

## 🚀 First Terraform Project Example



**Commands:**
```bash
terraform init     # Initialize project
terraform plan     # Preview changes
terraform apply    # Deploy infra
terraform destroy  # Remove infra
```

---

## 📌 Best Practices
- 🔒 **Never commit `terraform.tfstate`** — use `.gitignore`.
- 🗂 **Use modules** for reusable code.
- 🌐 **Use Remote Backends** for team projects.
- ✅ **Always review `terraform plan`** before applying.

---

## 📚 References
- [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
- [Terraform AWS Provider Docs](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
- [Terraform Registry](https://registry.terraform.io/)

---
INFRA/
├── common/                      # Common reusable Terraform code
│   ├── ec2.tf                   # EC2 instance definitions
│   ├── s3.tf                    # S3 bucket definitions
│   ├── eks.tf                   # EKS cluster setup
│   ├── iam.tf                   # IAM roles/policies
│   ├── security-groups.tf       # Security groups
│   ├── variables.tf             # Common variables
│   ├── outputs.tf               # Common outputs
│
├── environments/                # Separate envs that import common code
│   ├── dev/
│   │   ├── main.tf              # Calls ../common as a module
│   │   ├── variables.tf         # Dev-specific vars
│   │   ├── terraform.tfvars     # Dev-specific values
│   │   └── backend.tf           # Remote backend config (S3, DynamoDB)
│   │
│   ├── release/
│   │   ├── main.tf              # Calls ../common as a module
│   │   ├── variables.tf         # Release-specific vars
│   │   ├── terraform.tfvars     # Release-specific values
│   │   └── backend.tf           # Remote backend config
│   │
│   └── prod/
│       ├── main.tf              # Calls ../common as a module
│       ├── variables.tf         # Prod-specific vars
│       ├── terraform.tfvars     # Prod-specific values
│       └── backend.tf           # Remote backend config
│
├── scripts/                     # Helper scripts
│   ├── init.sh                  # Terraform init helper
│   ├── plan.sh                  # Terraform plan helper
│   ├── apply.sh                 # Terraform apply helper
│   └── destroy.sh               # Terraform destroy helper
│
├── README.md
└── .gitignore
