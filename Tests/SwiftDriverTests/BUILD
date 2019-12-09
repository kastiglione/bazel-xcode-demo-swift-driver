load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:macos.bzl", "macos_unit_test")

swift_library(
    name = "SwiftDriverTests.library",
    module_name = "SwiftDriverTests",
    srcs = glob(["**/*.swift"]),
    deps = ["//Sources/SwiftDriver"],
    linkopts = ["-lncurses", "-lsqlite3"],
)

macos_unit_test(
    name = "SwiftDriverTests",
    minimum_os_version = "10.13",
    deps = [":SwiftDriverTests.library"],
    visibility = ["//visibility:public"],
)
