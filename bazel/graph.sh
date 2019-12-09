#!/bin/bash

set -euo pipefail

readonly graph=$(mktemp)
mv "$graph" "$graph.pdf"

# To include C/C++ dependencies, call script with "library"
target_kind=${1:-swift_library}
query="kind($target_kind, deps(swift-driver))"
bazel query --output=graph --nograph:factored "$query" \
    | dot -Tpdf -o "$graph.pdf"

open "$graph.pdf"
