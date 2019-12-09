#!/bin/bash

set -euo pipefail

# Copy whichever files satisfy Xcode's build requirements.
#
# Xcode calls `ditto` on the `.swiftmodule`/`.swiftdoc` files of the top-level
# target. The build will fail if the `ditto` fails, so put these files where
# Xcode looks for them.

readonly xcode_bin="$OBJECT_FILE_DIR_normal/$CURRENT_ARCH"
cp "$BAZEL_BIN/$BAZEL_PACKAGE/$PRODUCT_MODULE_NAME".swift{module,doc} "$xcode_bin"
chmod +w "$xcode_bin/$PRODUCT_MODULE_NAME".swift{module,doc}
