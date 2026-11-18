# Issue

**Title:** FIX: Fetch templates during workflow construction

## Description

This addresses  a few changes were necessary:

- Fetch templates during workflow creation - without this, I was still observing race conditions causing the T1w/brain mask files to be empty (not yet gotten through `templateflow.api.get()`)
- Add `sloppy` parameter to `init_template_iterator_wf`, since the T1w/brain mask's resolution (used in [`SpatialNormalization`](https://github.com/nipreps/niworkflows/blob/6edfb38f1aa6c706c8a4942ebadd9041738978b9/niworkflows/interfaces/norm.py#L130)) depends on this parameter as well.

I stripped out most of the logic in `TemplateFlowSelect` to avoid duplicating the behavior, since it is essentially linked.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b6d38d66caa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.