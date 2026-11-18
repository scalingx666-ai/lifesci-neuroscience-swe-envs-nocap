# Issue

**Title:** Fix the precedence in ranged Vector.mean

## Description

`Vector.mean(start, end)` evaluates `sum / end - start + 1` instead of `sum / (end - start + 1)`. For `h.Vector([1, 2, 3, 4, 5])`, master `408cc54` and the 8.2.7 and 9.0.2 wheels return 4.75 for `mean(0, 4)` instead of 3, and 2 for `mean(2, 4)` instead of 4.

This parenthesizes the inclusive element count. The added checks in `test/pytest_coreneuron/test_vector_api.py` use its existing `[3, 3, 2, 1, 5]` vector: `mean(0, 4) == 2.8` and `mean(2, 4)` close to `8/3`. The existing `mean(1, 3)` check passes before the fix because `6/3 - 1 + 1` and `6/3` both give 2. Singleton ranges still raise an error; changing that is separate from this fix.

I validated `c4b35cf5c` against `3c1bbe9a3` on Ubuntu 24.04.5 LTS with GCC 13.3.0 and Python 3.12.15, with CoreNEURON, MPI and RX3D enabled and InterViews disabled: the build, the changed pytest file (1 passed), the full CTest run (539/539) and Black passed. With the production code at `3c1bbe9a3` and the new checks kept, pytest fails with `AssertionError` at line 80, the `mean(0, 4)` assertion.

Prepared with AI assistance (Claude Code and OpenAI Codex).

🤖 Generated with [Claude Code](https://claude.com/claude-code)

https://claude.ai/code/session_01JfvcPZyKcKQUG9fQGYfRMw

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `11b0f51c3775`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.