# Issue

**Title:** fix(setup): support Hermes named profiles in skill installation

## Description

## Summary

. When a Hermes user runs under a named profile (`HERMES_HOME=~/.hermes/profiles/<name>`), `setup.sh` was installing skills to `~/.hermes/skills/` only (default profile), making them invisible to the active session.

Implements **Option C** from the issue:

- Always installs to `~/.hermes/skills/` (default profile baseline — unchanged behaviour)
- If `$HERMES_HOME` is set and differs from `~/.hermes`, also installs to `$HERMES_HOME/skills/` (the active named profile)
- Scans `~/.hermes/profiles/*/` and installs to every named profile found, skipping any already covered by `$HERMES_HOME` to avoid duplicate work

## Test plan

- [ ] `bash -n setup.sh` passes (syntax check)
- [ ] Run with no `$HERMES_HOME` set → skills land in `~/.hermes/skills/` only (no `profiles/` dir → no extra installs)
- [ ] Run with `HERMES_HOME=~/.hermes/profiles/tia` → skills land in `~/.hermes/skills/` **and** `~/.hermes/profiles/tia/skills/`, other profiles also get symlinks, no duplicate for `tia`
- [ ] Run with `HERMES_HOME=~/.hermes` (same as default) → no duplicate install, profiles still scanned
- [ ] Config and vault path are unchanged across profiles (shared via `~/.obsidian-wiki/config`)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c2295366742`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.