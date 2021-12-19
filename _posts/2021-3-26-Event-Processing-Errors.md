---
layout: post
title: Event processing should not throw exceptions 
---

My first implementation of the portfolio-event-process threw exceptions for invalid states.  It became clear to me after this implementation that if a stream ever was serialized in a way that created an invalid state then there would be no way to recover the existing stream.  One of the key tenants to the event processor is that it should throw no exceptions.  It is not the job of the event processor to validate if events were serialized correctly. The challenge with throwing exceptions in the event processor is that there is no way to recover.  Events are immutable and you cannot inject an new event into the middle of the stream.  It is append only so corrections can only be made to the end of the stream of events.  That means validation has to occur prior to appending new events and exception notifications can be thrown in the UI after state is calculated to indicate a correction event needs to be appended.  For example: selling a security before it exists in the account should create a security with a negative quantity even though this is an invalid state.  It is the aggregate root object that should validate data consistency before serializing the event. 

#eventSourcing