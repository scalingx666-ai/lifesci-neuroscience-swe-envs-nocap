# Issue

**Title:** NF: let the user verify special remotes interactively (git-annex >= 10.20261026)

## Description

### Overview

, following the `mode=` refinement in

`AnnexRepo.verify_remote(name, mode='interactive')`, added in #7973, now takes a mode. Whether a remote is verified is read from the config git-annex sets, `remote.NAME.annex-verified=verified`:

| mode | not verified | verified already |
|---|---|---|
| `interactive` (default) | shows the configuration (as `git annex verifyremote NAME` prints it, minus the commands) and asks yes/no via DataLad's UI: "yes" runs `--safe ID`, "no" runs `--unsafe`. **Without an interactive UI** it raises the new `RemoteNotVerifiedError`, whose message is git-annex's instructions | no-op |
| `mark-safe` | `--safe ID` (the previous behavior, kept for tests) | no-op |
| `mark-unsafe` | `--unsafe`; git-annex's warning ("You may be under attack …") is logged | warning only, as git-annex cannot revoke a verification |

It returns True if the remote is verified afterwards (or git-annex doesn't verify special remotes), False if not.

It is called in interactive mode where DataLad itself enables a special remote:

- **`siblings enable`**: if the sibling is left unverified ("no", or no interactive session), the result is `impossible` instead of `ok`. Without an interactive session, the message is git-annex's instructions, which `enable_remote()` used to discard.
- **RIA post-clone configuration** (`clone_utils.postclonecfg_ria`), when it enables the store's ORA remote: it asks too. Without an interactive session it logs git-annex's instructions as a WARNING, and the clone still succeeds.

### "unsafe → safe → unsafe again, all in effect": the last step can't be in effect

In git-annex 10.20261026, `--unsafe` records nothing (it warns and exits 1), and nothing ever revokes a verification. `test_verify_remote` therefore asserts what really happens, using `get` from the remote as the check:
1. unsafe: the remote stays blocked, `get` fails, and git-annex's warning is logged.
2. safe: `annex-verified` becomes `verified`, and `get` works.
3. unsafe again: `verify_remote()` only warns that the remote is verified already, without calling git-annex, and `get` still works.

Making step 3 "in effect" would need git-annex support for revocation, which may be worth a todo upstream.

### Behavior changes to be aware of

- `verify_remote()`'s default changes from confirming everything (released in 1.7.2) to `interactive`. Callers that want the old behavior pass `mode='mark-safe'`.
- `datalad siblings enable` in a non-interactive session now reports `impossible`, with git-annex's instructions, where it used to report `ok` for a remote git-annex would refuse to use.
- Fails closed: a special remote enabled by a git-annex older than 10.20261026 has no `annex-verified`, though git-annex treats it as verified. `verify_remote()` then finds nothing to confirm, warns, and returns False. `git config remote.X.annex-verified verified` fixes it.

### Not covered here (possible follow-ups)

- Special remotes **autoenabled** by `annex init` during `clone`. git-annex lets you read from them while unverified, but blocks push and copies to any remote. Verifying those at push time is a candidate follow-up.
- DataLad's own special remotes (`datalad`, `datalad-archives`), which `ensure_datalad_remote()` enables with `enableremote`.
- A `siblings verify` action.

### Testing

- New: `test_verify_remote` (non-interactive raise, no ID offered, `mark-unsafe` → `mark-safe` → no git-annex calls once verified, updated configuration of a verified remote) and `test_verify_remote_interactive` (no/yes) in `test_annexrepo.py`; `test_sibling_enable_verify` (non-interactive / "no" / "yes"). `test_ria_postclonecfg` now checks the warning, and answers "yes" for its last clone instead of using `mark-safe`.
- Locally with git-annex 10.20261026: `test_annexrepo.py`, `test_siblings.py` and `test_ria_postclonecfg` pass (103 passed). With git-annex 10.20261020 the new tests skip.
- The SSH-only parts (`test_sibling_enable_sameas`, the `ria+ssh` half of `test_ria_postclonecfg`) run in CI (`DATALAD_TESTS_SSH=1`). The core suite was green on `b9d3cb2`.
- The `datalad-next` and `datalad-container` failures also happen on `maint`; see

### PR checklist

- [x] Overview of the changes and why
- [x] Changelog snippet: `changelog.d/pr-7976.md`
- [x] ``
- [x] Draft until reviewed

Based on `maint`, because `master` does not have `verify_remote()` yet. The `semver-*` label is left to you; the label check rejects `semver-minor` against `maint`.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01PvaGRcEaTjQf37FXRFBUgi

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4cdd58b243ba`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.