#!/bin/sh

# Git Config
git config user.name "Travis"
git config user.email "${GIT_EMAIL}"

# Checkout
git checkout master

# Generate swagger JSON
wget -nc -O swagger-codegen-cli.jar https://oss.sonatype.org/content/repositories/releases/io/swagger/swagger-codegen-cli/2.2.1/swagger-codegen-cli-2.2.1.jar || echo "swagger-codegen already downloaded"
java -jar swagger-codegen-cli.jar generate -i swagger.yml -l swagger

# Remove files we don't want
rm swagger-codegen-cli.jar

# Commit file & push
git add swagger.json
git commit -m "Generate swagger.json [ci skip]" || echo "Commit failed (There probably were no changes)"
