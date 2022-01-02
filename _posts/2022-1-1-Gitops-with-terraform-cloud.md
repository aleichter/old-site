---
layout: post
title: Gitops via Terraform Cloud
tags: [terraform, gitops, financialPortfolio]
---

I have worked my way though a simple gcloud tutorial to spin up a simple GKE cluster and I have created a free account on Terraform Cloud.  For immutable infrastructure management I will use Terraform Cloud to provision and manage via it's own gitops capabilities by hooking into github.  Next step is create a repo for my terraform scripts and configure Terraform to manage my GKE cluster via pull requests.