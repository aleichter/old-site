---
layout: post
title: Clojure Hello World Rest API
tags: [clojure, financialPortfolio]
---

Next step is to build our first REST API with clojure.  Simple requirement is to just build a single GET method that returns a JSON object:
```
{
    "message": "Hello, World!"
}
```
Here is an easy to follow tutorial for getting started: <a href="https://medium.com/swlh/building-a-rest-api-in-clojure-3a1e1ae096e">Building a REST API in Clojure</a>.  Here is my project.clj file to show the included dependencies:
```
(defproject portfolio-service-clojure "0.1.0-SNAPSHOT"
  :description "FIXME: write description"
  :url "http://example.com/FIXME"
  :license {:name "EPL-2.0 OR GPL-2.0-or-later WITH Classpath-exception-2.0"
            :url "https://www.eclipse.org/legal/epl-2.0/"}
  :dependencies [[org.clojure/clojure "1.10.3"]
                 ; Compojure - A basic routing library
                 [compojure "1.6.1"]
                 ; Our Http library for client/server
                 [http-kit "2.3.0"]
                 ; Ring defaults - for query params etc
                 [ring/ring-defaults "0.3.2"]
                 ; Clojure data.JSON library
                 [org.clojure/data.json "0.2.6"]]
  :main ^:skip-aot portfolio-service-clojure.core
  :target-path "target/%s"
  :profiles {:uberjar {:aot :all
                       :jvm-opts ["-Dclojure.compiler.direct-linking=true"]}})
```
and here is the core.cjl file:
```
(ns portfolio-service-clojure.core
  (:require [clojure.core]
            [org.httpkit.server :as server]
            [compojure.core :refer :all]
            [compojure.route :as route]
            [ring.middleware.defaults :refer :all]
            [clojure.pprint :as pp]
            [clojure.string :as str]
            [clojure.data.json :as json])
  (:gen-class))

; Simple Body Page
(defn simple-body-page [req]
  {:status  200
   :headers {"Content-Type" "text/html"}
   :body (str (json/write-str {:message "Hello, World!"}))})

(defroutes app-routes
  (GET "/" [] simple-body-page)
  (route/not-found "Error, page not found!"))

(defn -main
  "This is our main entry point"
  [& args]
  (let [port (Integer/parseInt (or (System/getenv "PORT") "3001"))]
    ; Run the server with Ring.defaults middleware
    (server/run-server (wrap-defaults #'app-routes site-defaults) {:port port})
    ; Run the server without ring defaults
    ;(server/run-server #'app-routes {:port port})
    (println (str "Running webserver at http:/127.0.0.1:" port "/"))))
```

Now that this is complete I will move on to a step I should have completed with the JavaScript implementation. Implement a CICD Pipeline that include infrastructure deployment to my personal cloud account from my github account.  I'll focus first on deploying to GCP.