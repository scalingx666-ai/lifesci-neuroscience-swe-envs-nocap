# Issue

**Title:** Rename space output to template and add new space output to template_iterator_wf

## Description

Related to  and 

Changes proposed:
- Modify `space` output in `init_template_iterator_wf` to be the space entity formatted as `<space>+<cohort>`.
- Add new `template` output to `init_template_iterator_wf` to track the space-only version of space (which is what the template entity should have).
- Remove `cohort` input to `init_ds_anat_volumes_wf`. This will change anatomical output files from `<source_entities>_space-<space>_cohort-<cohort>_...` to `<source_entities>_space-<space>+<cohort>_...`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `764867f3a548`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.