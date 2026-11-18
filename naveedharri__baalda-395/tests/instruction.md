# Issue

**Title:** Release 0.1.112 (silent)

## Description

## Release 0.1.112 (silent)

This promotes `staging` to `main` and bumps the four version files to **0.1.112**.

**It's silent:** `docs/RELEASE_NOTES.md` has no `## 0.1.112` section, so the release body gets the `<!-- baalda:silent -->` marker and the desktop skips What's New. The update still installs and restarts as usual.

`main` has nothing that `staging` lacks. Merge with a **merge commit** (not Rebase or Squash, which rewrite the commits and split `staging` from `main`), then fast-forward `staging` to `main`. The merge commit's first parent is `main` at 0.1.111, so the `gate` job releases.

## What ships

- **New owners get the vault key reminder right away (`313742e2`).** Keying a vault now tells the owner's apps to ask for messages again, instead of waiting for the 10-minute check.
- **The reminder can't be crowded out.** The app names the open vault in `GET /api/messages` and the server skips copies meant for other vaults, so an owner of 5 or more vaults still gets the open vault's copy. Builds that don't send it keep the old list. This half needs the new desktop build.
- **`docs/MESSAGES.md`:** the example reminder comes back after 1 hour until the key is saved.

These are the two known issues listed in #394.

## Before merging

- Test on Baalda Staging once the staging build finishes.
- The reminder only reaches people once an operator creates it on the production server. This PR does not create it.
- Set `minVersion` in that message with the limit fix in mind: 0.1.111 can show the popup, but only 0.1.112 sends the open vault.

## Checked

- 33 of 33 tests across the messages, key and keying suites, including two new ones. The timing test fails without the fix.
- Desktop message tests and typecheck.
- Local run with Baalda Staging against a local server: the popup appeared 8.4 seconds after the vault was created, on a small vault.
- Not run locally: the full test suite. CI runs on the `staging` push.
- Not tested: the popup coming back after one hour.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `304ebf950398`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.