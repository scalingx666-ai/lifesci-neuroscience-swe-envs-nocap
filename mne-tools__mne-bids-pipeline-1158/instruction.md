# Issue

**Title:** BEH: Use union of bads when Maxwell filtering

## Description

### Before merging …

- [x] Use union of bads for maxwell filtering
- [x] Change `add_bads=None` to `add_bads=False` default (more explicit!)
- [x] Don't triage `add_bads` based on `_do_mf_autobad` -- even if we don't do MF autobad then the bad file that gets added matches what's read from the file anyway, so no harm in using it
- [x] Remove some `in_files.pop(<name>, None)` in favor of `if <condition>: in_files.pop(<name>)` to be more explicit about when files should be used or not
- [x] Changelog has been updated (`docs/source/dev.md.inc`)
- [x] Sneak in a fix for #767 since it's trivial
- [x] Sneak in a fix for #326 since it's trivial

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `51f9946da994`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.