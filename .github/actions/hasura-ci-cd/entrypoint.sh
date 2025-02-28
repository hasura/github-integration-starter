#!/bin/sh -l

set -e

if [ -z "$HASURA_ENDPOINT" ]; then
    echo "HASURA_ENDPOINT is required to run commands with the hasura cli"
    exit 126
fi

command="hasura $* --skip-update-check --endpoint '$HASURA_ENDPOINT'"
printed_command=$command

if [ -n "$HASURA_ADMIN_SECRET" ]; then
    command="$command --admin-secret '$HASURA_ADMIN_SECRET'"
    # make sure secret is not printed (see issue #15)
    printed_command="$printed_command --admin-secret '***'" 
fi

if [ -n "$HASURA_WORKDIR" ]; then
    cd $HASURA_WORKDIR
fi

if [ -n "$HASURA_ENGINE_VERSION" ]; then
    hasura update-cli --version $HASURA_ENGINE_VERSION
else
  DETECTED_HASURA_ENGINE_VERSION=$(curl -s "$HASURA_ENDPOINT"/v1/version \
    | jq .version \
    | awk '{split($0,a,"-"); print a[1]}' \
    | awk '{split($0,a,"\""); print a[2]}')

  if [ -n "$DETECTED_HASURA_ENGINE_VERSION" ]; then
      hasura update-cli --version $DETECTED_HASURA_ENGINE_VERSION
  fi
fi

# secrets can be printed, they are protected by Github Actions
echo "Executing $printed_command from ${HASURA_WORKDIR:-./}"

sh -c "$command"
