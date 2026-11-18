# Issue

**Title:** rename perfskills to geak

## Description

PR for #341
# Rename e2e optimizer env/tokens to `GEAK`; sync the `geak` directory contract

## Summary
Renames the standalone e2e optimizer's `PERFSKILLS_*` env vars and tokens to `GEAK_*`,
and aligns the cross-repo artifact directory contract with Hyperloom (which now hands off
under a `geak/` experiment root).

## Changes
- **`interface/run_e2e.py`**: `PERFSKILLS_*` env/tokens → `GEAK_*`; the experiment-root
  detection now keys off the `geak` basename (`exp_root`/`_experiment_root_from_exp_root`),
  and the TraceLens artifact scan prefix changes `perfskills:` → `geak:`.
- **`interface/run_e2e.md`**: doc sync — `exp_root`/`eval_dir` examples and the "parent of
  `geak`" resolution wording now match the code (was `perfskills`).
- **`e2e_workflow/e2e_workflow.js`**: contract comment `perfskills handoff` → `geak handoff`.
- **`e2e_workflow/roles/director.md`**, **`.../adapters/clients/inferencex.sh`**: brand
  references `PerfSkills` → `GEAK`.
- **`interface/test_run_e2e_recovery.py`**: updated to the new tokens.

## Rationale
Hyperloom now calls this optimizer simply `geak` and writes the handoff under
`<session_dir>/geak`. Keeping the doc/code contract on `perfskills` would break TraceLens
prior auto-discovery (parent-of-`geak` resolution) and confuse the brand.

## Notes
- No upstream branch/tag was renamed; only in-repo naming/contract.
- Real historical example paths under `examples/**` and VCS-provenance mentions are left
  untouched intentionally.

## Cross-repo dependency
Pairs with the Hyperloom `fix/perfskills_to_geak` PR.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `412f90c457f9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.