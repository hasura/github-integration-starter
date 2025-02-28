FROM frolvlad/alpine-glibc:alpine-3.15_glibc-2.33

RUN apk add --no-cache curl bash libstdc++ jq
RUN curl -L https://github.com/hasura/graphql-engine/raw/stable/cli/get.sh | bash

COPY "entrypoint.sh" "/entrypoint.sh"

RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]
