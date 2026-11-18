# Issue

**Title:** Fix vulnerable frontend dependencies

## Description

### Summary
Fixes the frontend (yarn) findings of the latest Trivy vulnerability scan. All affected packages are dev-only or not shipped to the browser.

- Refreshed transitive deps within their semver ranges (brace-expansion, minimatch, glob, js-yaml, nanoid, postcss, svgo, smol-toml, browserslist, ajv, basic-ftp, qs, semver, form-data, …) and `node-gyp` (pulled in by Yarn for `fsevents`), which clears tar/http-cache-semantics/ip-address
- Bumped `vite` ~8.2.4, `vitest`/`@vitest/coverage-v8` ^5.0.5, `concurrently` ^9.2.5
- Major bumps: `pg` 7 → 8 (only used by `tools/statistics`), `puppeteer-core` 24 → 25 (drops extract-zip)
- Removed unused `coveralls`
- Replaced `merge-img` (pins jimp 0.2.27 → request, jpeg-js, url-regex, …) with a small `pngjs` helper in the screenshot tests; verified pixel-identical output against `merge-img`

Remaining findings: `braces` (no fix released), `vue-template-compiler` (via unmaintained `documentation`), `minimist`/`static-eval` (build-time transform of `cwise`, not part of the browser bundle).

Backend findings (jackson, jakarta.mail, jdom2) will follow in a separate PR.

### Steps to test:
- CI (typecheck, lint, unit tests, build) passes
- Screenshot tests pass (uses puppeteer 25 and the new image merging)

------
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b70624f5aa81`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.