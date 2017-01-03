#!/bin/sh

# Git Config
git config user.name "Travis"
git config user.email "${GITHUB_EMAIL}"

# Checkout
git checkout master

# Generate swagger JSON
wget -nc http://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/2.1.6/swagger-codegen-cli-2.1.6.jar -O swagger-codegen-cli.jar || echo "swagger-codegen already downloaded"
java -jar swagger-codegen-cli.jar generate -i swagger.yml -l swagger

# Commit file & push
git add swagger.json
git commit -m "Generate swagger.json [ci skip]" || echo "Commit failed (There probably were no changes)"
git push --force --quiet "https://InventiveBot:${GITHUB_TOKEN}@${GITHUB_REPO}" master
