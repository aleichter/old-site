---
layout: post
title: grpcurl and app Logging
tags: [grpc, nodejs, financialPortfolio]
---

I have finished wiring up the controller and routed all the controller methods to the GrpcServer.  I'm now testing the GrpcServer itself using grpcurl (https://github.com/fullstorydev/grpcurl).  This seems to be the most straight forward method of testing gRPC.  I am running into some errors and realize I need some logging output on the nodejs server.  In looking for something familiar it looks like winston is the most log4j like package.  Not sure if that's the right nodejs like pattern to use but coming from the Java world it's what I'm used to so I'll try that first.