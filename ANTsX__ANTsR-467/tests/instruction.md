# Issue

**Title:** getANTsRData: default backup = FALSE; drop Windows debugging steps

## Description

- getANTsRData() errors again on a failed download, as before #464, but with the reason (host, HTTP error, HTML page or checksum). The stand-in is opt-in with backup = TRUE, which the brackets and fsl2antsrTransform examples use so R CMD check doesn't depend on figshare being up.
- Remove the per-example timing step (and its script) and the live install step: they found the Windows hangs, which #464 fixed, and cost ~4 min per Windows run. R CMD check reports example timings.
- Keep the expression trace and the 45 min cap, and print the Rout/trace tails and upload diagnostics only when the check fails.
- Fix the crash that failed master's Windows check after #464/#465 (`checking examples with --run-donttest`): the `imagesToMatrix` example listed every `*.mha` in `tempdir()`, including the 256x256 `r16` written by the `antsImageWrite` example, and `imagesToMatrixR` indexes every image with the mask's dimensions, so it read out of bounds. `imagesToMatrix()` now checks each file exists and matches the mask size (R error instead of a crash, with a test), and the example uses its own subdirectory.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b6ac07dca098`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.