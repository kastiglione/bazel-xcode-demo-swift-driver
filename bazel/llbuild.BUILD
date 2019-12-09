load("@build_bazel_rules_swift//swift:swift.bzl", "swift_library", "swift_c_module")

# The llbuild testing tool.
cc_binary(
    name = "llbuild",
    srcs = glob(["products/llbuild/*.cpp"]),
    deps = [":llbuildCommands"],
)

# The custom build tool used by the Swift package manager.
cc_binary(
    name = "swift-build-tool",
    srcs = glob(["products/swift-build-tool/*.cpp"]),
    deps = [":llbuildBuildSystem"],
)

# Bazel specific target. This allows `llbuildSwift` to `import llbuild`.
swift_c_module(
    name = "llbuild_module",
    deps = [":libllbuild"],
    module_map = "products/libllbuild/include/module.modulemap",
)

swift_library(
    name = "llbuildSwift",
    srcs = glob(["products/llbuildSwift/*.swift"]),
    deps = [":llbuild_module"],
    visibility = ["//visibility:public"],
)

# The public llbuild API.
cc_library(
    name = "libllbuild",
    srcs = glob([
        "products/libllbuild/*.cpp",
        "products/libllbuild/*.h"
    ]),
    hdrs = glob(["products/libllbuild/include/**/*.h"]),
    strip_include_prefix = "products/libllbuild/include",
    deps = [
        ":llbuildCore",
        ":llbuildBuildSystem",
    ],
)

# Components

cc_library(
    name = "llbuildBasic",
    srcs = glob([
        "lib/Basic/*.cpp",
        "lib/Basic/*.h",
    ]),
    hdrs = glob(["include/llbuild/Basic/*.h"]),
    strip_include_prefix = "include",
    deps = [":llvmSupport"],
)

cc_library(
    name = "llbuildCore",
    srcs = glob([
        "lib/Core/*.cpp",
        "lib/Core/*.h",
    ]),
    hdrs = glob(["include/llbuild/Core/*.h"]),
    strip_include_prefix = "include",
    deps = [":llbuildBasic"],
    linkopts = ["-lsqlite3"],
)

cc_library(
    name = "llbuildBuildSystem",
    srcs = glob([
        "lib/BuildSystem/*.cpp",
        "lib/BuildSystem/*.h",
    ]),
    hdrs = glob(["include/llbuild/BuildSystem/*.h"]),
    strip_include_prefix = "include",
    deps = [":llbuildCore"],
)

cc_library(
    name = "llbuildNinja",
    srcs = glob([
        "lib/Ninja/*.cpp",
        "lib/Ninja/*.h",
    ]),
    hdrs = glob(["include/llbuild/Ninja/*.h"]),
    strip_include_prefix = "include",
    deps = [":llbuildBasic"],
)

cc_library(
    name = "llbuildCommands",
    srcs = glob([
        "lib/Commands/*.cpp",
        "lib/Commands/*.h",
    ]),
    hdrs = glob(["include/llbuild/Commands/*.h"]),
    strip_include_prefix = "include",
    deps = [
        ":llbuildCore",
        ":llbuildBuildSystem",
        ":llbuildNinja",
    ],
)

# Ingested LLVM code.
cc_library(
    name = "llvmDemangle",
    srcs = glob([
        "lib/llvm/Demangle/*.cpp",
        "lib/llvm/Demangle/*.h",
    ]),
    hdrs = glob(["include/llvm/Demangle/*.h"]),
    strip_include_prefix = "include",
)

cc_library(
    name = "llvmSupport",
    srcs = glob([
        "lib/llvm/Support/*.cpp",
        "lib/llvm/Support/*.h",
        "lib/llvm/Support/Unix/*",
        "lib/llvm/Support/Windows/*",
    ]),
    hdrs = glob([
        "include/llvm/Support/*",
        "include/llvm/ADT/*",
        "include/llvm/Config/*",
        "include/llvm-c/*",
    ]),
    strip_include_prefix = "include",
    deps =[":llvmDemangle"],
    linkopts = ["-lncurses"],
)
