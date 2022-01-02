---
layout: post
title: Gitops - Setup GKE
tags: [clojure, gitops, financialPortfolio]
---

I'm familiar with gitops as the talented engineers I've worked with throughout my career have worked to utilize these techniques into CD pipelines.  The tools landscape for gitops can be overwhelming so it's clearly hard to know where to start.  At the time of this writing the Linux Foundation is offering free enrollment to an Intro to gitops so I will start here.  <a href="https://training.linuxfoundation.org/training/introduction-to-gitops-lfs169/">Introduction to Gitops (LSF169)</a> so far is a nice intro course with practical examples.  

At the same time I'm going to manually setup a GKE cluster in my personal GCP account and work towards automating the provisioning of that cluster.  Ultimately cluster changes and configuration will be managed via a gitops pipline.