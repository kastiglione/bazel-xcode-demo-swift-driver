#!/bin/bash

set -euo pipefail

# Copy Bazel build `.swiftmodule` files to `DerivedData`. This is used by Xcode
# and its indexing.

find "$BAZEL_BIN" \
     -name "*.swiftmodule" \
     -not -path "*/_swift_module_cache/*" \
     -print0 \
    | xargs -0 "$SRCROOT/bazel/installers/_swiftmodule.sh"
