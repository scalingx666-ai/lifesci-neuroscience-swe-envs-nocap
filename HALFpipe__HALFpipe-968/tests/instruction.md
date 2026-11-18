# Issue

**Title:** Add LSF cluster submission support

## Description

## Summary

Adds support for generating LSF cluster submission scripts alongside the existing Slurm, Torque/PBS, and SGE scripts.

## Changes

* Add an LSF submission template using `#BSUB` directives
* Add LSF job array support using `LSB_JOBINDEX`
* Request CPUs and total job memory using LSF resource syntax
* Ensure all requested CPUs are allocated on a single host
* Add `submit.lsf.sh` to the cluster script generation tests

## Notes

The LSF template uses:

* `-J "halfpipe[1-N]"` for job arrays
* `LSB_JOBINDEX` for the current array index
* `span[hosts=1]` to keep the requested CPUs on one host
* `rusage[mem=.../job]` so the existing `mem_mb` value continues to represent total memory for the job

Site-specific options such as queue or project/account selection are intentionally not included, since these vary between LSF installations.

Supersedes #964 with the same changes on a branch in the main repository so CI can access repository secrets.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5fc73a265b2a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.