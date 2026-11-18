# Issue

**Title:** Add C++ API function to retrieve the opaque C API handles

## Description

I recently had a situation where I had to push some non-zero terminated strings with known lengths to an outlet with a regular sampling rate, so I only had one timestamp.

The C API had `int32_t lsl_push_chunk_buft(lsl_outlet out, const char **data, const uint32_t *lengths, unsigned long data_elements, double timestamp)`, but it wasn't wrapped in the C++ API and I didn't want to give up the niceties the C++ API offered.

This PR adds a function `raw_lsl_ptr` to both the stream outlet and inlet so the plain C API functions can be called without having to rewrite everything to use the C API.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d39057aebc4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.