  
# Cloud-Native E-commerce Platform on AWS with Jenkins-Based DevSecOps Pipeline

This project demonstrates a fully containerized, microservices-based e-commerce platform deployed on AWS using Amazon EKS, Jenkins CI/CD, Terraform-based infrastructure, Helm charts, Blue-Green deployment, and DevSecOps automation.

---

## 🔧 Tech Stack

- **AWS Services:** EKS, ECR, RDS, ALB, IAM, WAF, S3, Route53  
- **CI/CD:** Jenkins (EC2), Helm, GitHub, Trivy  
- **Infrastructure as Code:** Terraform (modular)  
- **Containers & Orchestration:** Docker, Kubernetes, Helm  
- **Security:** AWS WAF, Trivy scanning, IAM policies  
- **Deployment Strategy:** Blue-Green via ALB Ingress  

---

## 🚀 Features

- Modular Terraform-based infrastructure  
- Jenkins pipelines with Trivy scanning  
- Blue-Green deployments via Helm and ALB  
- Canary-like Ingress switching with patch automation  
- Three microservices: Product, Auth, Order  
- Centralized Ingress managed per path  

---

## 🧠 Architecture Highlights

- Microservices deployed as separate Helm releases (blue/green)  
- Jenkins pipeline automates Docker build, Trivy scan, Helm deploy  
- ALB Ingress Controller used for traffic routing  
- Ingress `kubectl patch` used to switch traffic between environments  

---

## 📁 Folder Structure

```bash
.
├── microservices/           # Product, Auth, Order Node.js apps
├── helm-charts/            # Helm charts per microservice
├── infra/                  # Terraform modules and root
├── jenkins/                # Jenkinsfile and seed jobs
├── scripts/                # Automation scripts for promotion/rollback
├── README.md
└── Jenkinsfile
```

---

## 🔄 Blue-Green Workflow

1. **Deploy Green environment via Jenkins**  
2. **Run health checks or smoke tests**  
3. **Execute script:**  
   ```bash
   ./scripts/switch-ingress-to-green.sh
   ```
4. **Rollback if needed:**  
   ```bash
   ./scripts/switch-ingress-to-blue.sh
   ./rollback-to-blue.sh <last-stable-tag>
   ```

---

## ⚙️ Usage

```bash
# Initialize and apply infrastructure
terraform init && terraform apply

# Deploy green environment with new build tag
./promote-green.sh <tag>

# Route traffic to green
./switch-ingress-to-green.sh
```

---

## ✅ Author

**Joshua Veeraiah**  
AWS Certified DevOps Engineer – Professional  

For interview use, technical demonstrations, and DevOps portfolio showcase.
