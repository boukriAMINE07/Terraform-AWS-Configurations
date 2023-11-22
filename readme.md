# AWS Terraform Configuration Project

This project contains Terraform configurations to provision AWS infrastructure. It includes configuration files to create AWS resources such as instances, S3 buckets, VPC, subnets, and a MySQL database instance.

## Prerequisites

1. **Terraform**: Ensure you have Terraform installed on your local machine. If not, [install Terraform](https://www.terraform.io/downloads.html).

2. **AWS Credentials**: You'll need AWS access key and secret key for authentication. Store these in a file named `variables.tfvars` (not included in this repository for security reasons).

    ```hcl
    access_key = "your_access_key_here"
    secret_key = "your_secret_key_here"
    ```

## Steps to Deploy

1. **Initialize Terraform:**

    ```bash
    terraform init
    ```
> [!NOTE]  
> This will initialize the Terraform configuration and download any necessary plugins.

3. **Plan the Deployment:**

    ```bash
    terraform plan -var-file=variables.tfvars
    ```
> [!NOTE]  
> This command will create an execution plan showing the changes that will be made.
    

4. **Apply the Deployment:**

    ```bash
    terraform apply -var-file=variables.tfvars
    ```
> [!NOTE]  
> This command will apply the changes and provision the AWS resources.
    

5. **Cleanup (optional):**

    If you want to destroy the resources created by Terraform, run:

    ```bash
    terraform destroy -var-file=variables.tfvars
    ```
> [!CAUTION]  
>  This will remove all the provisioned resources.

   


> [!WARNING]  
> Ensure you provide valid AWS credentials in `variables.tfvars` before running Terraform commands.
> Always exercise caution when running `terraform apply`. Review the execution plan before proceeding.
> Remember to clean up resources after you're done to avoid incurring unnecessary charges.


