---
layout: post
title: Clojure Environment Setup
tags: [clojure, financialPortfolio]
---

![So It Begins](/images/SoItBegins.jpeg)

First step in learning any new language is getting the environment setup quickly so you can run your first "Hello World!" program.  This is gets you quickly past the unknowns and first run jitters to start getting to something productive.  Here are my initial environment requirements for Clojure and right now I have no idea how any of this works:
* **IDE Setup** - I assume there is a Clojure extension for Visual Studio Code (which is my favorite IDE.  With the exception of Java I use this for all other programming).  
* **Build Environment** - I need to ensure I understand how to setup a local build environment that would be able to integrate into a CI pipeline.
* **Docker Image Build** - While this is truly part of the build setup it is important enough to call out separately.  
* **Unit Test Framework** - Understanding how Unit Tests are executed and can integrate into a CI pipeline is a critical step in the environment setup.
* **Linting** - I've known about linting for a while but I really did not understand it's full power until digging into this project.  I'm assuming there is linting available for clojure for all the reasons it's available in other languages.