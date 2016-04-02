#!/bin/sh

export VERBOSE=--verbose

docker run --rm --label=jekyll --volume=$(pwd):/srv/jekyll \
    -it -p 127.0.0.1:4000:4000 jekyll/jekyll:pages \
    jekyll serve --watch -H 0.0.0.0 --drafts

