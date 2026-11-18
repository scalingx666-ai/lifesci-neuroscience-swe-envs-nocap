# Issue

**Title:** Use the WEBKNOSSOS logo as default OpenGraph preview image

## Description

### Summary
Link previews (Slack etc.) for WEBKNOSSOS pages without a specific preview image showed an empty image placeholder, because the default OpenGraph tags had no `og:image`. They now default to the WEBKNOSSOS logo.

- `frontend/public/images/og-image.png`: 512×512 PNG of `wk-logo.svg` (crawlers ignore SVG).
- `vite.config.ts`: `publicDir: "frontend/public"`, so the file is copied unhashed to `public/images/` and served at `/images/og-image.png`. Before, `publicDir` defaulted to `public`, the same as `outDir`.
- `OpenGraphService.defaultTags`: sets `og:image` to `${http.uri}/images/og-image.png`. Datasets/annotations with an accessible thumbnail keep using it.

### Steps to test:
- On the dev instance, `curl -s <instance>/ | grep og:image` shows the logo URL, and the URL loads the PNG.
- Paste the dev instance URL into Slack: the preview shows the logo.
- A public dataset link still shows the dataset thumbnail.

------
- [x] Added changelog entry (create a `$PR_NUMBER.md` file in `unreleased_changes` or use `./tools/create-changelog-entry.py`)
- [x] Removed dev-only changes like prints and application.conf edits

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32503b94008c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.