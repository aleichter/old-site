---
layout: post
title: Moving on to Clojure
tags: [clojure, tdd, financialPortfolio]
---

Recapping a few takeaways from my experience so far:
* Taking a functional programming approach means there is no state to manage before and after function execution which makes unit tests (and ultimately maintenance) more straight forward.
* Code needs to be separated from infrastructure (e.g. Side effects) so that the vast majority of logic tests do not need to have complex mocks.  As well separating this code ensures that when logic needs to be added or changed complex side effects do not need to be managed increasing future maintenance complexity.  
* Infrastructure code is any code that causes a side effect.  E.g. anything code that touches code, systems, or services outside of the executing function.  E.g. A call to a services, database, tcp port, filesystem, tcp port, etc.
* Infrastructure code should be built with as much separation from business logic as possible so that effort in both logic and infrastructure maintenance is more predictable.  
* Unit Test suites should be separated between logic and infrastructure so that logic tests and infrastructure tests can be run at different frequencies.
* Mocks should be switchable so that unit tests can be run with both real and mocked infrastructure code.
* While I tried to implement some of this during my JavaScript implementation I realize that I have too many dependencies on Infrastructure code and not enough separation which means all my unit tests either require mocks or the real infrastructure to run which greatly adds complexity to all unit tests.
* JavaScript is not an ideal language to develop complex code because of the lack of static typing.  Type script is much more ideal as it allows interfaces etc. to ensure data structures are clear and enforced.  The draw back is that coding is much more verbose which may add time to initial delivery but I believe the long term impacts on maintenance will save time.  E.g. TypeScript makes it easier to understand the intention of code blocks, methods, and functions.
* I'm pausing my TypeScript implementation as I feel the differences between JavaScript and TypeScript are well documented and more obvious so it will be more beneficial to move to a new language.  As well, I'm not interested to try and refactor my JavaScript implementation as I feel I will lose learning opportunities gained by moving to a new language.
* Because I've been touting the benefits of functional programming throughout this journey it's time to move on to a true functional language so I'm going to dive into Clojure.  I was tempted to move on to Golang because I'm comfortable with it (and I LOVE IT) but as a true learning exercise I think the benefit of building a Clojure services first is much more interesting.  Look for the portfolio-service-clojure project in my github financial-portfolio repo.