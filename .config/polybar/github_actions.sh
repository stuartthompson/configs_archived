#!/bin/sh

# This script uses the GitHub Actions API to check on the status of workflows
#  for several repositories.
# The output is inteded for use in polybar.

# Source access token (TODO: Verify that this is secure)
. $HOME/.config/secure/tokens.sh

# Configure user and list of repos
USER="stuartthompson"
REPOS="table-format blog notes"

TOKEN="token:$GITHUB_ACTIONS_POLYBAR_TOKEN"
HACC="Accept: application/vnd.github.v3+json"
JQPARSE="jq .workflow_runs[0].conclusion"

SUCCESS="\"success\""
numpass=0
numfail=0
failed=""

for repo in $REPOS; do
    url="https://api.github.com/repos/$USER/$repo/actions/workflows/ci.yml/runs"
    status="$(curl -u $TOKEN -H '$HACC' $url | $JQPARSE)"

    if [ $status = "\"success\"" ]; then
        numpass=$((numpass+1))
    else
        numfail=$((numfail+1))
        failed="$failed $repo"
    fi
done

echo "/ $numpass x $numfail $failed"
