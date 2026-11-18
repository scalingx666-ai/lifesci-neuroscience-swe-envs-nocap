# Issue

**Title:** CI/DOC: fix check warnings and stop Windows rebuilding ITKR (on top of #456)

## Description

Stacked on #456: the base is its branch, so this diff only shows the new changes.

## Check warnings
- **`setANTsDeterministic` undocumented:** the Rd existed, but `.Rbuildignore` had unanchored `which\.R` and `c\.R` (added in 2017 for scratch files at the repo root). Those patterns match `man/setANTsDeterministic.Rd` and `man/antsrMetric.Rd`, and also **`R/zzz_Logic.R`, `R/zzz_which.R` and `R/ripmmarc.R`**. Roxygen honours `.Rbuildignore` too, so these were also missing from NAMESPACE. As a result, the built package has had no `&`/`|`/`which()` methods for antsImage and no `ripmmarc*()`/`scaleSpaceFeatureDetection()` since the 2024 move to R-only. This PR anchors both patterns to `^which\.R$` / `^c\.R$` and adds the restored exports to NAMESPACE.
- **Undocumented arguments:** adds `@param cv` and `@param lambda` to `fusedRidge`, and `@param lambda` to `fusedRidgeTorch`.

I edited NAMESPACE by hand to add only the restored exports. My local roxygen is 8.1.1, and it also reformats every `importFrom` and the DESCRIPTION roxygen fields.

## Windows: stop rebuilding ITKR
In #456's Windows job, the ITKR binary installs, but pak then rebuilds `ITKR 0.6.1.1` from GitHub source (54m 33s). ANTsRCore's own `Remotes: ANTsX/ITKR` wins over ANTsR's `ITKR=local::` entry, which never shows up in pak's plan. This PR adds a Windows step that clones ANTsRCore, strips its `Remotes`, builds it against the ITKR binary, and then drops ANTsR's `Remotes`. `setup-r-dependencies` (`upgrade: FALSE`) then keeps both installed packages. ANTsRCore itself still builds from source (about 55 min) until it publishes a Windows binary.

This doesn't address the `R CMD build` stall on Windows ("installing the package (it is needed to build vignettes)").

## Local check (macOS, R 4.4)
- No WARNINGs. The documentation-entries and Rd `\usage` checks pass.
- Examples pass, including the restored `Logic`/`which` examples.
- testthat: 340 passed, 0 failed. The 9 errors are all `No module named 'torch'`; there's no Python torch locally, and #456's CI installs it.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c51a0e55dc34`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.