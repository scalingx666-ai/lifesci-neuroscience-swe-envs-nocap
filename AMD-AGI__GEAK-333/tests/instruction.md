# Issue

**Title:** [GEAK v4] e2e report: reconcile headline with Director + backend-provenance timeline

## Description

## Description
  - **Fix:** `final_report.md` / `architect_report.md` quoted the **Finalize-bundle** bench, not the authoritative `director_e2e_validation.json`, so report and Director disagreed on **throughput / speedup / TTFT / TPOT** (e.g. report `640.4 → 709.0` vs Director `621.365 → 698.373`). Generic (no model/kernel/backend hardcode).
  - **Root cause:** phase ordering — `Report` runs BEFORE `Validate`, but `system_architect.md` already mandates quoting the Director's same-session numbers, which don't exist yet at report time → Architect falls back to the finalize bench.
  - **Also:** the `accepted` verdict misled on no-win runs (`0.9997×` read as success), and a rejected/regressed integrate node was drawn with the win star `⭐`.
- 

  ## Changes
  - `e2e_workflow.js` — Director `validate` agent now gets the report paths (`ARCHITECT_REPORT`, `FINAL_REPORT`) to reconcile. No phase reorder.
  - `roles/director.md` — new `validate` **step 7**: after writing `director_e2e_validation.json`, overwrite only the report headline (throughput/speedup/TTFT/TPOT/status/parity) with the Director numbers; self-check consistency. Verdict vocabulary `accepted` → **`validated_win | validated_no_win | flagged`**.
  - `roles/system_architect.md` — headline written **provisionally** from the finalize bench (tagged), reconciled by the Director; **timeline records each kernel's stock backend + one node per backend attempted/`⊘`-skipped**; emoji reflects the gate (`❌` for rejected/regressed, `⭐` only for a banked win, `parity ✓` numeric-only).
  - Add `docs/pr-report-director-reconcile.md`.

  ## Impact
  - Report headline is now guaranteed identical to `director_e2e_validation.json`; a no-win run can no longer read as a success. No new knobs; no code branches on the status literal (safe). Backward-compatible (finalize fallback kept + annotated when the Director has no number).

  ## Testing
  - **Before (bug):** report and Director disagreed — `final_report.md` `640.4 → 709.0` vs `director_e2e_validation.json` `621.365 → 698.373`.
  - **After:** on a fresh e2e run the two sources agree — the `final_report.md` headline (throughput / speedup / TTFT / TPOT) is reconciled to and identical with `director_e2e_validation.json`; no more report-vs-director drift.

  Reproduce:
  ```
  Workflow({
    scriptPath: "<GEAK>/e2e_workflow/e2e_workflow.js",
    args: {
      model_path: "/data/.../model/openai/gpt-oss-120b",
      workflow_dir: "<GEAK>/e2e_workflow",
      backend: "vllm", tp: 1, gpu_ids: "0,1,2,3",
      isl: 1024, osl: 1024, conc: 64,
      exp_root: "/data/.../exp/gpt-oss_fix_num_order"
    }
  })
  // verify the fix: final_report.md headline == director_e2e_validation.json (throughput/speedup/TTFT/TPOT all identical).
  ```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b0bf8f8c00d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.