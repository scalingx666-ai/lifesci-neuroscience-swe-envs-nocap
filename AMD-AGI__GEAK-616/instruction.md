# Issue

**Title:** Geak/feat/mega resume fixes

## Description

# mode=mega: fix resume and final delivery

   . Five fixes in `perf_knowledge/expert_skills/expert_workflows/mega_fusion/`, found by
   running the merged workflow on 8× MI355X: a generic (no Expert Skill) run resumed for its final re-test,
   and a MegaMoE Expert Skill run resumed after a stop. Nothing outside `mega_fusion/` changes.

   ## What was broken

   | # | Symptom | Cause |
   |---|---|---|
   | 1 | A resumed run restored 0 candidates, and its STATE write then erased all of them | The candidate registry came back only through the `director` setup reply. After 18 rounds it is about 120 KB and did not fit, so the reply left it out. Another reply kept the rows but dropped their score evidence, so no row passed selection. |
   | 2 | A resumed Expert Skill run was refused | One registry row was 62 KB, mostly structural contract failure messages stored twice. |
   | 3 | A finalist passed the strict re-test, then failed delivery | `final_patch.diff` was a text diff. The candidate tree tracked two rocprofv3 binary dumps, so the patch did not apply. |
   | 4 | Finalists passed the strict re-test and were rejected by the selection verdict | The `director` returned the candidate's own tree as `selected_tree`; the role never said which path to return. |
   | 5 | Same as 4 | The selection reply left out `attempt_id`/`path_marker`, wrote `artifact_distinct: "true"` for `"yes"`, and named replay rows by capacity. The verdict also required `arrival_jitter: true` on every replay, but only the Expert Skill runtime injects jitter; the generic graph contract has none. |

   ## Changes

   1. **Resume reads the registry from `STATE.json`.** On resume the workflow reads `candidate_registry`
      from `STATE.json` in chunks of at most 12 KB (`tools/state_chunks.py`). It reads `insights` and
      `ledger` the same way when the setup reply leaves them out. The `director`'s rows are laid over the
      STATE rows by id, so lane-manifest updates and new rows still apply. A failed read refuses the resume
      before any GPU work. Runs that do not resume are unchanged.
   2. **Registry rows are read compactly.** Rows are read without free-text `notes`. Each contract failure
      keeps its id, category, severity and tier but not its messages; the next structural check writes the
      messages again.
   3. **The final patch is a binary diff.** `tech_lead` writes `final_patch.diff` with `--binary`. A new
      candidate lane excludes `.rocprofv3/` and drops it from the index before its base commit.
   4. **`selected_tree` is named.** `director` select_mega returns `SELECTED_WORKSPACE` as `selected_tree`.
   5. **Selection reply formats are stated, and jitter is required only where it exists.**
      `MEGA_SELECTION_SCHEMA` requires the fields the verdict reads and lists their accepted values. Replay
      rows are one per target and regression guard, named as given. `arrival_jitter` is required only when
      the Expert Skill runtime is the graph contract.

   ## Validation

   - Package tests: 54 JS and 273 Python pass, including the new `tests/test_state_chunks.py`.
   - Generic run, 64 tokens/rank, resumed for its final re-test with budget 0. The finalist was delivered:

   | Guard | Speedup vs frozen baseline | Floor |
   |---|---|---|
   | 64_uniform_mtpr64 (target) | 1.093× (8/8 pairs faster) | > 1.0 |
   | 64_rank-mixed-skew_mtpr64 | 1.097× | ≥ 0.98 |
   | 8192_uniform (declared fallback path) | 1.000× | ≥ 0.98 |

   2 launches vs 4, relL2 ≤ 0.074, 256 graph replays per guard, and `final_patch.diff` applies to the
   frozen tree.
   - MegaMoE Expert Skill run, 8192 tokens/rank, launched with `expert_skill_id` only. It stopped once on a
   verify timeout and resumed with fix 1 and fix 2. Its scored candidates are at 1.136× with 2 launches
   and within the Skill's resource envelopes. The final re-test has not run yet.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4940d01dc01d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.