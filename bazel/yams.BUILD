load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library")

cc_library(
    name = "CYaml",
    srcs = glob([
        "Sources/CYaml/src/*.c",
        "Sources/CYaml/src/*.h",
    ]),
    hdrs = glob([
        "Sources/CYaml/include/*.h",
    ]),
    includes = ["Sources/CYaml/include"],
    linkstatic = True,
)

swift_library(
    name = "Yams",
    srcs = glob(["Sources/Yams/*.swift"]),
    copts = ["-DSWIFT_PACKAGE"],
    visibility = ["//visibility:public"],
    deps = [":CYaml"],
)
