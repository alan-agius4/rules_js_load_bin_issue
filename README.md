```
cd consumer
bazel build //...
```

```

ERROR: /usr/local/google/home/alanagius/xxxx/bazel-bin-repro/consumer/BUILD.bazel:3:9: in directory_path rule //:test__entry_point: 
Traceback (most recent call last):
        File "/usr/local/google/home/alanagius/.cache/bazel/_bazel_alanagius/50bad0a456fc94f8061cead6eeedabc7/external/bazel_lib+/lib/private/directory_path.bzl", line 18, column 13, in _directory_path
                fail(msg)
Error in fail: Expected directory to be a TreeArtifact (ctx.actions.declare_directory) but <source file .aspect_rules_js/node_modules/@web+test-runner@0.20.2/dir> is either a source file or does not exist.
ERROR: /usr/local/google/home/alanagius/xxxx/bazel-bin-repro/consumer/BUILD.bazel:3:9: Analysis of target '//:test__entry_point' (config: 91e2498) failed
ERROR: Analysis of target '//:test' failed; build aborted: Analysis failed
INFO: Elapsed time: 1.246s, Critical Path: 0.01s
INFO: 1 process: 1 internal.
ERROR: Build did NOT complete successfully
FAILED: 
    Fetching repository @@rules_nodejs++node+nodejs_linux_amd64; starting
```

In `consumer/MODULE.bazel`, if you change:
```
bazel_dep(name = "aspect_rules_js", version = "3.0.2")
```

to:
```
bazel_dep(name = "aspect_rules_js", version = "2.8.2")
```
It works.

```
bazel build //... 
INFO: Analyzed target //:test (465 packages loaded, 7121 targets configured).
INFO: Found 1 target...
Target //:test up-to-date:
  bazel-bin/test_/test
INFO: Elapsed time: 1.915s, Critical Path: 0.04s
INFO: 1 process: 875 action cache hit, 1 internal.
INFO: Build completed successfully, 1 total action
```