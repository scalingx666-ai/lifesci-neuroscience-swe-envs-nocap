# Issue

**Title:** reject worktree-bypassing harnesses instead of silently evaluating the unpatched kernel

## Description

## Problem

Closes AMD-AGI/GEAK#246.

For C++/HIP header-only (and editable-install, e.g. `aiter`) kernels, the
auto-generated `harness.py` hard-coded an absolute path into the **source repo**
instead of deriving every repository path from `$GEAK_WORK_DIR`. The COMMANDMENT
side was correct (`cd $GEAK_WORK_DIR`, worktree-first `PYTHONPATH`), but the
harness it invoked ignored those signals via four shapes:

1. `REPO_ROOT = "/sgl-workspace/sglang"` module-level literal.
2. `hipcc -I /abs/source/include` — `#include` resolved through the source repo.
3. `.so` build cache under `HARNESS_DIR/_harness_build/`, shared across every
   worktree / round / GPU worker.
4. Rebuild mtime check walking the **source** include dir (never changes), so
   `need_rebuild = False` and the stale `.so` is reused.

Net effect: every patched candidate compiled/loaded the **unpatched** kernel.
`--correctness` always PASSed, verified speedup was always ≈ 1.00×, and no
validator fired — the optimizer (and each sub-agent inner loop) trained on a
flat signal, and correctness-breaking patches went undetected.

Existing validators only checked the four argparse flags + `GEAK_RESULT_*`
stdout markers, and preflight/baseline both ran on the unpatched repo, so the
bypass was indistinguishable from a legitimate "couldn't beat baseline" result.

## Approach — defense in depth

The root cause is mechanism-specific (`-I`, `sys.path`, `open()`, build cache,
editable `import`), so a single textual check is not enough. This PR adds a
**deterministic, mechanism-agnostic static gate** plus generator/verifier
guidance so the bypass is caught at generation time, verification time, and
optimization time — and never produces a green ≈1.00× run.

### 1. Deterministic worktree-bypass gate (`kernel_languages/contract.py`)

- `find_source_repo_path_leaks(text, repo_root=None)` — flags any absolute path
  literal that points into the source repo and is **not** derived from the
  `GEAK_WORK_DIR` / `GEAK_REPO_ROOT` env contract. It is mechanism-agnostic:
  - (1) any absolute literal beginning with the known source-repo root
    (`repo_root` arg or `GEAK_REPO_ROOT` / `GEAK_WORK_DIR` env, both literal and
    resolved);
  - (2) canonical bypass forms regardless of repo root —
    `sys.path.insert(0, "/abs")`, `-I/abs`, `REPO_ROOT = "/abs"`;
  - (3) backstop: a bare absolute source-path literal hidden in a candidate
    list/tuple later fed into `sys.path` / `-I` / `PYTHONPATH` via a variable —
    the exact shape that, with `sys.path.insert(0, ...)` in a loop, lands ahead
    of the worktree.
  - Allow-listed (not leaks): the sanctioned env-derived default
    `os.environ.get("GEAK_WORK_DIR", "/repo")`, and system/toolchain prefixes
    (`/opt/rocm`, etc.). Full-comment lines are stripped; a tokenizer-based
    context scan avoids false positives on strings/comments.
- `find_aiter_routing_violation(text)` — `aiter` is installed editable via a
  `sys.meta_path` finder, so `sys.path` ordering can **not** shadow it. A harness
  that imports `aiter` and builds a `csrc/*.cu` kernel must set
  `AITER_META_DIR=$GEAK_WORK_DIR` (source routing) **and** a per-slot
  `AITER_JIT_DIR` (build-output routing) **before** `import aiter`, or it
  silently evaluates the baseline (and pollutes/races the shared source build
  dir). The gate enforces both.
- `validate_harness(path, repo_root=None)` raises `ContractViolation` with an
  actionable message (offending line + how to derive from `$GEAK_WORK_DIR`).

### 2. Wire the gate into every layer

- `run/preprocess/harness_utils.py` + `run/preprocess/run_harness.py`: harness
  generation and optimization-time evaluation run the gate and reject leaks.
- `run/preprocess_v3/adapter.py`: export `GEAK_REPO_ROOT` = the **original**
  source repo before harness validation. Previously preprocess only saw
  `GEAK_WORK_DIR` (the sub-agent worktree), so `_resolve_repo_roots` could not
  recognize a leak pointing at the real repo root.
