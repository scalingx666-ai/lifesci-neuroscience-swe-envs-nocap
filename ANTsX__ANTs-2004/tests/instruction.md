# Issue

**Title:** BUG: Make ANTSConfig.cmake usable from the build tree

## Description

`ANTSConfig.cmake` was only usable from an install tree; pointing `ANTS_DIR` at an ANTs **build** tree made `find_package(ANTS)` fail in `set_and_check(ANTS_INCLUDE_DIR ...)`. Generate the config template twice — once for each tree — so both are consumable.

<details>
<summary>Root cause</summary>

One config was generated with `INSTALL_DESTINATION lib/cmake/ANTS`, then both left in the build tree *and* installed. `@PACKAGE_INIT@` derives `PACKAGE_PREFIX_DIR` by walking up as many levels as the install destination is deep (`../../../`). That is correct from `<prefix>/lib/cmake/ANTS/`, but from `<ants-build>/` it walks three levels above the build directory, so:

```
ANTS_INCLUDE_DIR = <somewhere-above-the-build-dir>/include/ANTs   # does not exist
CMake Error: File or directory ... referenced by variable ANTS_INCLUDE_DIR does not exist !
```

</details>

<details>
<summary>The change</summary>

- `ANTS.cmake`: call `configure_package_config_file` twice — a build-tree config (left in the build dir) and a relocatable install-tree config (staged under `CMakeFiles/install/`, and that copy is the one installed).
- `CMake/ANTSConfig.cmake.in`: branch on which tree it was generated for. The build-tree config roots includes at the **source** dir and adds the binary dir for the generated `ANTsVersionConfig.h`; the install-tree config keeps the existing `PACKAGE_PREFIX_DIR`-relative form.

`install(DIRECTORY <source>/<subdir>/ DESTINATION include/ANTs/<subdir>)` preserves the per-subdir layout, so the existing `ANTS_PUBLIC_HEADER_DIRS` loop appends `<root>/<subdir>` correctly for both trees and needed no duplication. `export(EXPORT ANTSTargets ...)` already emitted build-tree targets.

Both branches use `set_and_check`, so a bad include root still fails loudly rather than silently propagating.

</details>

<details>
<summary>Test plan</summary>

A consumer project calling `find_package(ANTS REQUIRED)` that asserts every `ANTS_INCLUDE_DIRS` entry exists on disk and that the imported target resolves, configured against each tree:

| `ANTS_DIR` | `ANTS_INCLUDE_DIRS` | `ANTS::antsUtilities` | exit |
|---|---|---|---|
| build tree | 9 entries, all exist | OK | 0 |
| install tree (full `cmake --install`) | 8 entries, all exist | OK | 0 |

The build tree has one extra entry: the binary dir holding the generated `ANTsVersionConfig.h`.

Downstream: BRAINSTools consumes ANTs via `ANTS_DIR=<ants-build>` and previously failed at its configure step; it now configures and builds.

CMake-config-only change; no new tests. The reconfigure is the test.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3f95bdceff84`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.