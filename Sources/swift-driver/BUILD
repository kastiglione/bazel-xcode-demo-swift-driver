load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")
load("@build_bazel_rules_apple//apple:macos.bzl", "macos_command_line_application")

swift_library(
    name = "swift-driver.library",
    module_name = "swift_driver",
    srcs = glob(["**/*.swift"]),
    deps = ["//Sources/SwiftDriver:SwiftDriver"],
    linkopts = ["-lncurses", "-lsqlite3"],
)

macos_command_line_application(
    name = "swift-driver",
    minimum_os_version = "10.13",
    deps = [":swift-driver.library"],
    visibility = ["//visibility:public"],
)
