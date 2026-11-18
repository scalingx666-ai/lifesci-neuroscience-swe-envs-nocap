# Issue

**Title:** Require Node 24.22.1, pin Bun 1.4.4 and prepare 0.6.0

## Description

## Why

Node 24.20.0 and earlier, and Bun 1.3.x, are affected by the Brotli decoder out-of-bounds write (CVE-2026-111497), which `fetch()` reaches on any `Content-Encoding: br` response. Fixed releases: Node 24.22.1, Bun 1.4.4.

## Change

Node 24.22.1 and Bun 1.4.4 in `.tool-versions`, `packageManager`, and Docker images and CI where present. `bun.lock` gains the Bun 1.4 `configVersion` field; no package versions change.
Encephalon is published, so its supported runtime floor is unchanged: `engines` stays `>=24.15.0` and the CI matrix still tests 24.15.0. Only the development toolchain moves.

## Verification

Run locally under Node 24.22.1 and Bun 1.4.4: frozen install plus every available lint, typecheck, test and build script pass. Where a Dockerfile exists, a clean-context image build reports `node -v` v24.22.1.

<!-- greptile_comment -->

<!-- greptile_summary -->

<h2><a href="https://app.greptile.com/api/retrigger?id=86616252"><picture><source media="(prefers-color-scheme: dark)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/RetriggerDark.svg?v=2"><source media="(prefers-color-scheme: light)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2"><img alt="Retrigger" src="https://greptile-static-assets.s3.amazonaws.com/badges/Retrigger.svg?v=2" align="right"></picture></a><a href="https://app.greptile.com/contract-lily/github/isaachinman/encephalon/-/pull/109"><picture><source media="(prefers-color-scheme: dark)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/ViewInGreptileDark.svg?v=2"><source media="(prefers-color-scheme: light)" srcset="https://greptile-static-assets.s3.amazonaws.com/badges/ViewInGreptile.svg?v=2"><img alt="View in Greptile" src="https://greptile-static-assets.s3.amazonaws.com/badges/ViewInGreptile.svg?v=2" align="right"></picture></a>Confidence Score: 5/5</h2>

<!-- greptile-impact-verdict --> The PR appears safe to merge; no new actionable issues were found.

<h3>Summary</h3>

Prepares Encephalon 0.6.0 with a Node.js 24.22.1 minimum and Bun 1.4.4 development tooling.
- Encephalon packages now require Node.js 24.22.1 or later.
- CI and development now use Bun 1.4.4 and patched Node 24.22.1.

<!-- greptile_confidence_score:5 -->

<sub>Reviews (4) · Last reviewed commit:  · [Reviewed by Greptile](https://www.greptile.com/?utm_source=greptile_review&utm_medium=github&utm_campaign=review_public&utm_content=isaachinman/encephalon)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `cc0ae3e53a0a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.