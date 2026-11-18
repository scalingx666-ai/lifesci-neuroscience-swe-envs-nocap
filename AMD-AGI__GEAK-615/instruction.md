# Issue

**Title:** fix(vllm): Trace-replay Validate: a deadline, recovery from its finished legs, and real verification for vLLM probes

## Description

## Summary

An AgentX trace replay on vLLM (Kimi-K3.1 at c4, speculative decoding with InferenceX's golden
acceptance) ran from Setup through Validate and hit three gaps. None of them changed that run's
verdict (no gain), but each costs hours, and the third one would demote a real win.

- **Correctness probes ran under simulated acceptance.** InferenceX's vLLM recipes simulate
  acceptance inside `--speculative-config` (`"rejection_sample_method":"synthetic"` plus
  `synthetic_acceptance_length`). GEAK's guard only knows SGLang's form, the `SGLANG_SIMULATE_ACC*`
  variables, so it found nothing. The gsm8k probes served draft tokens nothing verified and scored 0
  on both sides. The agents spent 2 h 18 min working that out and rerunning on corrected servers.
- **Validate had no deadline.** The final reserve holds one pair of canonical-window legs, and the
  Director is never told how much time is left. After the planned pair and the gsm8k probes it
  started a reverse-order pair that needed about 2.5 hours, with 81 minutes left. The run was killed
  before the Director returned.
- **Recovery ignored the finished legs.** With no Director verdict, `run_e2e.py` salvaged the
  15-minute Integrate A/B, although `validation/base` and `validation/final` had both finished their
  1-hour legs. A real win would have been reported from a search-window number and marked provisional.

## Change

**vLLM correctness probes.** `run_e2e.py` reads the seed's last `--speculative-config`, in each form a
seed arrives in: raw (the adapter word-splits it), `=`, or shell-quoted (a schema-v2 seed is
`shlex.join`-ed). When that config simulates acceptance, the workflow gets the same config with real
verification as `correctness_speculative_config`: the sampler becomes `block` and
`synthetic_acceptance_length` goes, which is how InferenceX runs its own evals. The roles that run
parity and accuracy probes (integrator, Director, config tuner, tuning specialist) get it as
`CORRECTNESS_SPECULATIVE_CONFIG`. They also get the block SGLang already gets, generalized: serve
both probe servers with this config in place of the seed's, and keep the throughput servers as they
are. For SGLang-only stacks and stacks without simulation, every prompt is byte-identical to main.

**Validate's deadline.** On a trace replay under a time budget, the Director's Validate inputs gain
two values:

- `VALIDATE_DEADLINE_EPOCH`: the `date +%s` it must return by, which is the budget's end minus 10
  minutes for the workflow's own return.
- `VALIDATE_BLOCK_S`: what one block costs by the reserve's own sizing: a canonical window plus 20
  minutes, times `REPLICAS` when each replica boots its own server.

`director.md` tells it to check, before each block or probe server, that the work fits with 15
minutes to spare for arbitration, the JSON and the report. If it does not, the Director starts
nothing more, arbitrates on what it measured, and says in `arbitration_note` what it skipped. The
time comes from the run's one cached `date +%s`. When that can't be read, the Director gets no
deadline, as today.

**Recovery from the finished legs.** When the Director wrote no verdict, the salvage ladder runs as
before. If it found a stack and both Validate legs finished, those two legs become the result's
numbers:

- `result_source: "disk_validation_legs"` and `validation_status: "recovered_validation_legs"`;
- the base leg is the same-session baseline (`validation_base_bench_summary`);
- the KEEP rule judges the pair.

A leg counts only when all of these hold:

- it is complete, usable for acceptance, and measured for validation;
- it is a trace replay's leg (`warmup_protocol`);
- it is on the same axis as the other leg;
- it is newer than the run's latest `.final_phase_fence`, so a resumed run's earlier Validate does
  not count.

The stack and its evidence stay the salvage tier's. No Director arbitrated the pair, so the KB write
stays unverified and is not promoted. A no-gain salvage has no stack to credit and is left alone.

