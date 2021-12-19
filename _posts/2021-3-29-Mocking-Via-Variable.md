---
layout: post
title: Control mocking via config variable
tags: [tdd, financialPortfolio]
---

Jest controls mocks by placing the mock object in the __mocks__ directory of the directory which the mock target exists.  In this case esdb.js is in the db directory so the structure looks like this:

> ./db/esdb.js<br>
> ./db/__mocks__/esdb.js

In my test case file I put the following code:
    jest.mock('../db/esdb')
This line tells Jest to use the mock implementation of esdb rather than the real implementation of esdb.  What I have been doing is commenting out the the jest.mock() line while developing so that my test cases execute against my real local implementation of EventStore. What I want to do is make this a switchable option so that I do not have to comment out all jest.mock lines when I want to switch from the mock implementation rather than the real implementation.  Unfortunately, but rightly so, Jest validates all cli inputs.  So it is not easy to use a command line switch.  Something like the following would be nice:

    npm test --unmockAll

I did see a blog post showing how to do this but it seemed like a lot of work to achieve when using an environment variable achieves the same goal and is a lot less work.  What I did instead was add the following the test.json file in my config directory.

        "testConfig" : {
        "unmockAll": false
    }

Then change the const ESDB = require() to var ESDB = require() and add the following lines after the jest.mock
    
    jest.mock('../db/esdb');
    if(config.hasOwnProperty("testConfig") && config.testConfig.hasOwnProperty("unmockAll") && config.testConfig.unmockAll) {
        ESDB = jest.requireActual('../db/esdb');
    }

Yes, getting this mock setup and working correctly has a lot of work and it feels unnecessary.  I'm quite convinced that I will be able to refactor this project to not have to use mocks for I/O utilities like EventStore or Grpc.  Those are well tested and well supported software packages so no need to include them in my unit tests.