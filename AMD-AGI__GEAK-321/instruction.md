# Issue

**Title:** fix(run): bound RAG subprocesses + GEAK_DISABLE_RAG + ccache (follow-up to #319 — clears GEAK 7800s hang)

## Description

(merged) — that merge captured only the first commit (`GEAK_VERIFY_IN_LOOP`); this lands the second commit that was pushed afterward.

**Why it matters:** in the last 24h of CI, GEAK failed ~96% of attempts, dominated by `TimeoutExpired after 7800s` — the agent stalling on a blocking, raise-on-failure `pip install rag-mcp` + FAISS index build at startup, plus uncapped CK/.cu builds. This commit:
- makes RAG setup **bounded + graceful** (`GEAK_DISABLE_RAG` to skip; otherwise timeout-bounded install/index build that **disables RAG and continues** instead of hanging/raising);
- sets `MAX_JOBS` + routes the compiler through `ccache` (when present) so CK rebuilds are incremental.

All default-safe (`setdefault`; RAG degrades, never blocks). Without this, `release/v3.2.2` still hangs GEAK at startup.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `89091027b7fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.