# Issue

**Title:** CI: install ANTsRCore and ITKR from r-universe instead of Remotes

## Description

## Why

r-universe hasn't published ANTsR binaries since the `Remotes:` field was added in #443. Its latest ANTsR build ([run](https://github.com/r-universe/antsx/actions/runs/41128291981)) installed its own ANTsRCore and ITKR binaries, then followed `Remotes: ANTsX/ANTsRCore, ANTsX/ITKR` and rebuilt both from GitHub source. ANTsRCore took about 45 minutes, and ITKR was still compiling when the source job hit its 60-minute limit, so no binaries were built.

r-universe already has ANTsRCore 0.8.4 and ITKR 0.6.2 binaries for Linux, macOS and Windows, so ANTsR doesn't need `Remotes:`.

## Changes

- **DESCRIPTION:** replace `Remotes:` with `Additional_repositories: https://antsx.r-universe.dev`.
- **R-CMD-check / test-coverage:** add `https://antsx.r-universe.dev` through `setup-r`'s `extra-repositories`. Drop the ANTsRCore/ITKR release-binary install steps, the Windows ITKR/ANTsRCore source fallback, and the step that stripped `Remotes:` from DESCRIPTION.
- **README:** document installing from r-universe. Switch `devtools::install_github` to `remotes::install_github`, which reads `Additional_repositories`.

## Things to watch in this PR's CI

- Platforms with no matching r-universe binary still install from the r-universe source package: Ubuntu releases other than the one r-universe builds on, and macOS with R-devel (r-universe has macOS binaries only for R 4.5 and 4.6). On those runners ANTsRCore/ITKR builds as before, so those jobs may stay slow.
- The r-universe Windows check from Oct 30 timed out after about an hour in `checking examples`. That's separate from this PR, but it may come back once the build gets that far.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e45858bb5f9b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.