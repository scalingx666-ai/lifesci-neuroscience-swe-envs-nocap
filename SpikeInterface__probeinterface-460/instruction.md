# Issue

**Title:** Set the version on main to 0.4.0

## Description

Main declares `version = "0.3.2"`, the same as the published release, so
`pip install git+https://github.com/SpikeInterface/probeinterface@main` is a silent no-op for anyone
who already has 0.3.2 and exits 0 without installing anything. This broke neuroconv's daily
development job, which failed with `AttributeError` on `has_spikegadgets_neuropixels_probes` while
its own `pip list` printed `probeinterface 0.3.2`, so it was testing the release and reporting an
upstream API mismatch that does not exist (see catalystneuro/neuroconv#1828 "Fix the daily dev
workflows", which works around this with `--force-reinstall --no-deps`). 

This is the "after release" bump that normally follows a
tag and was missed after 0.3.2. I used 0.4.0 because PR #454 "Prepare release 0.4.0" already carries
that number and makes the identical edit, so the two do not conflict.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `580abca5abe1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.