# Issue

**Title:** Avoid double free by returning if consumer is not in send buffer.

## Description

Trying my hand at fixing that frustrating segmentation fault bug on CI (I cannot repro locally)...I came across a double free exception I hadn't seen before in the runner.

```text
stringconversion - int64_t

/home/runner/work/liblsl/liblsl/testing/ext/bench_pushpull.cpp:56 ............................................................................... double free or corruption (out)
```

This PR just returns if the consumer isn't in the queue instead of calling swap. If `consumers_.empty()` then the [return value of `consumers_.back()` is undefined](https://en.cppreference.com/w/cpp/container/vector/back), potentially resulting in a corruption during swap.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11bb51dc0a82`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.