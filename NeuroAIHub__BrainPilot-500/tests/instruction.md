# Issue

**Title:** fix(web): make Settings and Live Demo fit mobile viewports

## Description

## What changed
- replace the hidden horizontal Settings strip with a complete responsive grid (3 columns on tablets, 2 columns at phone width)
- keep every Settings section visible with 42px touch targets and intact Chinese/English labels
- make the Live Demo landing, cards, privacy copy, session rows, and import target shrink within the 64px-rail mobile shell
- stack the demo player header controls at phone width
- preserve the selected Settings control's focus and explicitly own Tab / Shift+Tab traversal inside the modal for Safari/WebKit
- add CSS layout contracts for the 390px Live Demo and Settings regressions plus focus-trap unit coverage

## Verification
- `npm run test -w @brainpilot/web` — 69 files, 561 tests passed
- `npm run build -w @brainpilot/web` — passed (after building workspace dependencies)
- deployed to the 208 Preview; Main and Sandbox healthy
- exact WebKit 390×844 cloud checks, Chinese and English:
  - document `scrollWidth === clientWidth === 390`
  - Live Demo main/landing `scrollWidth === clientWidth === 326`
  - both cards `scrollWidth === clientWidth === 292`
  - all five hosted Settings sections visible at once; 170×42px buttons; no English label clipping
  - focus: Preferences → Shift+Tab → Knowledge Base → Enter activates Knowledge Base and retains focus

## Preview note
The cloud test image contains the exact product commits in this PR. A test-only build commit was layered on top to reuse the already-reviewed Python package mirror setting from #499; it changes dependency download source only and is not part of this PR.

Safari Computer Use is still pending because the test Mac is currently locked; this PR remains Draft and I will append that result after the Mac is unlocked.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f25a0a0faa7c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.