- `subagents/preprocess/harness-verifier/SUBAGENT.yaml`: the verifier sub-agent
  now runs the deterministic validators as fatal gates — worktree-bypass (7),
  aiter-routing (7b), self-contained-build (7c) — and on failure escalates to
  the generator with `FAILED_RULE=...` + a correction hint, instead of patching
  around it by hardcoding another path.

### 3. Prevent the bug at the source (generator guidance)

- `subagents/preprocess/harness-generator/SUBAGENT.yaml`: a mandatory
  "Worktree Path Discipline" section — derive
  `WORK_DIR = os.environ.get("GEAK_WORK_DIR", ...)`, build `-I{WORK_DIR}/...`,
  put the build cache under `WORK_DIR` (per-slot isolated), do an incremental
  rebuild keyed on the **worktree** source mtime, build self-contained from a
  fresh worktree, and never add a hardcoded source-path fallback to a `sys.path`
  candidate list.
- `kernel_languages/hip/builder_hints.md` (new): HIP-specific idioms (pybind /
  standalone / raw `hipcc` shapes, timing loop) and the mandatory aiter worktree
  routing rule.
- `kernel_languages/hip/commandment.j2`: use Jinja `default(..., true)` so an
  empty `correctness_command` / `performance_command` still falls back to the
  worktree-`cd` default command (previously an empty string suppressed it).

### 4. Robustness (avoids false negatives / discarded runs)

- Self-contained build gate addresses Blocks 3–4 directly: the harness must
  build from scratch in a fresh per-slot worktree (no reliance on a shared
  `_harness_build` outside the worktree, no source-repo mtime check), so each
  candidate recompiles the patched source.
- `run/preprocess_v3/{orchestrator,tools}.py`: retry caps on deterministic tools
  + step/cost-limit salvage so a run that already produced a valid
  `harness.py` + `COMMANDMENT.md` is rescued (with a warning) rather than aborted.
- `tools/bash_command.py`: process-group timeouts + denylist scope-gating so the
  verifier's checks can't hang on recursive scans over a huge filesystem.

## How each root-cause block is now closed

| Issue block | Fix |
| --- | --- |
| 1. `REPO_ROOT = "/abs"` literal | `find_source_repo_path_leaks` named-constant + repo-root-prefix patterns; generator derives from `$GEAK_WORK_DIR` |
| 2. `hipcc -I /abs/source` | `-I/abs` pattern; generator emits `-I{WORK_DIR}/...` |
| 3. shared `.so` cache outside worktree | self-contained-build gate; build dir under `WORK_DIR` (per-slot) |
| 4. mtime check walks source repo | rebuild keyed on worktree source; per-candidate build dir |
| editable `aiter` (sys.path can't shadow) | `find_aiter_routing_violation` (`AITER_META_DIR` + `AITER_JIT_DIR`) |

## Validation

- `find_source_repo_path_leaks` fires on the exact four harness shapes from the
  issue and stays silent on a contract-compliant `os.environ.get("GEAK_WORK_DIR", ...)`
  harness (true/false-positive cases covered by unit tests).
- Read-only sanity probe from the issue now corresponds to a hard failure:
  a harness with no `GEAK_WORK_DIR` reference is rejected at preflight rather
  than producing a green ≈1.00× run.
- End-to-end preprocess validated on a standalone HIP kernel (`silu.hip`) and an
  `aiter` kernel: the generated harness resolves paths from `$GEAK_WORK_DIR`,
  builds inside the worktree, and a deliberately corrupted worktree kernel now
  makes `--correctness` FAIL (previously PASSed).
- `py_compile` / lint clean on all touched modules; existing preprocess test
  suite passes.

## Files

`contract.py` (gate), `hip/builder_hints.md` (new), `hip/commandment.j2`,
`harness_utils.py`, `run_harness.py`, `adapter.py`, `orchestrator.py`,
`tools.py`, `baseline.py`, `bash_command.py`, `unit_test_agent.py`,
`litellm_model.py`, `harness-generator/SUBAGENT.yaml`,
`harness-verifier/SUBAGENT.yaml`.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7be07285a1fc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.