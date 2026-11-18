# Issue

**Title:** [modules | document_repository, electrophysiology_uploader] Backport (to 26.0-release) file download path traversal security fix (GHSA-47jj-7xfg-8759)

## Description

## What was wrong

The file download handling did not consistently decode and resolve user-controlled filenames at the correct point in the download flow.

This could allow specially crafted encoded paths to bypass the intended path validation and potentially access files outside the configured download directory.

The issue affected file downloads used by the Document Repository and Electrophysiology Uploader modules.

## What changed

- Removed early URL decoding from the Document Repository download flow.
- Updated the Electrophysiology Uploader to pass the complete requested relative path to the shared download handler.
- Centralized URL decoding and path resolution in `FilesDownloadHandler` before constructing the target file path.

This ensures encoded filenames are decoded before path traversal validation is applied.

## Reference

Backport of the upstream security fix addressing [[GHSA-47jj-7xfg-8759](https://github.com/aces/Loris/security/advisories/GHSA-47jj-7xfg-8759)].

This change is submitted specifically as a security backport to the `26.0-release` branch.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bd5332462ad4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.