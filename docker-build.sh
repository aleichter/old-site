#!/bin/bash

export JEKYLL_VERSION=3.5
docker run --rm --volume="$PWD:/srv/jekyll" -it jekyll/jekyll:$JEKYLL_VERSION "gem install jekyll-analytics; jekyll build"