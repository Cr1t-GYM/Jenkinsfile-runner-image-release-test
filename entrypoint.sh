#!/usr/bin/env bash
set -e

echo "$ACTIONS_CACHE_URL $GITHUB_REF"
curl -fsSL https://deb.nodesource.com/setup_18.x > node_setup.sh
chmod +x node_setup.sh
./node_setup.sh
apt-get install -y nodejs
node -v
INPUT_KEY="test" INPUT_PATH="tmp" ACTIONS_CACHE_URL=$ACTIONS_CACHE_URL node cache/dist/restore/index.js