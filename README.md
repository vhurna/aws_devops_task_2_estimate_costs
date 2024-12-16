# AWS Essentials: estimate costs 

One of main benefits of the cloud is it's cost effectiveness, that's why it's important to learn how to estimate cloud costs. In this task you will work with AWS pricing calculator to estimate the cost of the Grafana deployment you will be working on over the module. 

## Prerequirements

Before completing any task in the module, make sure that you followed all the steps described in the **Environment Setup** topic, in particular: 

1. Make sure you have an [AWS](https://aws.amazon.com/free/) account.

2. Install [aws cli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

3. Install [powershell core](https://learn.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.4)

4. Install [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)

5. Log in to aws cli on your computer by running command: 
    ```
    aws configure
    ```

## Task requirements 

Your Grafana deployment will consist of the following resources: 

- EC2 virtual machine: we will go with 1 t2.micro running Linux; 
- For the EC2 we wil need a VPC and 1 Public IP; 
- We will also use some S3 storage (**S3 Standard storage**) for Grafana database backups. We will need around 10GB of space, we will do a nigtly upload of DB backups and we will clean up the old backups when we will run out of planned storage space; 
- All resources will be deployed to 'eu-central-1' region; 
- We will use on-demand pricing witout any reservations; 

To complete this task, you will need to perform the following steps: 
1. Use [AWS pricing calculator](https://calculator.aws/) to calculate our cloud infra costs. 
2. Export results in JSON format: save it to file, called `estimate.json` in this repository. 
3. Run automated test to check yourself. 
    ```
    pwsh ./tests/test-estimate.ps1
    ```
If any test fails - please check your estimate and try again.
4. Commit the `estimate.json`, and submit your solution for a review

| :memo:        |Don't be worried about the total cost of infra: if you are using AWS free account - you will get all those resources for free    |
|---------------|:--------------------------------------------------------------------------------------------------------------------------------|
