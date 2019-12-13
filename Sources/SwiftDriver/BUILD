load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "SwiftDriver",
    module_name = "SwiftDriver",
    srcs = glob(["**/*.swift"]),
    deps = [
        "@llbuild//:llbuildSwift",
        "@swift_tools_support_core//:TSCBasic",
        "@swift_tools_support_core//:TSCUtility",
        "@yams//:Yams",
    ],
    visibility = ["//visibility:public"],
)
