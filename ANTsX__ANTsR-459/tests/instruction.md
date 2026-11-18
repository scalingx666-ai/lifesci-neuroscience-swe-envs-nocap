# Issue

**Title:** CI: skip vignettes on Windows check and cap check step time

## Description

The Windows R-CMD-check job in #456 hit the 6h limit twice, hanging in R CMD build at 'installing the package (it is needed to build vignettes)', though a direct R CMD INSTALL in the same job takes about a minute. On Windows only, build with --no-build-vignettes and check with --ignore-vignettes; add timeout-minutes: 120 to the check step. Root cause of the hang is still unknown.

Replaces #458, now from a branch in ANTsX/ANTsR so it can be stacked on #456.

**ANTsRCore binaries (21596687):** Windows and macOS now install the ANTsRCore release binary for the runner's R version and arch (arm64/x86_64, `.tgz` or the `.tar.xz` that R >= 4.7 produces). Remotes are then dropped, which skips the ~55 min ANTs build on Windows. ITKR isn't needed because it's only `LinkingTo` for ANTsRCore. If no binary matches, or the binary fails to load, CI falls back to the previous source builds. Adds a macOS R-devel check. Intel macOS binaries come from ANTsX/ANTsRCore#207.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b7816d38170f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.