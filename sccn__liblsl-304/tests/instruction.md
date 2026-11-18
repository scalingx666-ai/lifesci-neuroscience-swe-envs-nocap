# Issue

**Title:** Fix transitive dependencies for static LSL::lsl

## Description

## Description

Previously, the required system and third-party dependencies were linked only to the `lslobj` object library. The `lsl` target linked `lslobj` through the build interface:

```cmake
target_link_libraries(lsl PRIVATE $<BUILD_INTERFACE:lslobj>)
```

Because `lslobj` is not part of the installed export set, its dependencies were not included in the generated `LSLConfig*.cmake` files. Shared-library builds were unaffected, but consumers of a static `liblsl` had to link those dependencies manually.

For example, consumers currently need to provide pugixml(LSL_FETCH_PUGIXML=OFF) and platform libraries themselves:

```cmake
find_package(LSL CONFIG REQUIRED)
find_package(pugixml CONFIG REQUIRED)

add_executable(EegDataSourceLSLRelay EegDataSourceLSLRelay.cpp)

target_link_libraries(EegDataSourceLSLRelay PRIVATE
    LSL::lsl
    pugixml::pugixml
    winmm
    iphlpapi
)
```

Ideally, consumers should only need to link `LSL::lsl`:

```cmake
find_package(LSL CONFIG REQUIRED)

add_executable(EegDataSourceLSLRelay EegDataSourceLSLRelay.cpp)
target_link_libraries(EegDataSourceLSLRelay PRIVATE LSL::lsl)
```

## Solution

For static builds, linking the dependencies directly to lsl, rather than only indirectly through lslobj, is important. CMake records the PRIVATE link dependencies of a static library as $<LINK_ONLY:...> entries in its exported INTERFACE_LINK_LIBRARIES. This allows consumers of the installed LSL::lsl target to receive the dependencies transitively without having to link them manually.

This is also why some properties are configured on both lslobj and lsl, for example:

```cmake
# TargetObjLib.cmake
target_include_directories(lslobj
    PUBLIC
        $<INSTALL_INTERFACE:include>
)
```

```cmake
# TargetLib.cmake
target_include_directories(lsl
    PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
        $<INSTALL_INTERFACE:${LSL_INSTALL_INTERFACE_INCLUDE_DIR}>
)
```

The same approach is required for the library dependencies.

The PR:

1. Defines `lsllinklibs` in `Dependencies.cmake` to collect the system and third-party libraries required by `lslobj` and `lsl`.
2. Links those dependencies to both `lslobj` and `lsl`.
3. Updates `Installation.cmake` and the package configuration template to add the required `find_dependency()` calls to the generated `LSLConfig.cmake`.

## pugixml Target Handling

Before pugixml 1.11, its CMake target was named `pugixml`; newer versions use `pugixml::pugixml`. When `LSL_FETCH_PUGIXML` is enabled, the fetched version is recent enough to use `pugixml::pugixml` directly, so the compatibility alias for the fetched target is unnecessary.

When `LSL_FETCH_PUGIXML=OFF`, the alias is retained because `testing/CMakeLists.txt` still links against `pugixml::pugixml`. It is created after the actual pugixml target name has been added to `lsllinklibs`.

## Why Boost Is Excluded

Boost is a header-only, private compile-time dependency of `lslobj`, provided through the `lslboost` interface target. No Boost binaries are linked, and no Boost types appear in liblsl’s public headers. Since `lslobj` is linked into `lsl` only through `$<BUILD_INTERFACE:lslobj>`, Boost is not part of the installed target’s exported interface. Therefore, it does not belong in `lsllinklibs`, and the installed `LSLConfig.cmake` does not need `find_dependency(Boost)`.

An earlier version of this change added `Boost::boost` and `Boost::disable_autolinking` to `lsllinklibs`; those entries and the corresponding `find_dependency(Boost)` call have been removed.

## Testing

