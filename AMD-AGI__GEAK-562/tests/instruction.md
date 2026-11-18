# Issue

**Title:** fix(agentx): declarable entry-count reference, and refuse a client that cannot start

## Description

Refs AMD-AGI/Hyperloom#2429
Two AgentX gaps that came up while Hyperloom started handing GEAK an AgentX workload on the Magpie backend.

**The canonical entry count could not be declared.** `agentx.sh` stamps a replay non-canonical when its corpus, entry count or window differs from a reference, and `map_aiperf.py` then forces `submission_valid=false`. A workload declares the corpus and the window of that reference with `canonical_corpus` and `canonical_duration_s`, but the entry count was a literal 393, so a workload whose reference is another count had no way to say so.
- `agentx.sh` reads `AGENTX_CANONICAL_NUM_ENTRIES` (default 393). The workflow declares it from `canonical_num_entries`, and `run_e2e.py` exports `canonical_num_entries` and `canonical_duration_s` from a handoff as it already does `canonical_corpus`.
- Overriding `num_entries` alone still leaves the reference at 393. With nothing declared, every value is unchanged.

**A client that cannot start was found only after a server had warmed.** `agentx_preflight` only warned, never read a declared `aiperf_bin`, and its `X_OK` check passes a venv script whose interpreter is gone. InferenceX's `install_agentic_deps` builds that kind of venv: uv links its `python` to an interpreter uv installed outside the venv, so in a container without that interpreter, exec fails once the server is up.
- The client is resolved the way the bench resolves it: `AIPERF_BIN`, else `aiperf_bin`, else `aiperf` on `PATH`. An absolute path that is missing, not executable, or in a venv whose `python` link dangles is refused before anything launches, with `error_class: agentx_client_unavailable` in `result.json`.
- A bare name that does not resolve still only warns, since the bench's `PATH` can differ; `GEAK_STRICT_AGENTX_PREFLIGHT=1` refuses it too. `--dry-run` reports the refusal as `agentx_refusal` without acting on it, and re-entering a finished `eval_dir` still re-emits from disk.
- README, `run_e2e.md` and `run-e2e-contract.md` describe the check and list the class.

Testing: the 30 steps of `ci-l0-checks.yml`, replayed locally, pass as on main (3,462 tests passed; coverage 97.17%, up from 97.16%, with every changed line of `run_e2e.py` covered; ruff, which is advisory, reports nothing new). The new tests fail on main, apart from the one pinning that a finished `eval_dir` still re-emits. On a venv whose `bin/python` links to a removed interpreter, in both the shebang form and uv's `/bin/sh` form, `[ -x ]` passes and exec fails; the preflight now refuses it by name.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `124de43eb007`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.