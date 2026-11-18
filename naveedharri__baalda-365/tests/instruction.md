# Issue

**Title:** Release 0.1.99: sign-up writes the password wrap

## Description

Hotfix 0.1.99 (silent release).

- **Sign-up now saves the password wrap too.** In 0.1.98 only sign-in did, so a brand-new account's account key had no password wrap. The conversion safety rule then saw "no way back" and held that person's solo vault unencrypted until a later password sign-in. Nothing was lost: the vault kept working, it just stayed unencrypted. Sign-up now runs the same bounded unlock as sign-in, and the first account-key run writes the wrap.
- Live test: `seamlessFlows.it.test.ts` scenario 8 covers it (a brand-new account unlocks before any key, the first key gets the wrap, and its solo vault converts). 8/8 against a live server; desktop suite green apart from two known timing tests.
- Version bump to 0.1.99 (four files). Release notes section left empty, so the release is silent.

No server changes, no migrations.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `adac613d4694`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.