# Issue

**Title:** fix(vis): harden ELK heap scaling and fix flaky signal safety test

## Description

## Summary
- Bump ELK Node.js heap scaling from 8x to 16x JSON size to prevent V8 OOM on 250k+ node graphs
- Mark all 100k node tests as `@rare` (too slow for regular test runs)
- Fix flaky `TestSignalSafety::test_sigalrm_during_forward`: use `setitimer(50ms)` instead of `alarm(1s)`, increase model iterations, skip gracefully if alarm doesn't fire

## Test plan
- [x] `test_sigalrm_during_forward` passes 5/5 runs consistently
- [x] Smoke tests pass
- [x] 100k tests now excluded from `-m "not rare"` runs

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `478d872f2c22`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.