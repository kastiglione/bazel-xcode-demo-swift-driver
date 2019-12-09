#!/bin/bash

set -euo pipefail

# Install the runnable products so that Xcode can run it. This includes `.app`s,
# `.xctest`s, and also command line binaries.

input="bazel-bin/$BAZEL_PACKAGE/$TARGET_NAME${WRAPPER_SUFFIX:-}"
output="$TARGET_BUILD_DIR/$FULL_PRODUCT_NAME"
mkdir -p "$(dirname "$output")"

if [[ -d $input ]]; then
    # Copy bundle contents, into the destination bundle.
    # This avoids self-nesting, like: Foo.app/Foo.app
    input+="/"
fi

rsync --quiet \
    --recursive --chmod=u+w --delete \
    "$input" "$output"
