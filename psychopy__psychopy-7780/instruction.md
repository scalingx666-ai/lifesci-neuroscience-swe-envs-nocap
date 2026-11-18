# Issue

**Title:** Potential fix for code scanning alert no. 17: Incomplete URL substring sanitization

## Description

Potential fix for [https://github.com/psychopy/psychopy/security/code-scanning/17](https://github.com/psychopy/psychopy/security/code-scanning/17)

The best fix is to replace substring matching with structured host validation:

- For URL-like remotes (`scheme://...`), parse with `urllib.parse.urlparse(url)` and compare `parsed.hostname` exactly to `gitlab.pavlovia.org`.
- For SCP-like Git remotes (`git@host:path`), parse with a strict regex and compare extracted `host` exactly.
- Only if host matches should we extract the path part and derive `namespaceName`.
- Keep existing behavior (support both HTTPS and SSH-like forms, remove `.git`, split namespace/project) while rejecting malformed or lookalike hosts.

In `psychopy/projects/pavlovia.py`, update the block around lines 1636–1647:
1. Add `from urllib.parse import urlparse` to imports.
2. Replace the `"gitlab.pavlovia.org" in url` + `split(...)` logic with robust parsing:
   - Determine `namespaceName` from parsed path after verified host.
   - Continue existing normalization (`lstrip('/:')`, remove `.git`, split once).
   - Skip invalid/unmatched URLs safely (`continue`).

_Suggested fixes powered by Copilot Autofix. Review carefully before merging._

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9141776a428a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.