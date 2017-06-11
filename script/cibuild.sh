#!/usr/bin/env bash
set -e # halt script on error

bundle exec jekyll build
bundle exec htmlproofer --http-status-ignore "999,403,401,404" ./_site 