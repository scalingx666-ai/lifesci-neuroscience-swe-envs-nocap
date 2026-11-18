# Issue

**Title:** fix(web): restore Settings focus to the actual opener

## Description

## Root cause
Safari does not necessarily move `document.activeElement` to a pointer-clicked button. Settings therefore captured the page root as its opener. In addition, synchronous focus restoration could run while the background was still `inert`, and the model popover's Manage Providers row unmounts as Settings opens.

## What changed
- pass the actual opener element from Sidebar Settings, the no-provider CTA, and provider-management entry points
- restore focus on the next animation frame after all modal/inert cleanups finish
- skip stale, disconnected, or still-inert return targets without turning close into an error
- return Manage Providers to the persistent Model and reasoning trigger, not the unmounted popover row
- add focused unit coverage for deferred restoration, stale openers, inert openers, and focus exceptions

## Verification
- `npm run test -w @brainpilot/web` — 69 files, 556 tests passed
- Web production build passed
- deployed with fresh state to the 208 Preview
- Safari Computer Use on the deployed Preview:
  - Sidebar Settings → Escape → focus returns to Settings
  - Sidebar Settings → close button → focus returns to Settings
  - Model and reasoning → Manage Providers → Escape → focus returns to Model and reasoning

## Preview note
The cloud image contains the exact product commits in this PR plus a test-only Python package mirror build commit already reviewed in #499; that build-only commit is not part of this PR.

Keeping this PR Draft for review.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a706b589b42e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.