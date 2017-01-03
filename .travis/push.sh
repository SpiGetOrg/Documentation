#!/bin/sh

git config --global user.email "${GITHUB_EMAIL}"

git remote set-url origin git@github.com:${GITHUB_USER}/SpiGetOrg/Documentation.git
git add swagger.json
git push
