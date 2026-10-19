# Azure Todo Application Infrastructure

Terraform-based infrastructure for deploying a Django Todo application to Microsoft Azure.

The project provisions the required networking, compute and storage resources, configures a Linux virtual machine, and automatically deploys the application using an Azure VM Custom Script Extension.

## Architecture

The infrastructure is divided into reusable Terraform modules:

- **Network** – Virtual Network, Subnet, Network Security Group and Public IP
- **Compute** – Linux Virtual Machine, Network Interface and VM Extension
- **Storage** – Azure Storage Account and private Blob Container
- **Remote State** – Terraform state stored in Azure Blob Storage

The application is deployed to an Ubuntu Linux VM and managed as a `systemd` service.

## Technologies

- Terraform
- Microsoft Azure
- Azure Virtual Network
- Azure Linux Virtual Machines
- Azure Network Security Groups
- Azure Storage / Blob Storage
- GitHub Actions
- Bash
- Linux / systemd
- Python / Django

## Infrastructure

Terraform provisions:

- Azure Resource Group
- Virtual Network and Subnet
- Network Security Group with configurable rules
- Public IP with generated DNS suffix
- Network Interface
- Ubuntu 22.04 Linux Virtual Machine
- Azure Storage Account
- Private Blob Storage Container
- VM Custom Script Extension

Infrastructure is organized into independent `network`, `compute` and `storage` modules.

## Application Deployment

Application provisioning is automated using an Azure VM Custom Script Extension.

During deployment the VM:

1. Installs required system packages
2. Downloads the application source code
3. Configures the application directory
4. Registers the application as a `systemd` service
5. Starts and enables the service automatically

## CI

GitHub Actions validates Terraform changes on pull requests.

The pipeline performs:

- Terraform formatting checks
- Terraform initialization
- Terraform validation
- Infrastructure configuration checks

## Project Structure

```text
.
├── .github/
│   └── workflows/
├── app/
├── modules/
│   ├── compute/
│   ├── network/
│   └── storage/
├── backend.tf
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
└── install-app.sh
```

## Deployment

Initialize Terraform:

```bash
terraform init
```

Review the infrastructure changes:

```bash
terraform plan
```

Deploy the infrastructure:

```bash
terraform apply
```

Terraform outputs the VM public IP and FQDN after provisioning.

## Cleanup

To remove all provisioned resources:

```bash
terraform destroy
```
