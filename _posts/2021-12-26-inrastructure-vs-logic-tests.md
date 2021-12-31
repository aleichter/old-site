---
layout: post
title: Infrastructure vs Logic Tests
tags: [eventSourcing, tdd, financialPortfolio]
---

One of the key features of Event Sourcing is the separation of logic from side effect (or infrastructure code).  The advantage of this separation is that logic code is based on processing events which means that each function to process a specific event should be immutable.  Thus unit tests built against those functions, once they pass, should be immutable and stable.  The real value here is that once you complete event processing code for an event and complete it's unit tests then you should not have to revisit that code nor those tests again.  Infrastructure code, however, is not immutable (but perhaps there is a way to make it immutable by tying it to infrastructure versions?  This is worth more exploration).  

The purpose of this post is to highlight that without separation of your test cases of mutable infrastructure code with immutable logic event processing code you risk adding complexity to the most important part of your code base which is your business logic.  I've recognized that without this separation I am needlessly adding complexity to my logic test cases and making all my logic test cases dependant on the software infrastructure that handles side effects.  E.g. I don't need EventStore to test business logic.  I just need to pass into my logic a stream of events.  This can be done without the need to have EventStore running and without the need to Mock it.