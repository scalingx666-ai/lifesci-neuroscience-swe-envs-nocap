# Issue

**Title:** fix(rag): make RAG provisioning best-effort, don't abort the run

## Description

Addresses **one of the four** failure modes in #316 (the `rag-mcp` env crash).

## Problem
When `tools.rag=true` but `rag-mcp` cannot be installed/imported or the semantic index cannot be built (offline node, pip failure), `mini.py` raised `RuntimeError` and **killed the whole kernel-optimization run**. On the GLM-4.7-FP8 sglang fleet run, every GEAK attempt died right after:
```
rag-mcp package not found, installing automatically...
```
i.e. an environment hiccup wasted the entire kernel attempt (all 8 GEAK kernels REVERT, E2E 0%).

## Fix
Make RAG **best-effort**: wrap the provisioning in try/except — on any failure, log a warning, disable the RAG `query`/`optimize` tools, and continue the optimization run without retrieval. RAG-enabled success path is unchanged.

(The large deletion count is just re-indentation from wrapping the existing block in try/except.)

## Scope / not covered
The other three #316 modes remain open and are larger (GEAK-internal): `.cu`/CK `preprocess_failed`, harness-gen "no `@perftest/@benchmark` decorators" on sglang kernels, and `exit 124` timeouts. GLM specifically also needs the `.cu` preprocess fix to actually produce wins.

## Validation
ruff lint + format clean; syntax verified. End-to-end verification needs a live GEAK run (tracked with the broader #316 work).

.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e88cf911dbdf`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.