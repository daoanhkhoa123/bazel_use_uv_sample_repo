"""Targets in the repository root"""

load("@gazelle//:def.bzl", "gazelle")

# load("@pip//:requirements.bzl", "all_whl_requirements")
# load("@rules_python_gazelle_plugin//manifest:defs.bzl", "gazelle_python_manifest")
# load("@rules_python_gazelle_plugin//modules_mapping:def.bzl", "modules_mapping")

exports_files(
    [
        ".clang-tidy",
        ".shellcheckrc",
    ],
    visibility = ["//:__subpackages__"],
)

# We prefer BUILD instead of BUILD.bazel
# gazelle:build_file_name BUILD
# gazelle:exclude githooks/*
# Workaround https://github.com/bazel-contrib/bazel-gazelle/issues/2001
# gazelle:map_kind proto_library proto_library @protobuf//bazel:proto_library.bzl

# --- Gazelle Directives ---

# 1. Prefer BUILD instead of BUILD.bazel
# gazelle:build_file_name BUILD

# 2. Instruct Gazelle to generate aspect_rules_py targets instead of rules_python
# gazelle:map_kind py_binary py_binary @aspect_rules_py//py:defs.bzl
# gazelle:map_kind py_library py_library @aspect_rules_py//py:defs.bzl
# gazelle:map_kind py_test py_test @aspect_rules_py//py:defs.bzl

# 3. Explicitly tell Gazelle how to resolve third-party imports
# (Add any additional PyPI imports your apps use below this line)
# gazelle:resolve py requests @pypi//requests

# 4. Prevent Gazelle from walking into local virtual environments
# gazelle:exclude **/*.venv

gazelle(
    name = "gazelle",
    env = {
        "ENABLE_LANGUAGES": ",".join([
            "starlark",
            "proto",
            "python",
            "cc",
        ]),
    },
    gazelle = "@multitool//tools/gazelle",
)

exports_files(
    ["pyproject.toml"],
    visibility = ["//:__subpackages__"],
)

# Produce aspect_rules_py targets rather than rules_python
# gazelle:map_kind py_binary py_binary @aspect_rules_py//py:defs.bzl
# gazelle:map_kind py_library py_library @aspect_rules_py//py:defs.bzl
# gazelle:map_kind py_test py_test //tools/pytest:defs.bzl
#
# Don't walk into virtualenvs when looking for python sources.
# We don't intend to plant BUILD files there.
# gazelle:exclude **/*.venv
#
# Fetches metadata for python packages we depend on.
# modules_mapping(
#     name = "modules_map",
#     wheels = all_whl_requirements,
# )

# Provide a mapping from an import to the installed package that provides it.
# Needed to generate BUILD files for .py files.
# This macro produces two targets:
# - //:gazelle_python_manifest.update can be used with `bazel run`
#   to recalculate the manifest
# - //:gazelle_python_manifest.test is a test target ensuring that
#   the manifest doesn't need to be updated
# gazelle_python_manifest(
#     name = "gazelle_python_manifest",
#     # modules_mapping = ":modules_map",
#     # pip_repository_name = "pip",
# )

# Uv fixes

# Generate a manifest shell mapping file for Gazelle
# gazelle_python_manifest(
#     name = "gazelle_python_manifest",
#     modules_mapping = ":dummy_modules_map",  # Points to the target defined below
#     pip_repository_name = "pypi",
# )

# A static mock map to satisfy the gazelle_python_manifest constraint
# when not using traditional rules_python whl targets
# filegroup(
#     name = "dummy_modules_map",
#     srcs = [],
#     visibility = ["//visibility:public"],
# )

# Incompatitable platform fix
platform(
    name = "x86_64_linux",
    constraint_values = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    flags = [
        "--@aspect_rules_py//uv/private/consraints/platform:platform_libc=glibc",
        "--@aspect_rules_py//uv/private/contraints/platform:platform_version=2.39",
    ]
)