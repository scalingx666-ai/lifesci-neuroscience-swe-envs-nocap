# Issue

**Title:** inlet: allocate only filled string slots; add lsl_destroy_string_array

## Description

A one-channel marker stream pulled into a 1024-element buffer currently allocates 1024 strings even when only a few values—or none—arrive:

```cpp
std::vector<std::string> tmp(data_buffer_elements);
uint32_t result = in->pull_chunk_multiplexed(tmp.data(), ...);
for (std::size_t k = 0; k < tmp.size(); k++) {
    data_buffer[k] = (char *)malloc(tmp[k].size() + 1);
    // ...
}
```

Both `lsl_pull_chunk_str` and `lsl_pull_chunk_buf` now allocate only the first `result` channel elements. Remaining pointers are set to NULL, and remaining `_buf` lengths are set to zero. Both declarations document the ownership contract. Existing partial-allocation failure cleanup is preserved. The sample variants already allocate only the received channel count and are unchanged.

Add `lsl_destroy_string_array(char **strings, unsigned long count)` beside `lsl_destroy_string`, using the existing `LIBLSL_C_API` export mechanism. It frees each non-NULL entry in one API call; zero count is a no-op. This is additive, with no ABI version bump.

Older liblsl allocated every slot. Language bindings should continue tolerating both behaviours by freeing all slots while skipping NULL pointers. pylsl already does this and then clears its pointer table; it will adopt `lsl_destroy_string_array` when present.

Validation:

- Configured with `cmake -S . -B build -DLSL_UNITTESTS=ON -DLSL_FRAMEWORK=OFF -DCMAKE_CXX_FLAGS='-Wall -Wextra' -DCMAKE_C_FLAGS='-Wall -Wextra'`, then built with `cmake --build build -j 8`.
- `ctest --test-dir build/testing --output-on-failure`: all three binaries pass, including `lsl_test_exported` (24 cases, 7921 assertions), `lsl_test_internal` (including its expected-failure test), and `lsl_test_runtime_config`.
- Four new Catch2 cases cover oversized string/binary chunk buffers, single- and multi-channel data, empty strings, embedded NULs with exact lengths, zero-timeout empty pulls that clear non-NULL sentinels, and bulk freeing populated, zero-count, and all-NULL arrays.
- No new warnings; existing warnings remain in portable archive declarations, the unused outlet `chunk_size` parameter, and third-party loguru formatting.
- `nm -gU build/liblsl*.dylib` confirms `_lsl_destroy_string_array` is exported.
- Ran clang-format on changed C/C++ ranges and the new test file; `git diff --check` passes.
- ASan builds succeeded with both Apple Clang 17 and Homebrew LLVM 21. Execution could not be verified locally: both runtimes deadlock before `main` on macOS 26.6.2, with sampled stacks showing recursive ASan initialization through malloc/dyld and `StaticSpinMutex::LockSlow`. Stopped those processes; Valgrind is not installed. The repository has a manually dispatched Linux sanitizer workflow for follow-up validation. LLVM 21 also reports an existing uninitialized `val` warning in `testing/ext/time.cpp`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `64988c6a14b8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.