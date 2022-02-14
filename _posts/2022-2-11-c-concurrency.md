---
layout: post
title: C Concurrency
tags: [c, concurrency]
---

# CLANG-CONCURRENT

## Motivation
This project [clang-concurrent](https://github.com/aleichter/clang-concurrent) is a demonstration of multi-threading in c using semaphores and mutex types to safely share resources across threads (e.g. semaphores and mutex types).  

## Test Driven Development
I am a big believer in TDD.  This approach has proven to ensure better quality and sharper focus on outcomes than building unit tests after features are delivered.

## Dusting off C
The fun part is dusting off my C chops.  Specifically coming back to C after I have had mature experience in Java, NodeJS, TypeScript, etc.  My maturity has paused me from diving right into building features and has forced me to consider build, unit test, and project structure concerns where in my early days I would have seen those as annoyances rather than critical components to understand before diving into feature work.  Here is what I have worked through:
* **Defining the compiler** - I have chosen clang for this implementation.  While this project will likely run under different compilers (e.g. gcc) I am running on a mac and have found clang to be easier to setup.  I did not use the default mac implementation rather I have installed clang with homebrew.
* **Defining the build system** - CMAKE seems to be the best choice for my platform.
* **Defining the unit testing framework** - I have chosen googletest.  Seems like a popular choice and the documentation is clear and easy to follow.  Since I 

## CMAKE and googletest
My initial time has been spend trying to understand CMAKE and it's configuration in a bit more detail. The initial build with a simple hello world program worked fine.  Once I included a unit test and googletest the build broke.  I kept receiving an error that limit.h was missing which is a default system header that should be easily located by the clang compiler.  This is where I appreciate how CMAKE does not abstract away all of the details like other build tools such as maven and gradle for Java. When you run CMAKE it essentially builds scripts for you that you can manually execute each line so every compile of every file is something you can see exactly what parameters are passed to clang to build the object or final files.  This made it much more straight forward to debug the error I was receiving.  Shown below:
```bash
/include/gtest/gtest.h:54:10: fatal error: 'limits' file not found
#include <limits>
         ^~~~~~~~
```
I was able to determine that the compile line that caused this error was this:
```bash
/usr/local/opt/llvm/bin/clang -I/Users/andrew/git/clang-playground/clang-concurrent/build/3rd_party/google-test/googletest-src/googletest/include -isysroot /Applications/Xcode-beta.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk -MD -MT CMakeFiles/unit_tests.dir/tests/test_queue.c.o -MF CMakeFiles/unit_tests.dir/tests/test_queue.c.o.d -o CMakeFiles/unit_tests.dir/tests/test_queue.c.o -c /Users/andrew/git/clang-playground/clang-concurrent/tests/test_queue.c
```
What I realized was that googletest is a c++ library that can be utilized to test c programs but it's important that unit tests which include this library are c++ files and not c files. A simple change of file name from test_queue.c to test_queue.cpp solved this error.  Rerunning CMAKE changes the scripts to call clang++ instead of clang.  The reason limits was not found is that it needed the c++ limits.h file which clang was not finding.

Now that these initial bootstrap and project setup details are out of the way it's time to define test cases and then start iterating through the code to make the test cases pass.