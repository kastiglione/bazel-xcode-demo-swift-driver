#!/bin/bash

# Xcode's stdout logging shows `swiftc -v` being called to determine its
# version. Passthrough those invocation to `swiftc`.
if [[ $# -eq 1 && $1 == "-v" ]]; then
    swiftc -v
fi
