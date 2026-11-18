# Issue

**Title:** Fix Python lib name

## Description

This popped up while doing some testing in a Fedora 42 container.

Basically, when coming up with the name of the Python libraries (like `hoc.blabla.so`), we use `CMAKE_LIBRARY_ARCHITECTURE`. Now, on Fedora with clang, `CMAKE_LIBRARY_ARCHITECTURE` is set to `x86_64-redhat-linux-gnu`, but Python does not recognize this extension when importing:

```plaintext
$ python -c 'import importlib.machinery;print(importlib.machinery.EXTENSION_SUFFIXES)'
['.cpython-313-x86_64-linux-gnu.so', '.abi3.so', '.so']
```

The solution is to not rely on `CMAKE_LIBRARY_ARCHITECTURE` and just always set the extension to `${ARCH}-linux-gnu`, which should be importable in Python on all "reasonable" Linux platforms.

### Q: Why does this pass in the CI (see for instance [here](https://github.com/neuronsimulator/nrn-build-ci/actions/runs/19916529556/job/57096320999))?

Because the CI uses GCC, which "correctly" (or at least consistently with what Python expects) sets `CMAKE_LIBRARY_ARCHITECTURE` to `x86_64-linux-gnu`. This behavior is specific to clang. I don't know if Fedora/RHEL maintainers override the [target triplet](https://wiki.osdev.org/Target_Triplet) when shipping clang, but in any case, we can work around it with this PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `191e42681aec`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.