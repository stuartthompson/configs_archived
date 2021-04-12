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
JQPARSE="jq '.workflow_runs[0] | \"\\(.conclusion) \\(.status)\"'"

SUCCESS="\"success\""
numpass=0
numrunning=0
numfail=0
failed=""

for repo in $REPOS; do
    url="https://api.github.com/repos/$USER/$repo/actions/workflows/ci.yml/runs"
    status="$(curl -s -u $TOKEN -H '$HACC' $url | jq '.workflow_runs[0] | "\(.conclusion)\(.status)"')"

    if [ $status = "\"successcompleted\"" ]; then
        numpass=$((numpass+1))
    elif [ $status = "\"nullqueued\"" ] || [ $status = "\"nullin_progress\"" ]; then
        numrunning=$((numrunning+1))
    else
        numfail=$((numfail+1))
        failed="$failed $repo"
    fi
done


# Determine underline color
if [ $numfail != 0 ]; then
    ucol="#880000"
elif [ $numrunning != 0 ]; then
    ucol="#ff8800"
else
    ucol="#008800"
fi

# Build start of output
output="%{u$ucol}%{+u}%{F#888888}"

# Append success, running, and failed job counts
if [ $numpass != 0 ]; then
    output="$output %{F#00ff00}$numpass"
fi
if [ $numrunning != 0 ]; then
    output="$output %{F#ff8800}$numrunning"
fi
if [ $numfail != 0 ]; then
    output="$output %{F#ff0000}$numfail$failed"
fi

output="$output%{-u}"

echo $output
