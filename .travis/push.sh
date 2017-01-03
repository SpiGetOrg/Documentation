#!/bin/sh

setup_git() {
  git config --global user.email "${GITHUB_USER}"
}

push() {
  git remote set-url origin https://${GITHUB_USER}:${GITHUB_TOKEN}
  git add swagger.json
  git push
}

setup_git
push
