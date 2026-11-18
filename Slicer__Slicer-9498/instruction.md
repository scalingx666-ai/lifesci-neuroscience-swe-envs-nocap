# Issue

**Title:** BUG: Fix Extensions Manager failing to install extensions with Qt 6

## Description

With Qt 6, the Extensions Manager cannot install any extension. Installs fail with:

```
Extension metadata response missed required 'extensionname' field
Download of extension failed, could not find an extension with id = ...
```

This affects the macOS arm64 preview build, which is currently the only Qt 6 package. Reported here: https://discourse.slicer.org/t/slicermorph-not-on-arm64-catalogue/48578

The cause is in qRestAPI. In Qt 6, `QVariant::canConvert<QVariantList>()` returns `true` for a `QString`, so `qRestAPI::qVariantMapFlattened()` dropped every string value from the server response. This was fixed upstream in commontk/qRestAPI#31, and this PR updates the qRestAPI commit Slicer builds against to include that fix.

```
$ git shortlog 5c4a76e..f933aad
Sam Horvath (1):
      BUG: Fix variant flattening dropping string values with Qt 6
```

Testing in commontk/qRestAPI#31:
- On Qt 6, without the fix, `qRestAPITest` fails 6 of 8 checks. This was reproduced on Windows with Qt 6.10.3 and on the macOS arm64 preview build machine with Qt 6.11.1.
- With the fix, `qRestAPITest` and `qGirderAPITest` pass on Qt 5.15.2, Qt 6.10.3 and Qt 6.11.1.

Slicer itself has not been built with this change yet.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8064fe663806`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.