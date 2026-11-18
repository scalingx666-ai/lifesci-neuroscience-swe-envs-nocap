# Issue

**Title:** Run ASan+UBSan and TSan on pushes and pull requests

## Description

Runs sanitizers in CI on pushes to `main`/`dev` and on every PR. Until now `sanitize.yml` was `workflow_dispatch`-only and had never been run.

### Jobs
| Job | Sanitizers | Catches |
|---|---|---|
| `address,undefined` | ASan + LeakSanitizer + UBSan, `detect_stack_use_after_return=1` | #312 (leak), #314 (stack-use-after-return), UB |
| `thread` | TSan | data races, lock-order inversions |

Both jobs are **non-blocking** (`continue-on-error: true`) for now. A failing job still shows a red ✗ on the PR, but it isn't a required check, so merging isn't blocked. Once #313, #316 and #315 are merged and `dev` is green, remove `continue-on-error` and mark both jobs as required checks.

`workflow_dispatch` still works and runs just the chosen sanitizer (`address,undefined` added as an option).

### Changes besides the triggers
- **Toolchain:** Ubuntu 24.04's own `clang-18` instead of the jammy `apt.llvm.org` repo (`ubuntu-latest` is now noble).
- **`vm.mmap_rnd_bits=28`:** newer runner kernels randomize mmap more than the sanitizer runtimes' fixed shadow layouts allow, which can make them fail at startup.
- **No `gdb` wrapper:** LeakSanitizer refuses to run under ptrace, and the sanitizers print their own stack traces. Benchmarks are skipped (`--skip-benchmarks`).
- **Build only the test binaries:** the old `sed '/lslver/d' CMakeLists.txt` workaround stopped working when `lslver` moved to `cmake/TargetOther.cmake`, so the UBSan build failed to link it.
- **`-fno-sanitize=function`** for the UBSan job: the public headers declare opaque handle types, while the library defines the same C API functions with internal pointer types (`src/api_types.hpp`). That's ABI-identical and intentional, but this check (part of `undefined` since clang 17) flags every call through a function pointer, e.g. `lsl_cpp.h`'s `shared_ptr` deleters.
- **Test UB fixed:** the `datatransfer` and `sync_outlet_datatypes` tests shifted negative values left and negated the type's minimum, both UB before C++20. They now use small helpers in `testing/common/lsltypes.hpp` that do the arithmetic in `uint64_t`; the values are unchanged.
- **`testing/tsan.supp`:** suppresses the lock-order inversion in `inlet_connection::try_recover`. Both orders happen only inside `try_recover`, which `recovery_mut_` serializes, so it can't deadlock.
- **Timeout:** the test step's timeout goes from 15 to 30 min (TSan is slow).
- **Dead config removed:** `LSL_COMFY_DEFAULTS`, `LSL_BUILD_EXAMPLES`, `LSL_BUNDLED_PUGIXML` and `LSL_SLIMARCHIVE` don't exist (CMake listed them as unused), and `libpugixml-dev` was never used because `LSL_FETCH_PUGIXML` defaults to ON. `LSL_BENCHMARKS` stays at its OFF default rather than building benchmark sources that `--skip-benchmarks` skips anyway. (The same dead options also appear in `cppcmake.yml`, `apple.yml`, `apple-release.yml` and `raspberry_pi_manual.yml`; not changed here.)

### Results on this PR (based on `dev`)
- `thread`: **passes**. Both suites run clean with the suppression; the job takes ~3 min.
- `address,undefined`: both suites pass with no ASan or UBSan errors, then **LeakSanitizer fails the job on the #312 outlet leak** (allocations from `stream_outlet_impl`'s constructor, `stream_outlet_impl.cpp:18` and `:25`). The job takes ~4 min. That's the expected failure until #313/#316 are merged. #314 didn't trigger in this x86 run (it fails 10/10 on Linux aarch64); `detect_stack_use_after_return=1` is on, so it can still show up.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42118f80ff92`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.