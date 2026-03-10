load("@npm_rules_browsers//:@web/test-runner/package_json.bzl", wtr = "bin")

def wtr_test(name, **kwargs):
   wtr.wtr_test(
        name = name,
        **kwargs,
    )