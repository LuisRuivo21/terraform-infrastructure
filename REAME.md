# IaC - Deploying application infrastructure to AWS using Terraform

This project aims to deploy a web application with high availability to handle high and low traffic.

For this project we are going to use Terraform (an open-source IaC tool that allow us to deploy resources quickly, it's easy to maintain and has high flexibility).

### Project Infrastructure:
1. Network:
    - VPC
    - Subnets (Public & Private)
    - Internet Gateway
    - NAT Gateway
    - Elastic IP
    - Route Tables (Public & Private)

2. Security Groups:
    - One to allow SSH connection to EC2 instances.
    - One to allow HTTP/HTTPS traffic from internet to ALB.
    - One to allow HTTP/HTTPS traffic from ALB to ASG instances.

3. ALB (Application Load Balancer):
    - ALB to distribute traffic among the ec2 instances.
    - Listeners to listen for HTTP traffic on port 80 and HTTPS traffic on port 443.
    - ALB Listener Rules to route requests to different target groups based on the content of the application traffic.
    - Target Group to target ec2 instances web server (Nginx).

4. EC2 Launch Template:
    - Template to define the type of ec2 instances to launch.

5. ASG (Auto Scaling Group):
    - To launch our ec2 instances in the private subnet and dynamically scales based on demand.

6. Remote Backend (S3 Bucket and DynamoDB Table):
    - To securely store Terraform state files remotely in the cloud.
    - S3 Bucket to enable remote state storage with AWS.
    - DynamoDB Table to use for locking.


### Infrastructure Diagram:


