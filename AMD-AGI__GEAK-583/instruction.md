# Issue

**Title:** fix(overlay_setup, seam_trace): overlay edits compound and roll back; seam markers survive torch.compile

## Description

, , .

## Summary

One commit per issue; each issue has the log and a main-vs-branch repro. Rebased on main after #581, which fixed the trace-through half of #588 on its own; commit 3 now builds on its `_compile_probe`.

- **A second edit to a module builds on the first (#586).** Once the overlay has `_patched/<module>.py`, `add-module --patch` applies to that copy, and `--patched-file` is 3-way merged onto it with `git merge-file`, `--src-file` as the base (taken as is when `--src-file` is that copy). A clash, a missing `--src-file`, a `git merge-file` error or a missing git exits non-zero with its own message and leaves the copy unchanged. Only a copy the manifest lists counts as an earlier edit: one a failed attempt left behind is unlisted, so a retry starts over from its `--src-file`. With neither `--patch` nor `--patched-file`, `add-module` on a module the overlay already patches is refused, since it would change nothing. A first edit is unchanged.
  - `build_candidate_overlay` passes `baseline_overlay`'s copy as `--src-file`, so the isolated candidate is still `kernel_src/` verbatim.
  - `e2e_integrator.md`: the `candidate_bind` replay passes the `baseline_ref/<file>.orig` twin, and the replay and patch branches clear `$CAND/_patched` and its manifest first. A corrective re-measure reuses `$CAND` and would otherwise build on the rejected attempt. `$CAND` itself stays (`ref/` lives there). The `add-module` examples in `integrating_a_new_kernel.md` and `sglang_internals.md` clear it the same way.
  - The KB-overlay branch of `e2e_integrator.md` used `cp -r` of the tarball over `CURRENT_OVERLAY`, which replaced a `_patched/<module>.py` both carry. It now uses the checked `overlay_setup.py merge` that `e2e_workflow.js` already prescribes there; a conflict fails.
  - **Behaviour change:** the same `--patch` run twice now fails the second time (it would apply onto its own result), and re-adding a whole file needs `--src-file`; `test_re_adding_the_same_module_replaces_it_in_place` was updated for that.
- **A failed patch leaves the module as it was (#587).** `_try_apply` undoes a failed attempt on the target and removes patch's `.orig`/`.rej`. An attempt that exits 0 counts only if it changed the file, so a `git apply` that skipped it (run from inside a git work tree) is no longer a success. The error names why each attempt failed. The unused `cwd` parameter is gone.
- **seam_trace under torch.compile, and `from X import f` callers (#588).** Since #581 the marker forwards to the original while Dynamo traces, so a seam vLLM calls inside its compiled region leaves no span. The marker now records the passthrough with an attribute store on an entry made at install, which Dynamo replays after the compiled call; a dict store would put `update` in the transformed frame, and with CUDA graphs on, vLLM's bytecode hook refuses that frame at startup. The entries live in a defaultdict, because vLLM's compile cache can hand a run a frame compiled where other seams were marked. A trace opened or exported after that call names the seam `GEAK_COMPILED::<target>`, and kernel_selection lists it in `compiled_passthrough_candidates` (any process). A non-target candidate there left no span, so it can never show up as deeper: the selection fails with `candidate_compiled_unobservable` (`deepest_verified: false`), as the target's own case does with `capture_compiled_unobservable`. `install()` also repoints module attributes that are the original object, and logs them; one it cannot rebind is logged as NOT rebound and does not stop the install. A name that already holds another target's marker gets the function itself wrapped, so one call leaves one span.
  - `GEAK_COMPILED::` is written only into traces an eager marked call opened: a process whose seams all run under compile writes none.
  - The record lands when a compiled call returns. A deeper candidate compiled inside the target's eager call is recorded in that call's trace. A trace that opens and closes inside the first compiled call does not carry it: an eager seam reached from inside the compiled region (a custom op) more often than `GEAK_SELECTION_PROFILE_CALLS` can use up the budget before any record lands.
  - A frame from vLLM's compile cache reflects the markers of the run that compiled it (the cache key does not include them): a seam this run marked but that run did not is neither forwarded nor recorded. A capture run should compile fresh, with its own `VLLM_CACHE_ROOT`.
  - Only seam_trace's frame passes vLLM's check: capture_shapes' own compiled record (#555) is still a dict store, so on vLLM's classic compile path (e.g. compile cache disabled) with CUDA graphs, a capture whose target runs under compile is still refused at startup.
  - The `from X import f` rebinding has no real-run evidence yet; the repro in #588 is synthetic.

## Test plan

- New tests that fail on main: `test_overlay_setup.py` (two whole files merged, a clash, a missing `--src-file`, a patch on top of an earlier edit, a 2-hunk patch that half-applies, run outside and inside a git work tree, a `git merge-file` error and a missing git), `test_seam_trace_capture_guard.py` (a seam compiled through is named in the next trace, or in the open one at export; a `from X import f` copy is marked; one that cannot be rebound is reported; a failed compiled-seam record is reported), `test_kernel_selection.py` (a compiled non-target candidate fails the selection; a target also seen eagerly still passes).
- `test_seam_trace_compiled.py` (from #581) gains three real-torch tests: after warm-up (at most 2 graphs) 10 more calls compile nothing new, the bound `test_capture_shapes_compiled.py` sets, and the exported trace reads back through kernel_selection; no transformed frame names `update` (the vLLM check above); and an AOT-compiled frame still runs in a process that marked other seams. They are skipped without torch, fail on main, and pass with torch 2.11 and 2.13 (CPU): 99/99 across the four test files run with real torch.
- Also pinned, though main passes them: a function declared under two import paths leaves one span per call (main rebinds no alias), and a retry after a failed attempt starts over.
- `test_overlay_setup.py` also pins that `build_candidate_overlay` still takes `kernel_src/` verbatim when it re-tunes the overlay's own edit.
- Full local L0 (every step of `ci-l0-checks.yml`) matches main. On this machine three pytest cases also fail on main (environmental), gitleaks is not installed, and one node job needs node 20.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c881a4a78be3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.