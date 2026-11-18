# Issue

**Title:** Update EGI NetStation demos for current plugin

## Description

## Summary

- remove the obsolete per-Routine `resync()` call from the Builder EGI demo
- replace the Python 2-era `egi.simple` Coder demo with `psychopy-egi-pynetstation`
- demonstrate flip-synchronized asynchronous markers and safe cleanup
- document the plugin dependency and automatic background drift sampling

## Validation

- parsed `stroop.psyexp` as XML and verified no `resync()` call remains
- compiled `egi_netstation.py` with Python 3.9
- checked the example keywords and method calls against the released `EGINetStation` wrapper API
- ran `git diff --check`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `051482ac61d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.