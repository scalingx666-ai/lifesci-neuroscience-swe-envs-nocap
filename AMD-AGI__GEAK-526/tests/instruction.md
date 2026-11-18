# Issue

**Title:** fix(e2e_workflow): remove the dynamic imports that refuse the script at launch

## Description

## The bug

PR #520 added four `await import(...)` calls to `e2e_workflow/e2e_workflow.js`. The native Claude Code `Workflow` runtime — the default path through `interface/run_e2e.py` — rejects a dynamic import **statically**, before any code runs:

```
SyntaxError: import() is not available in workflow scripts.
```

The whole script is refused. Not one line executes, on any phase, for any workload — including plain fixed-ISL/OSL runs that never reach AgentX.

Probed directly against that runtime: its entire global surface is the JS built-ins plus `agent/parallel/pipeline/phase/log/workflow/args/budget/console/setTimeout`. No `process`, no `require`, no filesystem.

| | `process` | `require` | `import()` |
|---|---|---|---|
| Native `Workflow` tool (default) | no | no | **refused at launch** |
| `interface/runtime/engine/run_workflow.mjs` | yes | no | yes |

#520 was validated on the standalone Node runtime, where `import()` works. CI stayed green because `node --check` and the AsyncFunction parser added by #523 both accept it — the restriction is the host's, not JavaScript's.

## What changes

**The AgentX envelope travels in the reply.** The extractor already runs `agentx_kernel_preparation.mjs` to pack, and `packStandaloneTasks` already computed the envelope internally (refusing the packing outright if any completed task has invalid evidence). `--emit-prepared` just stops throwing it away. No new agent; the gate still runs inside that same CLI invocation.

**`reusePreparedUT` becomes pure JS** over the validated `RETURN.json` carried in `prepared_ut.result`. *Known limit, accepted:* a task dir mutated between packing and dispatch is no longer detected — detecting it means re-hashing `kernel_src`, and the script has no filesystem.

**Because the envelope now arrives through an agent**, "the packer validated it" is a claim about a file we cannot open. `preparedUtDefect()` re-asserts every invariant the old on-disk reader re-derived that needs no filesystem — `task_dir`, phase-appropriate `smoke == 'pass'`, frozen baseline, `pct_gpu_time` in `[0,100]`, `op_kind` self-consistency — at intake and again at dispatch. A bad candidate **throws**, arming the existing `repair_delivery` retry, rather than silently shortening the queue into a run that looks like it had no work to do.

**`hydrateExtractionVerdicts` moves** to `kernel_extraction_delivery.mjs`, which already imports `fs`/`path`/`crypto`. The workflow keeps a fail-closed pure guard that refuses an unresolved `selection_validation_ref` instead of reading it as an inline PASS.

**`resolveServingEp()` drops its unguarded `require('child_process')`.** This predates #520 (`ef948a02`): `require` is undefined on *both* runtimes, so any direct invocation passing `initial_extra_server_args` / `initial_extra_env` / `launch_recipe` died at module scope with `require is not defined`. `run_e2e.py:701` always sends `args.ep`, so dispatched runs are unaffected; a direct caller now gets an error naming the knob. Guessing `1` would be worse — `ep` addresses the KB page beside `tp`.

**Retired the now-uncallable `reusePreparedUT` export** from `agentx_kernel_preparation.mjs`, and repointed the tests that exercised it at `readPreparedKernels` — the gate that actually runs. Green tests for code no shipped path calls are false confidence about exactly the guarantee this PR trades away.

## Regression guards

No parser catches this class of breakage, so both guards are source-level:

- **`test_llm_ledger.py`** — the three workflow JS files must contain no `import(`; `require(` sites are pinned to the existing five so the set cannot grow. Verified in both directions: pasting an import back in turns it red.
- **`conformance.mjs` `A-forbidden`** already knew `require(` was native-forbidden but not `import(`. Added it, and moved the check *ahead* of string stripping — the greedy template-literal pass swallows a real ``await import(`...`)`` whole, which is how four of them went unreported. Confirmed it now flags the #520 tree.

## Verification

- **The actual bug**: the workflow launches on the native runtime and reaches its own `args.workflow_dir is required` guard (line 83, before any side effect) instead of being refused.
- Full `node-regression` job green: 18 `.js` + 3 `.mjs` suites.
- `test_llm_ledger.py` 113 tests pass; `interface/test_run_e2e_dispatch` 235 tests pass.
- `interface/runtime/engine/selftest.mjs` 108 checks pass — this includes running the whole workflow on the standalone runtime, so both runtimes are covered.

**No GPU or e2e run was performed.** This is a CPU-side fix: it establishes launchability and contract parity, not a performance result.

## Also

`.github/workflows/ci-l0-checks.yml:302` is a multi-line `run: |` without `set -e` (unlike its sibling at :311), so only the last command's exit code was the step's verdict. Added.

## Reported, not fixed

Five `require('child_process')` sites remain at `e2e_workflow.js:197, 955, 2694, 3572, 6279`. All are inside `try/catch`, so they degrade rather than crash — but they degrade **silently**, and `require` is undefined on both runtimes, so each is a feature that quietly does nothing: the live execution tracker, the measured-shape probe, capture reclaim before re-extraction and at Finalize, and the AgentX declaration-took-effect gate. The comment at :955 ("Same execFileSync/python3 route the Setup probe uses") shows these were believed to work. Pinned by the new guard so the set cannot grow; each needs either a real transport or an explicit "unavailable in this runtime" log. Worth its own issue.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `02bfbb0b7274`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.