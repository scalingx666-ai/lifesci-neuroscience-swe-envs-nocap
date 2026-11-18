# Issue

**Title:** Fix xarray tests

## Description

Better error handling in xarray wrapper. The following measures are not supported there:

                   'directed_transfer_function',
                   'directed_coherence',
                   'partial_directed_coherence',
                   'generalized_partial_directed_coherence',
                   'direct_directed_transfer_function',
                   'canonical_coherence',
                   'group_delay',
                   'power'

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9d108c928216`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.