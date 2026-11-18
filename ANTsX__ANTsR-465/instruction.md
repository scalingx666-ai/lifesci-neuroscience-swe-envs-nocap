# Issue

**Title:** BUG: make setANTsDeterministic() actually take effect

## Description

## Summary

`setANTsDeterministic()` had no effect on registration. Four bugs combined:

- **Duplicate `.onLoad`.** `R/config.R` and `R/zzz.R` both defined `.onLoad`. `zzz.R` collates later, so its no-op replaced the one that sets the `ants.deterministic` / `ants.randomSeed` defaults. There is now a single `.onLoad` in `zzz.R`, which sets the defaults only when the user hasn't already set them.
- **Wrong option name.** `antsRegistration` read `getOption("randomSeed")`, but `setANTsDeterministic()` sets `ants.randomSeed`, so `--random-seed` was never passed to ANTs. It now reads `ants.randomSeed`.
- **Repro check fallback.** With the option unset, `getOption("ants.deterministic", TRUE)` made every non-Repro registration print the "not deterministic" message. It now uses `isTRUE(getOption("ants.deterministic", FALSE))`, and the message points to the `antsRegistrationSyN*Repro[x]` transforms instead of telling users to call `setANTsDeterministic(TRUE)`, which they already have.
- **`labelImageRegistration` seed.** `args <- lappend("--random-seed", randomSeed)` replaced the entire command line whenever a seed was set, which includes every `Repro` transform. The seed is now appended. When `randomSeed = NULL`, the function falls back to `ants.randomSeed`.

`setANTsDeterministic(FALSE)` now also clears `ants.randomSeed` and `ANTS_RANDOM_SEED`, so later registrations are no longer seeded.

## Overlap with open PRs

- #451 also merges the two `.onLoad`s and adds the `isTRUE(..., FALSE)` fallback, bundled with `multiLabelMorphology` and patch fixes.
- #448 has the same `lappend(args, list("--random-seed", ...))` fix, bundled with other registration changes.
- Neither one fixes the `randomSeed` / `ants.randomSeed` mismatch, which is the reason the seed never reached ANTs.

The overlapping hunks are written the same way, so whichever PR merges second should rebase cleanly or with trivial conflicts.

## Tests

`tests/testthat/test-deterministic.R` captures the assembled ANTs command line without running the registration. It checks:
- the `.onLoad` defaults, and that a user-set value isn't overridden;
- `setANTsDeterministic(TRUE, 42)` → `--random-seed 42` in `antsRegistration`, and `FALSE` removes it again;
- `labelImageRegistration` appends the seed (explicit or from the option) and keeps the rest of the arguments.

All 27 expectations pass locally. With master's `R/` code, 8 of them fail.

The man pages were edited by hand to match the roxygen comments, to avoid an unrelated roxygen 8 regeneration.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `43d1624aeb21`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.