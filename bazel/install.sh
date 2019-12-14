#!/bin/bash

set -euo pipefail

readonly config=macos-x86_64-min10.13-applebin_macos-darwin_x86_64-dbg
export BAZEL_BIN=bazel-out/$config/bin

"$SRCROOT"/bazel/installers/xcode-artifacts.sh
"$SRCROOT"/bazel/installers/binaries.sh

# Each of these steps can be run asynchronously. To not block the build, run
# them as background processes. Xcode blocks on the stdio streams being closed,
# so in addition to running in the background their output is redirected to
# /dev/null.
#
# tl;dr: async needs both `>/dev/null 2>&1 &`
"$SRCROOT"/bazel/installers/swiftmodules.sh >/dev/null 2>&1 &
"$SRCROOT"/bazel/installers/indexstores.sh >/dev/null 2>&1 &
"$SRCROOT"/bazel/installers/lldb-settings.sh >/dev/null 2>&1 &
