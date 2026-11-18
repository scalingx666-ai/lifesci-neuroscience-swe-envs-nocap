# Issue

**Title:** CI: add macOS, Windows and ubuntu-24.04 checks and a test-coverage workflow

## Description

## Summary
- **R-CMD-check:** adds `ubuntu-24.04`, `macos-latest` and `windows-latest` (R release) to the matrix next to `ubuntu-latest`. These replace the commented-out macOS entries.
- **test-coverage (new):** runs `covr::package_coverage()` for pushes and pull requests to `main`/`master` and uploads Cobertura output to Codecov.
- **Installing ANTsRCore and ITKR:** neither is on CRAN, so the first CI run failed on every runner with `Can't find package called ANTsRCore`.
  - **DESCRIPTION:** replaces `Additional_repositories: https://antsx.github.io/drat` with `Remotes: ANTsX/ANTsRCore, ANTsX/ITKR`. The drat site no longer exists (GitHub Pages 404), and pak never queried it.
  - **Workflows:** drop `any::ANTsRCore` / `any::ITKR`; `setup-r-dependencies` installs them from the Remotes instead.
  - **Windows:** ITKR can't be built from source on the runner. The workflow installs the ITKR release binary (`ITKR-release.zip`) and points the ITKR remote at it, the same way ANTsRCore's CI does. ANTsRCore is then built from source against it.
  - **Linux:** `libhdf5-dev` and `cmake` are now installed *before* the dependencies, because hdf5r and the ITKR source build need them.
  - **test-coverage** runs on `ubuntu-24.04`, because ITKR doesn't build from source with GCC 15 on `ubuntu-latest` yet (same note as ANTsRCore's CI).
- **`.gitignore`:** ignores `.claude/`.

## Notes
- **`ubuntu-latest` will fail** until ITKR picks up ITK 4f275769e3 for GCC 15; `ubuntu-24.04` covers Linux meanwhile.
- **Windows ITKR fallback:** ITKR v0.6.1 publishes only `ITKR-4.1.zip`, so `releases/latest/download/ITKR-release.zip` returns 404. The Windows step tries the latest release first and falls back to v0.6.0.2.1 (`ITKR_FALLBACK_TAG`), which still has `ITKR-release.zip`. It picks up the fixed release automatically once ITKR publishes `ITKR-release.zip` again.
- **macOS and ubuntu-24.04 are slow.** They build ITKR and ANTsRCore from source.
- **Codecov token:** the upload needs a `CODECOV_TOKEN` repository secret.
- **Coverage on master:** `covr` and `R CMD check` run every `.R` file in `tests/`, and `tests/nsa_R_vs_py.R` needs Python `torch`. So coverage also needs #447, which moves those scripts out of `tests/`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `325a3036c60f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.