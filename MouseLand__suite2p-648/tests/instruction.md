# Issue

**Title:** fix case when neuropil_ipix not assigned

## Description

Follow up to  as disabling the neuropil_extract flag causes suite2p to fail.

This line triggers an exception since the variable is not defined: https://github.com/MouseLand/suite2p/blob/4b6c3a95b53e5581dbab1feb26d67878db866068/suite2p/extraction/extract.py#L99

If I naively add `neuropil_ipix = None` to line 66, we make it a bit further and error out on https://github.com/MouseLand/suite2p/blob/4b6c3a95b53e5581dbab1feb26d67878db866068/suite2p/extraction/extract.py#L179.

So I added `if not neuropil_masks is None:` the line above and this resolves.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eca2c68e9925`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.