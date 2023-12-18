"""Defines non bzlmod enabled dependencies for the project."""

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

SWIFT_ARGUMENT_PARSER_VERSION = "1.3.0"

def _non_module_deps_impl(_):
    http_archive(
        name = "swift_argument_parser",
        urls = [
            "https://github.com/apple/swift-argument-parser/archive/refs/tags/%s.zip" % SWIFT_ARGUMENT_PARSER_VERSION,
        ],
        sha256 = "936b05940edb71658b0995ff14a6bc5c6352ec858f00c0ca76555e06e7780797",
        strip_prefix = "swift-argument-parser-%s" % SWIFT_ARGUMENT_PARSER_VERSION,
        build_file_content = """
load("@rules_swift//swift:swift.bzl", "swift_library")

swift_library(
    name = "ArgumentParser",
    module_name = "ArgumentParser",
    srcs = glob(["Sources/ArgumentParser/**/*.swift"]),
    deps = [":ArgumentParserToolInfo"],
    visibility = ["//visibility:public"],
)

swift_library(
    name = "ArgumentParserToolInfo",
    module_name = "ArgumentParserToolInfo",
    srcs = glob(["Sources/ArgumentParserToolInfo/**/*.swift"]),
)
        """,
    )

non_module_deps = module_extension(implementation = _non_module_deps_impl)
