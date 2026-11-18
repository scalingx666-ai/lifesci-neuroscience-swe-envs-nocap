# Issue

**Title:** Add missing argument to AdminExport component

## Description

I don't think this prop is implicitly available to the AdminExports component:
https://github.com/OpenNeuroOrg/openneuro/blob/master/packages/openneuro-app/src/scripts/dataset/mutations/admin-exports.jsx#L30

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `31648e3551ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.