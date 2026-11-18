# Issue

**Title:** rf: Transition to nipost.collect_derivatives

## Description

This PR has been rebased on #586, and so we should be exercising all precomputed paths. It:

* Pins nipreps/nipost#1, and adjusts data retrieval code.
* Updates tests to pin nipost behavior that diverged from the smriprep collector's behavior. In particular, dropping groups of files like TPMs if all weren't present. This was added as an `xfail` in #586 and now passes. By moving completeness checks into the collector, the workflow-generating logic is simplified.
* Adds logging to precomputed derivatives. At INFO level, the full list of derivatives to be reused is reported at the beginning of `init_anat_fit_wf()`. At DEBUG level, overrides are logged while merging multiple derivatives. Combined, these give full transparency into the override behavior.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `10d70eed1cb1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.