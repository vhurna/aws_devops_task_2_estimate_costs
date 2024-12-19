# AWS Essentials: Estimate Costs 

One of the main benefits of the cloud is its cost-effectiveness; that's why learning how to estimate cloud costs is essential. In this task, you will work with an AWS pricing calculator to calculate the price of the Grafana deployment you will be working on over the module. 

## Prerequirements

Before completing any task in the module, make sure that you followed all the steps described in the **Environment Setup** topic, in particular: 

1. Make sure you have an [AWS](https://aws.amazon.com/free/) account.

2. Install [AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html).

3. Install [PowerShell Core](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.4).

4. Install [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli).

5. Log in to AWS CLI on your computer by running the command:

    ```
    aws configure
    ```

## Task Requirements 

Your Grafana deployment will consist of the following resources: 

- EC2 virtual machine: we will go with one *t2.micro* running Linux.
- For the EC2, we will need a VPC and one Public IP.
- We will also use some S3 storage (**S3 Standard Storage**) for Grafana database backups. We will need around 10GB of space. We will do a nightly upload of DB backups and clean up the old backups when we run out of planned storage space. 
- All resources will be deployed to the *eu-central-1* region.
- We will use on-demand pricing without any reservations. 

To complete this task, you will need to perform the following steps: 

1. Use [AWS pricing calculator](https://calculator.aws/) to calculate our cloud infra costs. 

2. Export results in JSON format: save it to a file called `estimate.json` in this repository. 

3. Run an automated test to check yourself:
   
    ```
    pwsh ./tests/test-estimate.ps1
    ```

If any test fails, please check your estimate and try again.

4. Commit the `estimate.json`, and submit your solution for review.

💡 Don't be worried about the total cost of infra: if you are using an AWS free account — you will get all those resources for free.
