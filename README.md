# Kubernetes Hybrid Cloud

This repository contains scripts and configurations for setting up a Kubernetes hybrid cloud environment using AWS and VMware. With these scripts, you can deploy a Kubernetes cluster spanning both AWS EC2 instances and VMware virtual machines, providing a flexible and scalable infrastructure for your applications.

## Prerequisites

Before getting started, ensure you have the following prerequisites set up:

### AWS

- **IAM User**: Create an IAM user with appropriate permissions and generate access and secret keys for the user.
- **Security Group**: Create a security group named `kubernetes_hybrid` with inbound and outbound rules allowing traffic on ports `6443`, `80`, and `443`, as well as SSH.
- **Key Pair**: Create a key pair for EC2 instances and upload the public segment to an S3 bucket for self-encryption.

### VMware

- **Windows 10 VM**: Download and install Windows 10 on a VMware VM with at least 2GB of RAM, 2+ CPUs, and NAT network configuration.
- **Chocolatey**: Install Chocolatey package manager in PowerShell (admin) on the Windows VM.
- **Required Packages**: Install Terraform, Git, and Minikube via Chocolatey.

### GitHub

- **GitHub Actions**: Configure GitHub Actions to set up a runner on the Windows 10 VM using PowerShell.
- **Repository Secrets**: Save the following secrets in your repository settings:
  - `AWS_ACCESS_KEY`
  - `AWS_SECRET_KEY`

## Getting Started

1. Clone this repository to your Windows 10 runner VM:
   ```bash
   git clone https://github.com/j-barak/KubernetesHybridCloud.git
   ```
2. Change the target location of the public key segment to match your S3 bucket for self-encryption.
3. Push the changes to your repository. GitHub Actions will automatically trigger and execute Terraform commands, connecting to AWS CLI.
4. Once the deployment is complete, you can use the EC2 Instance Connect AWS service to connect to each worker and join them to the Minikube cluster.

##!!! 
Built solely by me. Watch our for small changes in PS syntax and the version of Hypervisor. 
##!!!
