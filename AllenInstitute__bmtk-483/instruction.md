# Issue

**Title:** DPointNet: streamline CPU tests and pull-request CI

## Description

## Summary

Reduce pull-request test latency without dropping supported compatibility or numerical regression coverage.

- Keep all four existing Python jobs (3.8, 3.9, 3.10 and 3.11), with their existing required-check names.
- Run the complete DPointNet CPU suite with four pytest-xdist work-stealing workers **inside each runner**; bound TensorFlow/BLAS threads to one per worker. Standard public-repository Ubuntu runners provide four vCPUs and 16 GB RAM.
- Keep other simulator, builder and utility tests serial to avoid shared-file/simulator-global-state hazards.
- Retain coverage on every PR: collect it on Python 3.11, append across both test phases and upload the combined XML, instead of redundantly instrumenting all four jobs and generating unused HTML reports.
- Cache pip downloads, resolve dependencies in one installation, cancel superseded PR runs and trigger validation for test/dependency-only changes.
- Group silent/binary/count firing-rate oracles into one trace per units/length/dtype combination, preserving the exact separate scalar losses, seeded inputs and value/VJP assertions.
- Make the FP32 checkpoint-runner fixture independent of the ambient Keras precision policy, and exercise it under both FP32 and mixed policies. Parallel scheduling exposed this test-order dependency on actual Keras 2.
- Document the fast CPU command and preserve the separate native-GPU qualification requirement. No production source, native operator, dynamics or scientific defaults change. Supported deprecated aliases retain their tests.

## Measurements and scope

The previous upstream workflow run [39326431820](https://github.com/AllenInstitute/bmtk/actions/runs/39326431820) spent roughly 9–15 minutes in each already-parallel Python job's test step. Removing Python versions would save compute, not divide wall time.

Local CPU measurements:

| Run | Passed | Skipped | Test time |
|---|---:|---:|---:|
| Unchanged complete DPointNet suite, serial | 1,943 | 1,479 | 689.24 s |
| Identical unchanged suite, four workers | 1,943 | 1,479 | 223.93 s |
| Final complete Python 3.13 / TF 2.21 / Keras 3 suite, four workers **with coverage** | 1,920 | 1,479 | 310.12 s |
| Final complete Python 3.8 / TF 2.13 / Keras 2 suite, four workers | 1,920 | 1,479 | 279.34 s |
| Other tests, serial with coverage | 371 | 59 | 46.39 s |

The unchanged comparison has exactly the same 3,422 test/skip outcomes and is **3.08× faster locally**. The final 3,399 collected DPointNet cases preserve every original numerical case after expanding the grouped activity checks, plus one additional mixed-policy regression: 24 redundant trace setups were consolidated, not 24 numerical scenarios removed. All skip identities are preserved. The combined coverage XML retains every line hit by the serial test phase.

**Five-minute GitHub end-to-end latency is not established.** Coverage remains enabled on every PR by request; approximately 6–7 minutes including setup/other tests is an estimate, not a measured GitHub result. This PR's Actions run is the first hosted-runner validation of timing, memory and all four Python jobs. Local Keras 3 qualification used Python 3.13/TF 2.21, not the hosted Python 3.11 stack.

## Validation

- [x] Complete final CUDA-disabled Keras 3 and actual Keras 2 suites, as above.
- [x] Exact unchanged serial/parallel case-and-skip multiset equality; final numerical-case preservation plus the added policy case.
- [x] Serial non-DPointNet tests and appended coverage preservation.
- [x] Compile changed test files; Python 3.8 syntax compatibility; `git diff --check`.
- [x] Actionlint 1.7.12.
- [x] Rendered Sphinx docs with notebook execution disabled; the same 13 warnings as an exact-base build, no new diagnostics.
- [ ] Hosted CI execution/timing and peak-memory confirmation.

Native-GPU qualification was not rerun: production code/operators are unchanged, and CPU-native skips are not claimed as GPU execution evidence. Local non-DPointNet skips likewise do not qualify compiled NEURON mechanisms or NEST.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `42bee90e4657`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.