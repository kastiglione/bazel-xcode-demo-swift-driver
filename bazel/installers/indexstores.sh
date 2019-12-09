#!/bin/bash

set -euo pipefail

# See `_indexstore.sh` for full details.

find "$BAZEL_BIN" \
     -type d \
     -name "*.indexstore" \
     -print0 \
    | xargs -0 "$SRCROOT/bazel/installers/_indexstore.sh"
