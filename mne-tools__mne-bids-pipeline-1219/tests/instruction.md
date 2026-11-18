# Issue

**Title:** ENH: Speed up sidecar searches

## Description

Just a few more speed tweaks

1. Avoid `inspect.stack()`, it's expensive. Use `currentframe().f_back` instead
2. Pin to MNE-BIDS version that has `find_matching_sidecar` (3+ years old, should be fine)
3. Cache `find_matching_sidecar`
4. We don't need to `deepcopy` our `kwargs`, that's from old code (we only modify if we actually call the underlying func, which we won't do at this level of code as we know it's in the call cache)

With this PR we're down to < 30s, which is nice since we were ~90s last week before optimizations!

After this PR, the vast majority of time is now spent in `joblib` caching of function code etc. There is perhaps some way to speed this up, too, since we know that in a given `mne_bids_pipeline` invocation this code will not change... but that's probably for another day :smile: 

| main | PR |
| -- | -- |
| <img width="963" height="1029" alt="image" src="https://github.com/user-attachments/assets/f91faf3e-f1c7-4f18-a079-5424826ce7b0" /> | <img width="963" height="1029" alt="image" src="https://github.com/user-attachments/assets/150392ab-600f-4a90-b547-ace08ada143f" /> |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `26f8cbe56440`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.