# Issue

**Title:** Android CI

## Description

This PR adds a CI configuration to build binaries for Android (X86, ARM, ARM64). It's not run by default, but can be started on demand from the Github Actions page (even with configurable CMake parameters).

Running the binaries on the CI system isn't possible, but they can be executed on any smartphone via `adb`:

``` bash
$ adb push . /data/local/tmp; adb shell 'cd /data/local/tmp/bin; chmod +x *; export LD_LIBRARY_PATH=../lib; ./lslver; ./lsl_test_internal; ./lsl_test_exported'
./: 24 files pushed. 18.1 MB/s (9502175 bytes in 0.502s)
LSL version: 115
git:b6cfbeeb8e4a1e40ec74c3a575d2acc7423bfad2/branch:refs/heads/androidci/build:Release/compiler:Clang-9.0.9/link:SHARED
125805.658531
2021-10-11 13:05:45.167 (   0.005s) [        ED0FB470]         api_config.cpp:235   INFO| Loaded default config
2021-10-11 13:05:45.656 (   0.493s) [        ED0FB470]test_int_streaminfo.cpp:53    INFO| The following warning is harmless and expected
2021-10-11 13:05:45.656 (   0.494s) [        ED0FB470]   stream_info_impl.cpp:233   WARN| Query "in'va'lid" error: Incorrect query
2021-10-11 13:05:45.665 (   0.503s) [        ED0FB470]           postproc.cpp:72    INFO| 
P:      0.003637        -0.000000
        -0.000000       0.000000
w:      0.040104        0.010000
===============================================================================
All tests passed (210 assertions in 20 test cases)

2021-10-11 13:05:45.715 (   0.005s) [        ED02B470]         api_config.cpp:235   INFO| Loaded default config
2021-10-11 13:05:45.717 (   0.006s) [        ED02B470]             common.cpp:65    INFO| git:b6cfbeeb8e4a1e40ec74c3a575d2acc7423bfad2/branch:refs/heads/androidci/build:Release/compiler:Clang-9.0.9/link:SHARED
2021-10-11 13:05:49.999 (   4.288s) [        ED02B470]   inlet_connection.cpp:56    WARN| The stream named 'movetest' can't be recovered automatically if its provider crashes because it doesn't have a unique source ID
2021-10-11 13:05:57.351 (  11.640s) [        ED02B470]   inlet_connection.cpp:56    WARN| The stream named 'timesync' can't be recovered automatically if its provider crashes because it doesn't have a unique source ID
===============================================================================
All tests passed (722 assertions in 19 test cases)
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `230a26f32e5e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.