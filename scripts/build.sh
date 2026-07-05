#!/bin/bash

set -e
set -o pipefail
set -x

ROOT_DIRECTORY="$( cd "$( dirname "$( dirname "${BASH_SOURCE[0]}" )" )" &> /dev/null && pwd )"

cd "$ROOT_DIRECTORY"

xcodebuild -scheme Licensable -showdestinations

# Build.
xcodebuild -scheme Licensable -destination "platform=macOS" clean build
xcodebuild -scheme Licensable -destination "$DEFAULT_IPHONE_DESTINATION" clean build

# Test.
xcodebuild -scheme Licensable -destination "platform=macOS" test
xcodebuild -scheme Licensable -destination "$DEFAULT_IPHONE_DESTINATION" test
