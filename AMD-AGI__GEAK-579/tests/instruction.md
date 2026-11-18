# Issue

**Title:** fix(kernel): make author-lane results reproducible

## Description

, .

Each issue has the run log and a main-vs-this-branch repro. One commit per issue. Rebased on main.

- **An author lane's `final_patch.diff` applies to the original task** (#598). The Director's root commit is now the task as extracted, and `kernel_src/` is emptied in a second commit, so HEAD is still the empty seed. Seen in both gfx1151 author runs (11-10, 11-11); each Director moved the seed aside by hand before it could validate.
- **The Director's note is cut from `kernel_name`** (#600). The name is cut at the first whitespace, `(` or `;`, before `_task` is dropped. The Director has added such a note in four answers across three runs (11-10, 11-12 twice, 11-16), and two `kb_artifacts` slugs on our box carry one (e.g. `gemm_decode_gate_up_n8_K1024_N6144-triton-author-mode-task-dir-basename-h0_task`), so a lookup by the kernel's name does not find them.

None of these is RDNA-specific; the runs that showed them were on gfx1151.

## Test plan

- These new test cases fail on main and pass here:
  - `test_workspace_sources.py`: root..HEAD applies to a fresh copy of the task. The existing author-setup test now runs the whole setup block.
  - `test_rdna4_policy.js`: an annotated `kernel_name`. This file holds the only stubbed-lane harness.
- The prompts the workflow JS renders for 72 stubbed GPU-identity scenarios are the same as on main. I checked this with a local stub-render script that is not in the repo.
- Full local L0 (every step of `ci-l0-checks.yml`) gives the same results as main. Pytest: 4215 passed here, 4214 on main (the new Python test). The three pytest failures also fail on main on this machine (environmental), gitleaks is not installed here, and one node job needs node 20.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a86bbc90f2ed`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.