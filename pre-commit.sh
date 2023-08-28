#!/bin/sh

BASE_BRANCH="master"
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# Check if we're already on the baseline branch
if [ "$CURRENT_BRANCH" = "$BASE_BRANCH" ]; then
  exit 0
fi

# Fetch latest changes
git fetch

# Check if the current branch is behind the baseline branch
BEHIND=$(git rev-list --left-right --count $BASE_BRANCH...$CURRENT_BRANCH | awk '{print $1}')

if [ "$BEHIND" -ne 0 ]; then
  echo "\nError: Your branch is not up-to-date with $BASE_BRANCH."
  echo "Please take a pull of the concerned branch and try again.\n"
  exit 1
fi

exit 0