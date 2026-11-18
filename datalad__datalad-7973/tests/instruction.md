# Issue

**Title:** Add AnnexRepo.verify_remote(), use it in tests for git-annex 10.20261026 (CVE-2026-112818)

## Description

git-annex 10.20261026 is the fix for CVE-2026-112818 ([advisory](https://git-annex.branchable.com/security/cross_repository_data_exfiltration_via_special_remote/)). It won't use a special remote enabled with `git annex enableremote` until `git annex verifyremote` confirms its configuration. While an autoenabled special remote is unverified, it also blocks git pushes and copies of annexed files to any remote.

Two tests fail against it on every platform, for example in [con/git-annex CI](https://github.com/con/git-annex/actions/runs/40480320014/job/122122286741):
- `test_ria_postclonecfg`
- `test_sibling_enable_sameas`

Both fail with `This special remote cannot be used since it's not verified. Run this command to verify it: git-annex verifyremote store-storage` (or `r_rsync`). They `get` from a special remote that was enabled with `enableremote`, by clone's RIA post-clone configuration or by `siblings enable`.

### Changes

- **`AnnexRepo.verify_remote(name)`** runs `git annex verifyremote NAME`. It then confirms exactly the configuration git-annex displayed, using the `--safe ID` that git-annex offers with it. `verifyremote` has no `--json`, and the ID ties the confirmation to that displayed configuration. The method does nothing with an older git-annex, or when nothing changed since the last verification.
- **Tests**: `test_ria_postclonecfg` and `test_sibling_enable_sameas` verify the special remotes they set up themselves, before the `get`.

### Is verifying safe?

- **In these tests: yes.** The tests create those special remotes, with locations under their own temporary directories, so there is nothing a third party could have configured.
- **In DataLad's own code paths: not done here, on purpose.** The docstring says to call `verify_remote()` only for a configuration you created or reviewed.
  - `siblings enable` is the user's `enableremote`. git-annex wants a person to look at the configuration, and DataLad cannot do that on the user's behalf.
  - In the RIA post-clone configuration (`clone_utils.py`), the ORA remote's configuration comes from the git-annex branch of the cloned dataset. Clone overrides only its URL, locally (`remote.<name>.ora-url`). `archive-id`, which selects the dataset in the store that gets read, still comes from the branch, and so does `push-url`. Verifying that automatically would let a crafted dataset in a shared store point reads at another dataset there. That is the attack the advisory describes.

### Not changed here: the user-visible consequence

With git-annex >= 10.20261026, `datalad get` from such a remote fails until the user runs `git annex verifyremote <name>`, and git-annex's error message says exactly that. This applies after `datalad siblings enable`, or after `datalad clone` from a RIA store whose ORA remote did not get autoenabled.

`siblings enable` also discards the configuration and the `verifyremote --safe` command that `enableremote` prints (see the TODO in `enable_remote()`). Showing them in the result message could be a follow-up.

### Testing

The tests ran locally with git-annex 10.20261026 (con/git-annex release build) and DataLad from this branch.
- **`test_ria_postclonecfg`, `file://` part:** fails on `maint` with the error above and passes with this branch. Its `ssh://` part could not run locally.
- **`test_sibling_enable_sameas`:** this one needs SSH, which wasn't available, so I ran the same steps with the rsync remote on a local path.
  - Without verification, `get` fails.
  - With `verify_remote()`, `remote.r_rsync.annex-verified` goes from `manual` to `verified` and `get` succeeds.
  - The second call is a no-op.
- **git-annex 10.20240129 (Ubuntu 24.04):** `verify_remote()` is a no-op, and both of the above pass.

- [x] Overview
- [x] Changelog snippet: `changelog.d/pr-7973.md`
- No existing issue to reference.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_015vAgc4ZANuUE54RVf1848o

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `df5a1f1c3b7e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.