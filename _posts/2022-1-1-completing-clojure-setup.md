---
layout: post
title: Completing The Clojure Environment
tags: [clojure, financialPortfolio]
---

* **IDE Setup** - Done. <a href="https://code.visualstudio.com/">Visual Studio Code</a> and <a href="https://calva.io/">Calva</a> Extension.
* **Build Environment** - Done. Leiningen is similar to maven/graddle in that it automates tasks related to development and building applications with Clojure.  Easy to integrate into a CI Pipeline. <a href="https://leiningen.org/">Leiningen</a> 
* **Docker Image Build** - Done.  Clojure uses the JVM for runtime.  Clojure uses the clojure.jar file to compile down to bytecode so managing the distributable binary is the same as managing any other JVM artifact.  Clojure does compile down to other VMs such as CLR and also, using GraalVM, can compile to native.  We will stick with JVM as it is the most popular deployment and, of course, Dockerfile. <a href="https://docs.docker.com/engine/reference/commandline/build/">docker build</a>
* **Unit Test Framework** - Done.  Leiningen handles my unit testing requirements and has a plugin for code coverage.  <a href="https://leiningen.org/">Leiningen</a> and <a href="https://github.com/cloverage/cloverage">cloverage</a>
* **Linting** - Done. clj-kondo seems to be the defacto linting framework for clojure.  It is installed in vs code automatically with Calva but will need to be installed wherever your pipline runs for CI Integration. <a href="https://github.com/clj-kondo/clj-kondo">clj-kondo</a>