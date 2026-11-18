# Issue

**Title:** bench_e2e cleanup group SIGTERM can terminate parent orchestrator PID 1

## Description

# fix(e2e): stop the bench teardown from ever signalling the caller's process tree (#397)

## Summary

A GEAK e2e benchmark teardown resolved the server's process group **at kill time** and group-TERMed
it. Once the server pid had exited and been recycled, that lookup answered with a stranger's group —
in the reported deployment, the caller's orchestrator running as container PID 1. The orchestrator
was TERMed, and the whole optimization task died.

`e2e_workflow/scripts/server_teardown.sh` fixed the kill
*decision*: process identity is frozen at launch, and a group kill requires `pgid == pid` as proof of
ownership. 

.

## Changes

### Contract — `e2e_workflow/scripts/server_teardown.sh`

- `_identity_still_matches()`: the `/proc` start-time gate, factored out and re-run **immediately
  before** each SIGKILL escalation on both the group and the pid path. Descendant escalation is now
  intersected with the process tree as it stands at that moment, so a child that was reaped (and
  possibly recycled) during the grace window is never SIGKILLed. The gate fails open only when start
  ticks were never readable, where the `pgid == pid` proof and the protected-pgid veto still stand.
- `_is_bench_ancestor()`: refuse to signal anything on the benchmark shell's parent chain, in any
  mode. A server we launched can never be one of our own ancestors.
- Validate `SERVER_STOP_GRACE_S`: a non-numeric value made `seq` fail, which collapsed the TERM→KILL
  grace window to zero waits.

### Staging — `e2e_workflow/scripts/bench_e2e.sh`, `e2e_workflow/roles/director.md`

- The contract is looked up beside the script, then under `SKILL_DIR` / `WORKFLOW_DIR`, and the run
  **exits 3** with an actionable message when it is absent. A benchmark that cannot stop what it
  starts must not start it. When the library is resolved from a fallback location, the run says so,
  because that copy is then not self-contained.
- `director.md` step 3 now stages `server_teardown.sh` alongside `bench_e2e.sh`.

### Caller protection — `interface/run_e2e.py`

- `_publish_protected_pgids()` publishes our pgid, our parent's pgid and `1` into
  `GEAK_PROTECTED_PGIDS`, merging any value the caller pre-exported and dropping non-numeric tokens.
  It is called before the `--dry-run` return, before the resume short-circuit and before
  `invoke_workflow`, so both the SDK and the CLI path inherit it. The change is purely additive: a
  group kill only ever happens for a server that leads its own session, which can never be one of
  these groups, so no legitimate teardown is downgraded.
- `PROCESS_SAFETY` is prepended to the driver agent's prompt — the same ban, in the same wording, as
  `e2e_workflow.js` applies to role agents, one level up, with the explicit note that freeing a GPU
  or unwedging a port is not an exception to it.

### Documentation — `e2e_workflow/roles/profiler.md`

- After the bench, stop **nothing**: state that the EXIT trap has already torn the server down
  through the contract, and give the correct launch-through-the-contract snippet for the case where
  the role launches a long-lived server itself.

## Tests

**`e2e_workflow/scripts/tests/test_server_teardown.py` — 12 → 18 tests**

- The fake-`ps` fixture is fixed (`${@: -1}`), plus a guard test that asserts per-pid resolution
  directly, so this class of vacuous pass cannot recur. This also makes three pre-existing
  group-kill tests meaningful for the first time.
- A pid reused during the grace window is not SIGKILLed, on the group path and on the pid path.
- With identity intact, a TERM-ignoring server **is** still escalated — the new guard must not
  disarm normal reaping.
- An ancestor of the benchmark shell receives no signal at all.
- A non-numeric `SERVER_STOP_GRACE_S` still yields a real grace window.

**`e2e_workflow/scripts/tests/test_bench_e2e_teardown_lookup.py` — new file, 4 tests**

The gate precedes the serving-GPU lock and every launch, so these tests need neither a GPU nor a
model, and run in about 0.3 s behind a stub adapter:

- a missing contract yields `rc == 3` with the remedy in stderr;
- the director-staged layout passes the gate and reaches the launch;
- the `SKILL_DIR` fallback works and announces itself;
- `SKILL_DIR=""` does not degrade the candidate to an absolute `/scripts/server_teardown.sh`.

**`interface/test_run_e2e_dispatch.py` — 114 → 119 tests**

- `_publish_protected_pgids()`: published content, merge-and-drop-garbage, idempotence.
- The call-site ordering is pinned through `--dry-run`: the veto must be in the environment even on
  the path that returns before invoking anything.
- The driver prompt starts with `## PROCESS SAFETY` and names the banned patterns.

**`.github/workflows/ci-l0-checks.yml`**

- Both shell-facing suites are added to the explicit pytest whitelist.
- A new **blocking** `bash -n` step covers every `*.sh` under `e2e_workflow/scripts` and
  `kernel_workflow/scripts`. The repository had no shell static check at all — `codeql.yml` notes
  that CodeQL has no shell support — so the kill contract was executed by no CI job.

**Results:** the full L0 whitelist passes: `1010 passed, 2 skipped`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8e86e2ee7426`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.