## How it showed up

The run's seed had `"rejection_sample_method":"synthetic","synthetic_acceptance_length":3.69` in its
`--speculative-config`. These figures are from that run, or from a copy of its artifacts:

- **Probes.** On main, the dry run maps no correctness guard. On this branch it maps the same config
  with `"rejection_sample_method":"block"` and the length removed, with every other field unchanged.
- **Validate.** The planned base and final legs took about 75 minutes each. With the gsm8k probes,
  the planned work took about 4 hours, which left 81 minutes. With this branch, one more block
  (`VALIDATE_BLOCK_S` = 4800 s) plus the 15 minutes for the report no longer fits. The Director
  arbitrates on the planned pair and returns instead of starting the reverse-order pair.
- **Recovery.** Main reports `disk_stack_provisional`, 123.618 → 123.815 tok/s/user (+0.16%), from
  the 15-minute A/B. This branch reports `disk_validation_legs`, 122.374 → 125.0 (+2.15%), from the
  two 1-hour legs. The KEEP rule (+3% on P50 interactivity) still fails, so the result is still
  `no_gain`, now on the canonical window.

## Behavior changes

- On vLLM with synthetic acceptance, correctness probe servers launch with the verifying config. The
  throughput legs are unchanged. As with SGLang today, the integrator can no longer reuse its A/B
  servers for the accuracy probe.
- On a trace replay under a budget, the Director may skip a repeat or a probe it cannot finish, and
  says so. The reserve's sizing is unchanged.
- A trace replay killed after both Validate legs finished reports those legs instead of the
  salvage's search-window A/B. Its numbers are on the canonical window, like Setup's.

Unchanged:

- Fixed-ISL/OSL runs: they get no deadline input, and their legs never qualify.
- SGLang's guard and its prompts.
- Runs without a time budget.
- A Director verdict always outranks the legs.
- No-gain salvages.

Not covered: the agent timeout. In the final phase every agent gets `agent_timeout_ms` (2 hours by
default), and one that times out is retried beside the attempt still running. By the reserve's
sizing, Validate's two blocks alone take longer than that, so trace replays still need
`GEAK_AGENT_TIMEOUT_MS` raised and `GEAK_AGENT_TIMEOUT_RETRY=0`.

## Tests

- `interface/test_run_e2e_dispatch.py`:
  - On a dry run, a synthetic config maps to its verifying twin. A verifying, absent, or unreadable
    config maps nothing.
  - The parser reads raw, `=`, and `shlex.join`-ed seeds, and the last occurrence wins.
- `interface/test_run_e2e_recovery.py`:
  - A killed run whose legs finished reports from them: once as no gain, and once as a keep that
    ships `ok` but writes the KB with `--no-promote`.
  - These change nothing:
    - legs that did not both finish;
    - a leg that fails any condition;
    - a leg older than the fence;
    - a leg whose age cannot be read;
    - a no-gain salvage.
  - A Director verdict outranks the legs.
- `e2e_workflow/scripts/test_correctness_probe_env.js`:
  - the vLLM block for each probe role, and both forms together;
  - no block for non-probe roles;
  - its SGLang checks are unchanged and still pass.
- `e2e_workflow/scripts/test_time_budget_reserve.js`:
  - the deadline and the block cost from the budget, read with one cached clock read;
  - replicas scale the block;
  - an unreadable clock, a synthetic workload, or no budget pass nothing;
  - the Director's Validate call passes both inputs, and `director.md` documents them.
- CI's lists, run locally on this branch and on main:
  - The pytest list matches main. Two tests fail the same way on both, from the test machine's
    environment: one reaches a logged-out `claude` CLI, and the GPU-lease profile-wrapper test
    writes no output there.
  - Coverage is 97.18% against the 97% gate, and every new statement is covered.
  - All 26 Node commands pass, including the script-size check, and so do the contract checks.
  - There is one commit per fix, and each passes the Node commands and the touched test files on
    its own.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1217858e4233`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.