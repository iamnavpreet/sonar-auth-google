#!/bin/bash

set -euo pipefail

# Fetch all commit history so that SonarQube has exact blame information
# for issue auto-assignment
# This command can fail with "fatal: --unshallow on a complete repository does not make sense"
# if there are not enough commits in the Git repository (even if Travis executed git clone --depth 50).
# For this reason errors are ignored with "|| true"
git fetch --unshallow || true

echo "Generating release notes from git history"
mkdir -p target
git show -s --pretty=format:"%h - %<|(35)%ai - %an - %s" $(git rev-list --tags --max-count=1)...$(git show | grep "^commit" | awk '{print $2}') | tee target/RELEASE_NOTES
echo $
export MAVEN_OPTS="-Xmx1G -Xms128m"
mvn package -B -e -V
