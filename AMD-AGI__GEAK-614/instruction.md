# Issue

**Title:** Fix rocprof-compute's profile name and rocprofv3's abort deadlock in `profile_kernel.sh`

## Description

## Summary

Two of the profiler calls in `kernel_workflow/scripts/profile_kernel.sh` fail on current ROCm
toolchains, and one of the failures never returns.

- rocprof-compute and omniperf get the workload directory as the profile name,
  `-n "$OUTPUT_DIR/${tool}_workload"`. rocprof-compute refuses "/" in a name, and omniperf
  refuses "-", "." and names over 35 characters, so the call fails before it profiles anything.
  `RPC_PROFILE_ARGS` cannot repair it, because the wrapper's own `-n` comes after those args and
  the last one wins.
- rocprofv3 puts its own signal handler in front of the application's and runs the application's
  after it. When the profiled process aborts, that chain can re-enter rocprofv3's handler and
  deadlock, so the profile never returns. Multi-GPU specs already pass
  `--disable-signal-handlers true` for this reason. Single-GPU runs don't, and neither do the
  tools that run rocprofv3 underneath (rocprof-compute, metrix).

## Change

- rocprof-compute and omniperf get a bare `-n workload` and the workload directory in `-p`. Both
  write to an explicit `-p` as given, and `analyze -p` already reads that directory. The directory
  is made absolute, because both refuse a path that contains "..".
- The script exports `ROCPROF_SIGNAL_HANDLERS=0` unless the caller has set it. This is the variable
  `--disable-signal-handlers true` sets for the profiled process (ROCm 7.0 and later), so it reaches
  rocprofv3 whether the wrapper starts it or rocprof-compute or metrix does. ROCm 6.4's rocprofv3 has
  neither the flag nor the variable, so the export changes nothing there.
- No profiler call gets a time limit, so a long but healthy profile is never cut short.

## How it showed up

The Triton kernel lane of an AgentX run, with rocprof-compute 3.8.0 and rocprofv3 1.3.5:

- rocprof-compute refused the call: `"/" is not permitted in profile name`.
- Under rocprofv3, the profiled torch process aborted while loading
  (`LLVM ERROR: inconsistency in registered CommandLine options`). rocprofv3's handler caught the
  SIGABRT and finalized its output. It then ran the application's handler, was entered again, and
  stopped there. The profile hung for 39 minutes until it was terminated. The lane reproduced the
  hang with a bare matmul script, and noted that metrix, which drives the same rocprofv3, hung too.
- Seven retries with `--disable-signal-handlers true` hit the same abort and each exited within half
  a second.
- The wrapper fell back to benchmark-only, and the lane's benchmark step later hit the 60-minute
  hung-agent guard. The run's result didn't depend on that lane: its best kernel measured 10.7 µs,
  slower than the 8.18 µs hipBLASLt route the bake-off picked.

## Behavior changes

- rocprof-compute and omniperf profiles now run instead of failing on their name. They come first in
  the default order on CDNA (`profile_policy.sh`, `profiling_guide.md`), so CDNA profiles now come
  from rocprof-compute; before, they fell through to rocprofv3. Counter collection replays the
  benchmark several times, so these profiles take longer than a rocprofv3 kernel trace.
- A profiled process that aborts now exits with the abort instead of hanging, and the wrapper moves
  on to the next profiler, as for any failed run.
- rocprofv3 no longer chains the application's own handlers for SIGINT, SIGQUIT, SIGABRT and
  SIGTERM behind its own. Its own handler is still installed and still finalizes output on a signal
  the application leaves alone; rocprofv3 1.3.5 did so before exiting on the abort above.

Unchanged: the default rocprofv3 arguments, multi-GPU specs, a caller's `RPV3_TRACE_ARGS` and
`ROCPROF_SIGNAL_HANDLERS`, and the profiler order.

## Tests

- `kernel_workflow/scripts/test_profile_invocation.sh`, new and added to the contract checks. It uses
  stub profilers that apply both releases' name and path rules and record what they receive. It
  checks four things:
  - rocprof-compute profiles into the workload directory from a relative output path containing
    "..", and its counters reach the report.
  - rocprof-compute and rocprofv3 both run with `ROCPROF_SIGNAL_HANDLERS=0`.
  - rocprofv3's arguments are unchanged.
  - A caller's own value is kept.

  On main, rocprof-compute fails on its name and rocprofv3 sees the variable unset.
- `test_profile_fallback.sh` and `test_profile_policy.sh` pass unchanged.
- CI's lists, run locally: the pytest list passes (coverage 97.17% against the 97% gate), all 22
  Node commands pass, and so do the contract checks, the shell syntax check, the vendored-skillset
  check and the dry-run.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7264f0ce8e45`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.