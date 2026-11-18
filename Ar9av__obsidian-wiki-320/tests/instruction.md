# Issue

**Title:** feat(install): profile-scoped Hermes skills with native updates

## Description

## Summary
.

- Add `obsidian-wiki install-hermes`: explicit existing profile home (`--hermes-home` or `HERMES_HOME`), optional fork source, skill selection, dry run and confirmation-only `--yes`.
- Delegate fetching, security scans, provenance and updates to the native Hermes CLI. No private hub-lock writes and no custom updater.
- Add `setup --vault-only` for vault + shared wiki configuration without agent installation, hooks or sync. Preserve the existing broad setup behavior from #66/#67.
- Document migration, partial batches, native updates, separate Python dependency lifecycle, shared config scope and external-directory development.
- Teach wiki-setup not to run broad setup or register Claude hooks from Hermes.

## Important discovery
Real CLI testing showed `hermes skills install Ar9av/obsidian-wiki/skills/llm-wiki` selecting the unrelated `official/research/llm-wiki` skill. `--name` alone did not prevent that source-adapter collision. This implementation uses explicit raw GitHub SKILL.md URLs (default-branch HEAD) plus `--name`; native URL provenance supports check/update without changing Hermes core. URL bundles include referenced support files; shared framework assets remain supplied by the separately installed Python package and configured `OBSIDIAN_WIKI_REPO`.

## Verification
- New installer suite: 21 passed (test-first failure/green cycles).
- Installer + existing CLI-install tests: 26 passed, with one existing Windows junction encoding warning.
- Full suite on native Windows/Python 3.12: 1222 passed, 90 skipped, 311 subtests passed; 3 failures reproduced on unchanged upstream main (Unicode decoding in test_clock setup and two existing test_hooks setup subprocess tests). Test git identity supplied only through command-local environment variables.
- Real native Hermes install in a disposable scratch profile: wiki-query and this repository's llm-wiki; read back installed files and native URL/hash provenance; check returned up_to_date; update returned No updates available; local-edit bytes preserved after update.
- Baseline CLI rejects install-hermes (exit 2); regression test exercises the new route.
- `git diff --check` passes.

## Scope / risk
No Hermes lifecycle hooks, auto-recall/capture, memory-provider changes, transcript import, or sync. No user agent profile was installed into: live CLI probes used disposable scratch homes. No Hermes runtime/config modifications. Existing profile destinations are refused before launching a batch; successful earlier installs remain after later failure. Python package/assets and default-branch skills have separate upgrade lifecycles, documented explicitly.

CI status is reported by GitHub checks; local baseline failures above are not claimed green.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `331f3465f571`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.