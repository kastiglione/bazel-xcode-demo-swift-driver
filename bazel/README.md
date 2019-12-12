# Technical Details and Links

## Bazel Build Files

Bazel `BUILD` files are similar to `Package.swift` files. They use a Python-like syntax (called Starlark) to define the build targets and their dependencies. Instead of a single `Package.swift`, Bazel builds are defined modularly across many `BUILD` files.

Compare the [`Package.swift`](../Package.swift) to these swift-driver `BUILD` files:

* [Sources/swift-driver/BUILD](../Sources/swift-driver/BUILD)
* [Tests/SwiftDriverTests/BUILD](../Tests/SwiftDriverTests/BUILD)
* [Sources/SwiftDriver/BUILD](../Sources/SwiftDriver/BUILD)

External dependency `BUILD` files:

* [bazel/llbuild.BUILD](llbuild.BUILD)
* [bazel/swift-tools-support-core.BUILD](swift-tools-support-core.BUILD)
* [bazel/yams.BUILD](yams.BUILD)

## XcodeGen Spec

[XcodeGen](https://github.com/yonaskolb/XcodeGen) is an Xcode project generator. This demo uses XcodeGen to define the `.xcodeproj`. See [XcodeGen docs](https://github.com/yonaskolb/XcodeGen/blob/master/Docs/ProjectSpec.md)

* [project.yml](../project.yml)

## Post-build Steps

After calling `bazel build`, there is a series of post-build steps that take place. These steps are called from [`bazel/install.sh`](install.sh).

1. Rsync runnable build products to `DerivedData`
1. Copy intermediates required for build completion
2. Copy generated `.swiftmodule` files to `DerivedData`
3. Import indexes to `DerivedData`
4. Generate an `lldb` settings file

These steps all make use of the environment variables Xcode provides. See Xcode's [Build Setting Reference](https://developer.apple.com/library/archive/documentation/DeveloperTools/Reference/XcodeBuildSettingRef/1-Build_Setting_Reference/build_setting_ref.html).

## Extras

Bazel can produce a build graph visualization. Requires [Graphviz](https://graphviz.org).

* [bazel/graph.sh](graph.sh)
