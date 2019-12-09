#!/bin/bash

set -euo pipefail

workspace=swift-driver.xcodeproj/project.xcworkspace/xcshareddata/WorkspaceSettings.xcsettings

mkdir -p "$(dirname "$workspace")"
if [[ ! -f $workspace ]]; then
    plutil -convert xml1 -o "$workspace" - <<< "{}"
fi

plutil -replace BuildSystemType -string Original "$workspace"
