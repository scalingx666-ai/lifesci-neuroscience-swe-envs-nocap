# Issue

**Title:** Header-only shim for Boost.Archive

## Description

After replacing large parts of Boost with the C++11 stdlib, there are only (optionally) parts of Asio and Boost.Archive left to build for the boost subset we use, so I've created a single-header header-only shim that offers all of the needed functionality.

It reduces the (release) binary size by 3.4%, build times by ~5% and the dependency on separate Boost compilation units by 100%. I haven'tr tried it, but this could enable building against a system boost installation without name mangling.

Backwards compatibility is a big concern, so [the already existing unit test](https://github.com/sccn/liblsl/blob/master/testing/internal/serialization_v100.cpp) makes sure that both Boost.Archive and the shim here serialize test data and LSL samples with the test pattern to the exact same binary data and can deserialize it to the original data.

For now, it's opt-in, but once it's tested across several compilers and most importantly on a big endian machine it could be enabled by default some time in the future.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `836cf86ab52b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.