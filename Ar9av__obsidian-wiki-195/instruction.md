# Issue

**Title:** Vault state management: manifest write safety, lifecycle transitions, and equilibrium mode

## Description

Applies game-theory and state-management framing to the vault, and in doing so fixes a real data-loss bug.

## The bug this found

`.manifest.json` was a plain read-modify-write with no mutual exclusion. Any two overlapping writers lost an entry silently — the second reader's snapshot predated the first writer's write. Reproduced with 12 concurrent `update_source` processes against one vault:

```
before:  entries recorded: 6 of 12
after:   entries recorded: 12 of 12
```

Roughly 50% data loss at 12-way contention, with no error surfaced. This fires in three real configurations: `batch-plan` fan-out dispatching parallel ingest subagents, the Dockerized server writing a vault a local skill is also using, and a scheduled `daily-update` overlapping an interactive session.

Writes now take an advisory lockfile (`O_CREAT|O_EXCL`, not `fcntl`, so Windows still works) and replace the manifest atomically via temp file plus `os.replace`. Hashing stays outside the lock — it can take seconds on a large source tree and nothing in the manifest depends on it.

## Lifecycle transitions as a state machine

The `lifecycle` field was a state machine with nothing enforcing its edges. Ledger entries now record the lifecycle at review time, giving lint a baseline.

Only edges illegal for *every* possible sequence of unobserved intermediate states are flagged: falling back to `draft`, and exiting the terminal `archived`. `draft → verified` is deliberately **not** flagged — ledger snapshots are sparse, so a legitimate intermediate `reviewed` may simply never have been recorded, and flagging it would fire on valid history.

## Equilibrium mode

The maintenance skills each optimize one shared vault for a different objective, so any can undo another's work — no single skill reporting clean means maintenance is done. Equilibrium mode runs every audit in report-only form and reports whether any skill still has a pending change; the vault is converged only when all propose nothing.

It also detects oscillation via a snapshot in `_insights.md` beside the existing `GRAPH_SNAPSHOT`: a skill whose pending count keeps returning after being driven to zero is being reversed by another, and the vault can never settle. Reported, never auto-fixed — resolving it is a decision about whose objective wins. Pending moves are attributed back to their manifest source, so a source that repeatedly produces pages needing repair surfaces as a suggestion to review its `source_quality`. Report-only; the owner still decides through the existing trust flow.

Skill-only, no Python — lint already emits JSON counts and the other three audits are LLM passes.

## Backward compatibility

Additive throughout. No page frontmatter changed, so the OKF round-trip is untouched. Ledger entries predating the `lifecycle` field carry no baseline and are skipped, so existing vaults behave identically until their next `trust-record`. Owner-extended lifecycle states never match the illegal pairs, so the check degrades to a no-op. The new check warns by default and fails only under `--strict-trust`, matching how the surrounding trust checks were already staged.

## Testing

- Full suite green on macOS (667 passed) and Linux/Ubuntu 24.04, Python 3.12 (668 passed, 0 errors). The 9 local `test_server.py` errors are pre-existing, from the optional `mcp` extra not being installed; they fail identically on `main`.
- The 12-way contention test spawns real subprocesses — a single-process test cannot observe this race. Verified against both pre-fix and post-fix code on Linux.
- Lint against a real 175-page vault reports `illegal_lifecycle_transitions: 0` — correctly silent on a vault with no ledger.
- `README_TW.md` still in sync.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8a7f6af8104a`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.