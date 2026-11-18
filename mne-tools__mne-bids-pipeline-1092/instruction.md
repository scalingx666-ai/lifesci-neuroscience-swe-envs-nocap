# Issue

**Title:** fix mf_int_order; add mf_ext_order

## Description

### Before merging …

- [x] Changelog has been updated (`docs/source/dev.md.inc`)

### fix mf_int_order; add mf_ext_order

Fixed bug where `mf_int_order` wasn't being passed to the `maxwell_filter` (wasn't included in `mf_kws`).

Also added a config option to supply `mf_ext_order`. Even though `mf_ext_order` can be supplied through `mf_extra_kws`, seems like an important enough parameter to assign its own config argument.

Included non-standard internal & external orders to the `ds000117` config as a test, though we'd have to check the logs to confirm.

Could can reduce the logging of int/ext order if this is an opinionated default.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3e344fa1ca2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.