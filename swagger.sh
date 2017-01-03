#!/bin/sh

git config user.name "Travis"
git config user.email "${GITHUB_EMAIL}"

git checkout master

wget -nc http://repo1.maven.org/maven2/io/swagger/swagger-codegen-cli/2.1.6/swagger-codegen-cli-2.1.6.jar -O swagger-codegen-cli.jar || echo "swagger-codegen already downloaded"
java -jar swagger-codegen-cli.jar generate -i swagger.yml -l swagger

git add swagger.json
git commit -m "[CI] Generate swagger.json" || echo "Commit failed (There probably were no changes)"
git push --force "https://InventiveBot:${GITHUB_TOKEN}@${GITHUB_REPO}" master
