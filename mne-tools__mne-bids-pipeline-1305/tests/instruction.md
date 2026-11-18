# Issue

**Title:** Speed up caching and reruns

## Description

I noticed reruns could still be a bit slow, so let's:

1. Remove some unneeded I/O and use faster I/O when possible for JSON
2. Nest some heavy imports so they're only used if the step actually runs
3. Use the `webp-lossy` from  to reduce runtime and HTML size
4. Take care of a TODO comment about not repeating filters for CSP (speeds up that step a lot)

I'll check to make sure things still look okay in the rendered docs. Changes drafted by Claude Fable 5 and reviewed by me.

This one is a pretty simple CI speedup so should be safe enough for self-merge when green

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `94b228b18272`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.