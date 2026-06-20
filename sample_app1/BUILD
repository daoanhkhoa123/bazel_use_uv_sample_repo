load("@aspect_rules_py//py:defs.bzl", "py_binary", "py_image_layer")

py_binary(
    name = "sample_app1_bin",
    srcs = ["__main__.py"],
    main = "__main__.py",
    python_version = "3.10",
    visibility = ["//:__subpackages__"],
    deps = ["@pypi//requests"],
)

py_image_layer(
    name = "app_layers",
    binary = ":sample_app1_bin",
)

load("@bazel_lib//lib:transitions.bzl", "platform_transition_filegroup")
platform_transition_filegroup(
    name = "x86_64_layers",
    srcs = [":app_layers"],
    target_platform = "//:x84_64_linux",
)