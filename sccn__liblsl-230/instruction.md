# Issue

**Title:** Update docs

## Description

1. Fix the broken links in the `examples` section of `README.md`
2. Update the API documentation
   - lsl_resolve_streams -> lsl_resolve_all
   - Complete the doc of `lsl_push_sample_ft`
   - Update out-dated pugixml link

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e61a2ef7a25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.