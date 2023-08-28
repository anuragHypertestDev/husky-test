#!/bin/bash

# Check if the current branch is master
if [ "$(git rev-parse --abbrev-ref HEAD)" != "master" ]; then
    # Check if the current branch is in sync with master
    if git diff master --exit-code; then
        echo "Branch is in sync with master. Commit allowed."
        exit 0
    else
        echo "Branch is not in sync with master. Commit not allowed."
        exit 1
    fi
fi

exit 0