Manual testing was performed on Windows 11 and an Ubuntu 24.04 VM. Automated tests were run through GitHub Actions on the [`liblsl-issue-304-amend` branch](https://github.com/SharpLSL/liblsl-ci-build/tree/liblsl-issue-304-amend).

The branch contains three commits, each corresponding to one of the test runs below:

1. Reproduces the issue described in this PR.
2. Tests the patch included in this PR.
3. Tests a separate patch that compiles pugixml’s source directly into `lslobj` when `LSL_FETCH_PUGIXML=ON`.

The third test uses the patch from the [`fix-cmake-deps-v3` branch](https://github.com/SharpLSL/liblsl/tree/fix-cmake-deps-v3); that patch is not included in this PR.

Each test run used the following GitHub Actions matrix, for 24 configurations:

```yaml
matrix:
  os: [ubuntu-latest, macos-latest, windows-latest]
  linkage: [static, shared]
  bundled_boost: [ON, OFF]
  fetch_pugixml: [ON, OFF]
```

`linkage` maps to `LSL_BUILD_STATIC`; `bundled_boost` and `fetch_pugixml` map to `LSL_BUNDLED_BOOST` and `LSL_FETCH_PUGIXML`. Where supported, `LSL_TOOLS` and `LSL_UNITTESTS` were also enabled.

The consumer [test project](https://github.com/SharpLSL/liblsl-ci-build/blob/liblsl-issue-304-amend/CMakeLists.txt) uses `find_package(LSL CONFIG REQUIRED)` and links its executables only to `LSL::lsl`. `GetFullinfo` exercises stream-info APIs that directly depend on pugixml. On Windows, the test also copies the shared LSL library beside `lslver` when testing a shared build.

Shared builds passed in all three test runs. The tables below show the results for static builds.

**1. Reproducing the issue**

All configurations failed because consumers could not resolve required symbols. These were primarily pugixml symbols; on Windows, socket API symbols were also missing.

| Platform | LSL_BUNDLED_BOOST=OFF, LSL_FETCH_PUGIXML=OFF | LSL_BUNDLED_BOOST=OFF, LSL_FETCH_PUGIXML=ON | LSL_BUNDLED_BOOST=ON, LSL_FETCH_PUGIXML=OFF | LSL_BUNDLED_BOOST=ON, LSL_FETCH_PUGIXML=ON |
| --- | :---: | :---: | :---: | :---: |
| macOS | ❌ | ❌ | ❌ | ❌ |
| Ubuntu | ❌ | ❌ | ❌ | ❌ |
| Windows | ❌ | ❌ | ❌ | ❌ |

**2. Testing this PR’s patch**

Configurations using a system-installed pugixml passed. Configurations with `LSL_FETCH_PUGIXML=ON` still failed.

| Platform | LSL_BUNDLED_BOOST=OFF, LSL_FETCH_PUGIXML=OFF | LSL_BUNDLED_BOOST=OFF, LSL_FETCH_PUGIXML=ON | LSL_BUNDLED_BOOST=ON, LSL_FETCH_PUGIXML=OFF | LSL_BUNDLED_BOOST=ON, LSL_FETCH_PUGIXML=ON |
| --- | :---: | :---: | :---: | :---: |
| macOS | ✅ | ❌ | ✅ | ❌ |
| Ubuntu | ✅ | ❌ | ✅ | ❌ |
| Windows | ✅ | ❌ | ✅ | ❌ |

**3. Testing the separate pugixml source-integration patch**

The third commit tests the separate patch from [`fix-cmake-deps-v3`](https://github.com/SharpLSL/liblsl/tree/fix-cmake-deps-v3). It compiles pugixml’s source directly into `lslobj` when `LSL_FETCH_PUGIXML=ON`, rather than linking pugixml through a separate target. All tested static configurations passed.

| Platform | LSL_BUNDLED_BOOST=OFF, LSL_FETCH_PUGIXML=OFF | LSL_BUNDLED_BOOST=OFF, LSL_FETCH_PUGIXML=ON | LSL_BUNDLED_BOOST=ON, LSL_FETCH_PUGIXML=OFF | LSL_BUNDLED_BOOST=ON, LSL_FETCH_PUGIXML=ON |
| --- | :---: | :---: | :---: | :---: |
| macOS | ✅ | ✅ | ✅ | ✅ |
| Ubuntu | ✅ | ✅ | ✅ | ✅ |
| Windows | ✅ | ✅ | ✅ | ✅ |

This source-integration patch is not included in this PR. If the approach is agreed upon, it can be cherry-picked into this PR or submitted separately.

## Open Issues

1. `lsl.pc.in` has not yet been updated to reflect these dependency changes.
2. The separate pugixml source-integration patch needs discussion: should it be added to this PR, or submitted as a follow-up?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42118f80ff92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.