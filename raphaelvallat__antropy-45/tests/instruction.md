# Issue

**Title:** CI: deploy documentation to GitHub Pages via GitHub Actions

## Description

Replaces the branch-based GitHub Pages deployment (master / docs/) with GitHub Actions workflows.

**Changes:**
  - Add `deploy_doc.yml` — builds and deploys docs to GitHub Pages on every push to master (requires setting Pages source to "GitHub Actions" in repo settings)
  - Add `docs.yml` — builds docs and uploads as a downloadable artifact on every push/PR to master, for preview without deploying
  - Update `.gitignore` to ignore all of `docs/build/` (previously only `docs/build/doctrees/`)
  - Add "Updating the documentation" section to `contributing.rst `with local build instructions and a guide to verifying the doc artifact from a PR

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `372dd11644dd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.