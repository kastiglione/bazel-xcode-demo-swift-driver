workspace(name = "swiftdriver")

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "build_bazel_apple_support",
    sha256 = "595a6652d8d65380a3d764826bf1a856a8cc52371bbd961dfcd942fdb14bc133",
    strip_prefix = "apple_support-e16463ef91ed77622c17441f9569bda139d45b18",
    url = "https://github.com/bazelbuild/apple_support/archive/e16463ef91ed77622c17441f9569bda139d45b18.tar.gz",
)

http_archive(
    name = "build_bazel_rules_apple",
    sha256 = "27fbac0b4defa0d21f510a4a8c9d98d9b2bc2af25cc9bf33b445ed11bb6b47dd",
    strip_prefix = "rules_apple-1445924a158a89ad634f562c84a600a3435ef8c2",
    url = "https://github.com/bazelbuild/rules_apple/archive/1445924a158a89ad634f562c84a600a3435ef8c2.tar.gz",
)

http_archive(
    name = "build_bazel_rules_swift",
    sha256 = "e58fcddf0c05f3b66ebac0156c3ff502acca33f3036e5463d6871fd9bece69dc",
    strip_prefix = "rules_swift-112a239e2ec92a503d4edc3f52f02d6a0f7a0514",
    url = "https://github.com/bazelbuild/rules_swift/archive/112a239e2ec92a503d4edc3f52f02d6a0f7a0514.tar.gz",
)

load("@build_bazel_apple_support//lib:repositories.bzl", "apple_support_dependencies")
apple_support_dependencies()

load("@build_bazel_rules_apple//apple:repositories.bzl", "apple_rules_dependencies")
apple_rules_dependencies()

load("@build_bazel_rules_swift//swift:repositories.bzl", "swift_rules_dependencies")
swift_rules_dependencies()

load("@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps")
protobuf_deps()

http_archive(
    name = "swift_tools_support_core",
    sha256 = "180697d986c33bec9c818ce6e2c7ce787ca0b0ab12d4a971debfbe5b9c5b101f",
    strip_prefix = "swift-tools-support-core-54a0b6022c734c0ec1555e7134605467332ef5d4",
    url = "https://github.com/apple/swift-tools-support-core/archive/54a0b6022c734c0ec1555e7134605467332ef5d4.tar.gz",
    build_file = "//:bazel/swift-tools-support-core.BUILD",
)

http_archive(
    name = "llbuild",
    sha256 = "206918c77ab8417d1fc27a1a12b4ea680562e43e0a133196737eb9bb87191ce3",
    strip_prefix = "swift-llbuild-d45841450f82fca106d6376bc95da031dfb67db1",
    url = "https://github.com/apple/swift-llbuild/archive/d45841450f82fca106d6376bc95da031dfb67db1.tar.gz",
    build_file = "//:bazel/llbuild.BUILD",
)

http_archive(
    name = "yams",
    sha256 = "4befe68b454e1d736494442e68e7fd4983727c90ca23461fda213fa0f66bc77f",
    strip_prefix = "Yams-e7c188434f9325ec2f195c69f3d1c0de698594f0",
    url = "https://github.com/jpsim/Yams/archive/e7c188434f9325ec2f195c69f3d1c0de698594f0.tar.gz",
    build_file = "//:bazel/yams.BUILD",
)
