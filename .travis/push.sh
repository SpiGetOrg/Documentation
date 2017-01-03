#!/bin/sh

git config user.name "Travis"
git config user.email "${GITHUB_EMAIL}"

git add swagger.json
git commit -m "[CI] Generate swagger.json" || echo "Commit failed (There probably were no changes)"
git push --force "https://InventiveBot:${GITHUB_TOKEN}@${GITHUB_REPO}" master
