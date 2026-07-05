#!/bin/bash

ROOT_DIRECTORY="$( cd "$( dirname "$( dirname "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )"

cd "$ROOT_DIRECTORY"

swift package \
    --allow-writing-to-directory _site \
    generate-documentation \
    --target Licensable \
    --output-path _site \
    --disable-indexing \
    --transform-for-static-hosting \
    --hosting-base-path 'licensable'
