#!/bin/bash
set -e
cp /app/config/database.yml.docker /app/config/database.yml
# Remove a potentially pre-existing server.pid for Rails.
rm -f /app/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"