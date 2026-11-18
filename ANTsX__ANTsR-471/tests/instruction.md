# Issue

**Title:** NEWS: backfill release notes from 0.4.1 to the development version

## Description

## Summary

`NEWS` stopped at 0.4.0 (2017), although DESCRIPTION is at 0.6.7. This PR fills in every release since then, plus a "Development version" section for what's on master after the 0.6.7 bump. The entries come from the commit history between version bumps in DESCRIPTION, checked against the NAMESPACE, DESCRIPTION and function-signature diffs at each bump. Only user-facing changes are listed: new, removed or renamed exports, changed arguments and defaults, noticeable bug fixes and dependency changes. CI, docs and WIP commits are left out.

Closely spaced patch releases are grouped into one section, e.g. `0.5.6.1 - 0.5.7.5`, so 0.4.1 to 0.5.7.5 takes 5 sections rather than ~30.

## Items worth checking

- **Which version a change belongs to.** A commit is listed under the *next* version bump after it, so changes made after the bump to 0.6.2 appear under 0.6.3. If releases were actually cut right after each bump, the 0.6.x entries are shifted by one version.
- **Breaking changes called out as `API:`**
  - `ants.set.seed()` was removed in favour of `setANTsDeterministic()` (0.6.2).
  - `antsRegistration()` SyN defaults changed: CC radius 4 to 2 and gradient step 0.1 to 0.2 (0.6.2).
  - `simlr(voxmats =)` became `data_matrices =`, with new defaults (0.6.3).
  - `antspymm_simlr()` was renamed to `NNHEmbed()` (0.6.6).
  - The stricter `antsSetSpacing`/`antsSetOrigin`/`antsSetDirection` checks (dev).
- **0.6.0** is described as the move to an R-only package, with all compiled code in ANTsRCore.

No code changes; `NEWS` only.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1478d54cd86d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.