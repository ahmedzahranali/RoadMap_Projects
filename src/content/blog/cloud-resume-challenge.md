---
title: "Breaking Down the Cloud Resume Challenge"
description: "How I built a serverless, high-availability portfolio using AWS, Terraform, and GitHub Actions."
pubDate: "May 14 2026"
heroImage: "/images/cloud-resume-challenge.jpg"
badge: "AWS & IaC"
tags: ["AWS", "Terraform", "CI/CD", "SRE"]
---

Building a resume is one thing; engineering a globally distributed, serverless infrastructure to host it is another. For my **Cloud Resume Challenge**, I moved beyond manual configuration to treat my portfolio as a production-grade environment.

## The Architecture Stack

To ensure zero-trust security and high availability, I utilized the following AWS services:

* **Frontend:** Hosted on **Amazon S3** as a static site, distributed globally via **Amazon CloudFront** for low latency.
* **Security:** Configured **AWS Certificate Manager (ACM)** for SSL/TLS encryption and restricted S3 access using **Origin Access Identity (OAI)**.
* **Backend:** A visitor counter powered by **AWS Lambda** (Python) and **Amazon DynamoDB** for persistent data storage.
* **DNS:** Managed via **Route 53** with a custom domain.

## Infrastructure as Code (IaC)

Rather than clicking through the AWS Console, I defined the entire stack in **Terraform**. This allows for:
1.  **Version Control:** Tracking infrastructure changes over time.
2.  **Idempotency:** Ensuring the environment is reproducible and consistent.
3.  **Speed:** Spinning up the entire backend in seconds.

## The CI/CD Pipeline

Efficiency in DevOps is about automation. I implemented **GitHub Actions** to handle two distinct workflows:
* **Frontend Pipeline:** Automatically syncs my Astro build to the S3 bucket and invalidates the CloudFront cache on every push to `main`.
* **Infrastructure Pipeline:** Runs `terraform plan` and `terraform apply` automatically, ensuring the live environment matches the code.

## Lessons Learned
This project reinforced the importance of **proactive observability**. By provisioning **CloudWatch** metric alarms and **SNS** notifications, I can monitor the health of my serverless compute in real-time, ensuring that my portfolio is always reachable for recruiters and collaborators.