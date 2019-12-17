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

## Bazel Workspace

Bazel's `WORKSPACE` is where external dependencies are defined and loaded. Pinning exact dependencies is done in the `WORKSPACE`.

* [WORKSPACE](../WORKSPACE)

## `.bazelrc`

The `.bazelrc` file is a place where customized Bazel settings can be set. The `.bazelrc` is also used to define build configurations, in this demo the build configurations are mapped one-to-one with Xcode.

* [.bazelrc](../.bazelrc)

## XcodeGen Spec

[XcodeGen](https://github.com/yonaskolb/XcodeGen) is an Xcode project generator. This demo uses XcodeGen to define the `.xcodeproj`. See [XcodeGen docs](https://github.com/yonaskolb/XcodeGen/blob/master/Docs/ProjectSpec.md)

* [project.yml](../project.yml)

## Building With Bazel

At a high level, building with Bazel is achieved by:

1. Adding a "Run Script" phase that calls `bazel build`
2. Disabling Xcode's build

### Bazel Build Run Script

For each top level target, such as apps and test, add a Run Script that calls `bazel build`. For example with XcodeGen:

```
preBuildScripts:
  - name: Build with bazel
    script: bazel build --config=$CONFIGURATION swift-driver
```

See [`project.yml`](https://github.com/kastiglione/bazel-xcode-demo-swift-driver/blob/87eaf991821d0aaecb653be0b37ffdbcd17cdf27/project.yml#L22-L27) for a more complete example.

### Disabling Xcode's Build

Xcode's build can be disabled by stubbing out various build settings to `/usr/bin/true`:

* `SWIFT_EXEC=/usr/bin/true`
* `CC=/usr/bin/true`
* `LIBTOOL=/usr/bin/true`
* `LD=/usr/bin/true`

These look just like `make` environment variables, but they are Xcode build settings.

## Post-build Steps

After calling `bazel build`, there is a series of post-build steps that take place. These steps are called from [`bazel/install.sh`](install.sh).

1. Rsync runnable build products to `DerivedData`
1. Copy intermediates required for build completion
2. Copy generated `.swiftmodule` files to `DerivedData`
3. Import indexes to `DerivedData`
4. Generate an `lldb` settings file

Importing Bazel built indexes into Xcode is done using [`lyft/index-import`](https://github.com/lyft/index-import).

These steps all make use of the environment variables Xcode provides. See Xcode's [Build Setting Reference](https://developer.apple.com/library/archive/documentation/DeveloperTools/Reference/XcodeBuildSettingRef/1-Build_Setting_Reference/build_setting_ref.html).

## Full Index Visibility

Xcode can be configured to use the full Xcode index, not just the index of the files in the project. This demo project takes advantage of that by building and importing the full index, not just the swift-driver sources.

* [xcode-index-preferences.json](../xcode-index-preferences.json)

## Extras

Bazel can produce a build graph visualization. Requires [Graphviz](https://graphviz.org).

* [bazel/graph.sh](graph.sh)
