# Issue

**Title:** bug fix for waveform metrics and quality metrics

## Description

for waveform metrics:

-  support manual curation: after manual curation, template_idx is not equal to cluster_idx, so we need to check from spike_templates to see the lastest rematched template_idx

for quality metrics:
- fix a bug in calculating presense ratio. remove one edge so that we have equal number of bins and edges, the max will be 1 (not 0.99 as before)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6210caab231f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.