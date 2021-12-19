---
layout: post
title: Authentication and Auth0
tags: [authentication, financialPortfolio]
---

In researching how I wanted to approach implementation of JWT authentication I came across Auth0 (auth0.com) which looks kinda bad-ass.  There is a free tier so you can setup and use their authentication as a service for an app like I'm building here.  Small project with just a few users.  Perfect!  I will likely, however, not use it for this project as I'm doing this to keep my coding/technology chops up-to-date (Since I moved into Technology leadership I do keep my hands in a code a bit but not anywhere near what I would like) and I want to learn and do as much as I can on my own.  Auth0 looks like a great option for any future apps that I build as SOC2, HIPAA, compliance, etc. are taken care of as well as physical and software infrastructure.  Frankly Authentication is a commodity.  It's a must have that does not provide any unique functionality so if you can pay for a service and free up your engineering team to focus on features why not use it?!? There are plenty of opensource auth projects our there.  I am going to select Keycloak and use OAuth2.0/OIDC/JWT to manage credentials and serve as the Authentication Service for this app.
