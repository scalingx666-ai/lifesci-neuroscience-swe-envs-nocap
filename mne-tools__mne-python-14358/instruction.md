# Issue

**Title:** Speed up maxwell_filter regularization and some tests

## Description

I didn't like that `macos` was creeping up toward 28m runs, so I looked into speeding up our code and tests. There were a number of easy wins:

1. Use `qr`+`svdvals` instead of just `svdvals` in `estimate_rank`. When there are a lot of samples, it's not only faster but slightly more accurate.
2. Collapse some `rank` tests (less setup/teardown)
3. Pick fewer channels in an interpolation test
4. Avoid `pyvista-js` backend tests popping up web browser tabs 😠
5. Prefer non-`gz` in a test (saves a few sec)
6. In `maxwell_filter`, project onto `r, az, pol` directly rather than onto x/y/z followed by a cart to polar, and use `np.add.reduceat` instead of `bincount`
7. In `maxwell_filter`, use `eigh` of gram rather than full SVD 
8. Use events rather than `time.sleep` for ProgressBar, which only caused up to a `1 / 30.`s wait, but this really added time to the decoding tests
9. Trim sleep time and number of workers in the parallel set_config test
10. Create epochs faster in an ICA plotting test
11. Fix OpenMEEG deadlock on macOS when using conda + OpenMEEG wheel (two `libomp.dylib` libs)

These could be split up into separate PRs if needed for review (happy to do it if requested), but the PR is still maybe small enough I think to be reviewable! I think there are Numba replacements we can make that will speed things up further, but I'll do that as a follow-up PR (there are enough of them that it would make this PR too big I think).

These were investigated with Claude Opus 5.5, reviewed and understood by me.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47797972e7c3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.