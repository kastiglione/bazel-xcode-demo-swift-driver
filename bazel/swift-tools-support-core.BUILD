load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library", "swift_module_alias")

swift_module_alias(
    name = "SwiftToolsSupport",
    deps = [":TSCBasic", ":TSCUtility"],
    visibility = ["//visibility:public"],
)

# Tools support core targets

cc_library(
    name = "TSCclibc",
    srcs = glob(["Sources/TSCclibc/*.c"]),
    hdrs = glob(["Sources/TSCclibc/include/*.h"]),
)

swift_library(
    name = "TSCLibc",
    module_name = "TSCLibc",
    srcs = glob(["Sources/TSCLibc/**/*.swift"]),
    deps = [":TSCclibc"],
)

swift_library(
    name = "TSCBasic",
    module_name = "TSCBasic",
    srcs = glob(["Sources/TSCBasic/**/*.swift"]),
    deps = [":TSCLibc"],
)

swift_library(
    name = "TSCUtility",
    module_name = "TSCUtility",
    srcs = glob(["Sources/TSCUtility/**/*.swift"]),
    deps = [":TSCBasic"],
)
