---
layout: post
title: Oops.  I forgot about Investors.
tags: [tdd, financialPortfolio]
---

Some how in my event storm I just assume investors magically appear but alas they need a service to create an investor account and it needs to link to portfolios.  I do not think I can make the root aggregate investor as a investors and portfolios have a many-to-many relationship.  A single investor could own multiple portfolios and a single portfolio could have multiple investors.  I've updated the event storm to v2