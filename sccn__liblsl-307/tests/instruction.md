# Issue

**Title:** Make sample recycling synchronization visible to ThreadSanitizer

## Description

ThreadSanitizer reports a timestamp race when a sample is recycled after another thread releases its reference. The existing release decrement followed by an acquire fence is valid C++ synchronization, but TSan does not model the fence. Replace that pair with an acquire-release decrement so the final owner acquires earlier owners’ releases before publishing the sample for reuse.

. This addresses a sanitizer false positive; the investigation did not demonstrate premature sample reuse or corrupted timestamps. LLVM tracks the fence limitation in .

## Changes

- Use `memory_order_acq_rel` in `intrusive_ptr_release()` instead of a release decrement plus conditional acquire fence. No suppressions or sanitizer-specific annotations are added. This acquires on every decrement, rather than only on final release; performance has not been benchmarked.
- Add an isolated recycling regression: a reader releases one reference, the last owner releases and reuses the same sample, and only then joins the reader. The scheduling flag deliberately uses relaxed ordering so it cannot hide the reference-count synchronization being tested.
- Fix an existing concurrent send-buffer stress test that called `factory::new_sample()` concurrently despite its single-allocator contract. Serialize only allocation; buffer pushes remain concurrent. This is a separate test-only commit.

## Validation

Native macOS arm64, Xcode 27 / Apple Clang 21, Debug, with TSan instrumentation and no suppressions:

| Test | Before | After |
| --- | --- | --- |
| Isolated recycling test, 10 process runs | 10/10 runs warned | 0/10 runs warned |
| Disconnect-during-push regression, 100 process runs, both transport modes | 14/100 runs warned | 0/100 runs warned |

All functional assertions passed in both comparisons. Before-fix warning runs exited unsuccessfully under TSan; after-fix runs passed without warnings.

- Focused `[outlet],[open],[reopen],[sync]` suite: **1,741 assertions across 20 cases**, passed normally and under TSan.
- Full internal suite: **1,069 assertions across 32 cases**, passed normally; after correcting the existing stress-test allocator misuse, also passed under TSan without warnings.
- Final `[send_buffer],[sample]` tests: passed normally and in **10/10 additional TSan runs**.
- An initial broad TSan run hit a socket-test `Address already in use` failure. A retry exposed the existing concurrent-allocation misuse corrected here; the final full internal run passed.
- `git diff --check` passed.

Windows/Linux validation remains for CI.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `edeab60d677f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.