# Issue

**Title:** [MAR-2930] Prepare the 0.5.0 release

## Description

## Summary

Prepares Encephalon 0.5.0 from current `main`: version and generated version, the README and contract version lines, the release-version test, example tarball filenames in the contributor guide, and the 0.5.0 changelog section. Compatibility stays pinned to the published 0.3.0 oracle, as the release workflow documents.

## Release contents

- MAR-2918: reads, cache preparation, `init` and adds for other subjects keep working when one subject has multiple active heads. `VALIDATION_FAILED` details now include `recordId`.
- MAR-2919: opt-in `ENCEPHALON_DEBUG=1` CLI diagnostics.
- MAR-2920: simpler canonical record publication and staging cleanup.
- MAR-2921: the SQLite gate is the only operation lock.
- MAR-2922: corrected post-commit recovery text and documented CLI argument forms.
- MAR-2926 and MAR-2929: deterministic Windows timing tests.

This is a minor bump because it adds a feature and changes behaviour without removing anything. No canonical format, cache schema or public type changes.

## Merge gates

- **Depends on #107 (MAR-2929).** `main` is currently red from Windows timing-dependent tests that #107 fixes. Merge #107 first, then merge `main` into this branch and wait for green CI.
- Greptile 5/5 and every required check on the final head. Because `package.json` changes, CI runs the exact-candidate package checks, the published-0.3.0 compatibility proof, historical release tools, benchmarks and the tarball-only publish dry run.

## Before publishing

- MAR-2920 and MAR-2921 changed publication and locking, and GitHub's Windows runners don't exercise antivirus or indexer file handles. Run a quick smoke test on a real Windows machine with Defender on: `init`, a few `add` (including one that supersedes another), `search` and `validate`.
- After merge, wait for green `main` CI and the trusted artifact promotion, then publish that exact tarball manually with `npm publish --ignore-scripts <trusted tarball>`. Agents never publish.

## Verification

- `bun run lint`, `bun run typecheck`, `bun run build`, `bun run check:generated`, `bun run test:all` (859 tests: 856 passed, 3 platform skips) and `bun run check:package` pass locally. The built CLI reports `0.5.0`.
- The candidate tarball is 248,143 bytes (0.4.0: 254,348). The published-0.3.0 compatibility check and publish dry run run in CI; locally `package-artifacts/` holds the published 0.4.0 pair, which the compatibility check doesn't allow alongside a new candidate.

## Linear

Closes [MAR-2930](https://linear.app/marcoappio/issue/MAR-2930).

<!-- greptile_comment -->

<!-- greptile_summary -->

<h2><a href="https://app.greptile.com/api/retrigger?id=78339641"><picture><source media="(prefers-color-scheme: dark)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/RetriggerDark.svg?v=2"><source media="(prefers-color-scheme: light)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2"><img alt="Retrigger" src="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2" align="right"></picture></a>Confidence Score: 5/5</h2>

<!-- greptile-impact-verdict --> The release-preparation changes appear safe to merge once the required checks pass.

<h3>Summary</h3>

Prepares Encephalon `0.5.0` without changing runtime behavior.
- Encephalon's package and release references now say 0.5.0.
- Release-check commands now point to the 0.5.0 tarball.
- The changelog records what is included in Encephalon 0.5.0.

No actionable new issues were found. The previous-review commits have different merge bases, so the full PR diff was reviewed. No previous finding threads were supplied. Tests were not run during this review.

<!-- greptile_confidence_score:5 -->

<sub>Reviews (2) · Last reviewed commit:  · [Reviewed by Greptile](https://www.greptile.com/?utm_source=greptile_expert&utm_medium=github&utm_campaign=code_reviews&utm_content=isaachinman/encephalon)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cacbc2c4a8e8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.