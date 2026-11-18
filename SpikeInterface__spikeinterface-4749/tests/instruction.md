# Issue

**Title:** Run the kwargs backward compatibility hook regardless of the saved version

## Description

@ecobost found in #4629 that a recording saved before `load_sync_channel` was dropped still fails to load, as `_handle_kwargs_backward_compatibility` only runs when the saved version differs in major or minor:


> is_old_version can be False (because it only checks for major&minor version so for instance if you saved something with 0.104.x and reload it with 0.104.x but the new neo, then the backward compatibility check won't happen)

I thought about improving the version check to also consider the patch number but that seems unnecessary. I think it is better to remove the version check entirely. If an extractor has tooling to reload old kwargs let it operate regardless. This removes some machinery and improves the functionality.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32bcb0dca9f2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.