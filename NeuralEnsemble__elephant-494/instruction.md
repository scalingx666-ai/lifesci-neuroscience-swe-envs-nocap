# Issue

**Title:** Fix/add option: do not compile fim c-extension

## Description

This PR adds an extra to elephant, which allows installation of Elephant without compiling the c++ extension `fim.cpp` used in SPADE.

Do not compile any extension:
- development  `pip install -e . --install-option='--no-compile' `
- install `pip install elephant --install-option='--no-compile' `

Do not compile spade extension:
- development  `pip install -e . --install-option='--no-compile-spade' `
- install `pip install elephant --install-option='--no-compile-spade' `

This option allows to have a workaround in cases were there is no suitable c-compiler available on the target system.

Additionally extensions are now optional, according to [setuptools documentation](https://setuptools.pypa.io/en/latest/userguide/ext_modules.html?highlight=extension#building-extension-modules):
```python
 class setuptools.Extension(name, sources, *args, **kw)
```
- optional (bool) – specifies that a build failure in the extension should not abort the build process, but simply not install the failing extension.

See elephant documentation:

https://elephant--494.org.readthedocs.build/en/494/install.html

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `646cbd444367`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.