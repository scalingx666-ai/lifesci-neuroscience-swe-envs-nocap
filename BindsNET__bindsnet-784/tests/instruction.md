# Issue

**Title:** deps: upgrade all dependencies (closes 12 Dependabot alerts) + add SECURITY.md

## Description

Two things, both wanted on master.

## 1. SECURITY.md (commit fe320fd)

Adds a security policy: how to report privately, which versions are supported, what repository-integrity controls are now in place, and a pointer to #781.

## 2. Dependency upgrade (commit 77fe156)

Closes all 12 open Dependabot security alerts (7 high, 3 moderate, 2 low).

| Package | Was | Now | Alerts closed |
|---|---|---|---|
| gitpython | 3.1.57 | 3.1.61 | 6 (5 high, 1 moderate) |
| tornado | 6.5.7 | 6.5.8 | 3 (1 high, 1 moderate, 1 low) |
| mistune | 3.3.0 | 3.3.4 | 1 (high) |
| setuptools | 81.0.0 | 84.0.0 | 1 (moderate) |
| torch | 2.11.0 | 2.14.0 | 1 (low) |

The rest of `poetry.lock` is a full re-resolve to current versions.

### Why the gitpython alerts were still open

PR #779 claimed to bump gitpython to 3.1.58 and was merged on 2026-08-31. It did not. That branch had been force-pushed to the malicious commit `9cb1eab5`, so merging it delivered malware instead of the dependency fix. .

### Breaking: the CUDA wheel index moves from cu128 to cu130

The cu128 index stops at torch 2.11.0, the vulnerable version, so this alert cannot be fixed without changing the index.

Verified on an RTX 2070 (Turing, sm_75):

```
torch 2.14.0+cu130, cuda build 13.0, cuda available True
arch list ['sm_75', 'sm_80', 'sm_86', 'sm_90', 'sm_100', 'sm_120']
matmul on GPU OK
```

Turing and newer are fine. **Pascal (GTX 10-series) and Volta (V100) are not in the arch list and lose GPU support.** This is a deliberate, accepted trade-off.

### Breaking: torchaudio is removed

Its newest release anywhere is 2.11.0 and it pins `torch==2.11.0`, so it blocks every torch upgrade. Nothing in BindsNET imports it (`grep -rn torchaudio --include='*.py' .` returns no matches), so it was a declared dependency that was never used. Removing it also cuts install size.

## Testing

Full suite on Python 3.11 against torch 2.14.0+cu130, numpy 2.4.6, pandas 3.0.5, scipy 1.17.1, numba 0.67.0, matplotlib 3.11.1:

```
83 passed, 3 warnings in 11.33s
```

The three warnings are pre-existing or come from dependencies, not BindsNET.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71b8d29bd179`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.