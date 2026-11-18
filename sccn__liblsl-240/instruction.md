# Issue

**Title:** For the case of the 1 second sleep, the test will fail before the sleep.

## Description

I noticed my MacOS test runner failed because the number of resolved streams were less than expected (2 instead of 3) see action output: https://github.com/NexusDynamic/liblsl/actions/runs/19069877370/job/54469644449#step:11:605

```text
-------------------------------------------------------------------------------
resolve multiple streams
-------------------------------------------------------------------------------
/Users/runner/work/liblsl/liblsl/testing/ext/discovery.cpp:9
...............................................................................

/Users/runner/work/liblsl/liblsl/testing/ext/discovery.cpp:20: FAILED:
  REQUIRE( resolver.results().size() == n )
with expansion:
  2 == 3

0.000 s: resolve multiple streams
0.000 s: multithreaded lsl_last_error
```

I checked the test to see why it was failing, and I saw that it checks the result, then sleeps to allow time for stream discovery then checks again, but if it fails the first check then the test will fail.

This fix just removes the first check and always waits.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `22cae131c1a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.