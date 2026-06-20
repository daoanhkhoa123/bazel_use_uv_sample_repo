"Define linter aspects"

load("@aspect_rules_lint//lint:clang_tidy.bzl", "lint_clang_tidy_aspect")
load("@aspect_rules_lint//lint:lint_test.bzl", "lint_test")
load("@aspect_rules_lint//lint:ruff.bzl", "lint_ruff_aspect")
load("@aspect_rules_lint//lint:shellcheck.bzl", "lint_shellcheck_aspect")
load("@aspect_rules_lint//lint:ty.bzl", "lint_ty_aspect")

clang_tidy = lint_clang_tidy_aspect(
    binary = Label("//tools/lint:clang_tidy"),
    configs = [Label("//:.clang-tidy")],
    lint_target_headers = True,
    angle_includes_are_system = False,
    verbose = False,
)
ruff = lint_ruff_aspect(
    binary = "@multitool//tools/ruff",
    configs = [
        Label("//:pyproject.toml"),
        # if the repository has nested ruff.toml files, they must be added here as well
    ],
)

ruff_test = lint_test(aspect = ruff)

ty = lint_ty_aspect(
    binary = Label("@aspect_rules_lint//lint:ty_bin"),
    config = Label("@//:pyproject.toml"),
)

shellcheck = lint_shellcheck_aspect(
    binary = "@multitool//tools/shellcheck",
    config = Label("//:.shellcheckrc"),
)

shellcheck_test = lint_test(aspect = shellcheck)
