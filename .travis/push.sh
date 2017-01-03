#!/bin/sh

git config user.name "Travis"
git config user.email "${GITHUB_EMAIL}"

git add swagger.json
git commit -m "[CI] Generate swagger.json"
git push --force --quiet "https://${GITHUB_TOKEN}@${GITHUB_REPO}" master
