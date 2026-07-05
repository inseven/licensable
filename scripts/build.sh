#!/bin/bash

set -e
set -o pipefail
set -x

SCRIPT_DIRECTORY="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
ROOT_DIRECTORY="${SCRIPT_DIRECTORY}/.."

cd "$ROOT_DIRECTORY"

xcodebuild -scheme Licensable -showdestinations

# Build.
xcodebuild -scheme Licensable -destination "platform=macOS" clean build
xcodebuild -scheme Licensable -destination "$DEFAULT_IPHONE_DESTINATION" clean build

# Test.
xcodebuild -scheme Licensable -destination "platform=macOS" test
xcodebuild -scheme Licensable -destination "$DEFAULT_IPHONE_DESTINATION" test
