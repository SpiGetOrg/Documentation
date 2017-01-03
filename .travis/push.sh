#!/bin/sh

git config --global user.email "${GITHUB_USER}"

git remote set-url origin https://${GITHUB_USER}:${GITHUB_TOKEN}/SpiGetOrg/Documentation.git
git add swagger.json
git push
