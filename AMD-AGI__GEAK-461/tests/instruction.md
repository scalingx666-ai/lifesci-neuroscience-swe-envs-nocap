# Issue

**Title:** Add gfx1151 (RDNA3.5 / Radeon 8060S) as a supported arch

## Description

## Why

GEAK detects the `gfx1151` but only carries knowledge for gfx942/gfx950. 

This PR teaches GEAK about the specifics of gfx1151, mainly by adding `kernel_workflow/knowledge/amd_ryzen.md`
and teaching various roles about it.

## What's in it

| File | Change |
|---|---|
| `kernel_workflow/knowledge/amd_ryzen.md` | **new** |
| `kernel_workflow/roles/{profile_engineer,tech_lead,deep_engineer,engineer,author_engineer}.md` | detect-then-pick routing |
| `e2e_workflow/.../roofline/peaks.md` | `gfx1151` row |
| `.../hardware/hw_constants.json` | `lds_per_wgp_kib`, `lds_banks`, `dynamic_vgpr`, `mfma_valu_coexec` on the existing gfx1151 entry |
| `README.md`, `docs/compatibility.md`, `roofline/SKILL.md` | prose |
| `test_roofline_skill.py`, `test_harness_lib.py` | coverage for the peaks row |

## Verification

Re-run on this commit:

- CI L0 pytest list: **2017 passed, 5 skipped, 85 subtests**; coverage **97.02%** vs the 97% gate
- `roofline_tools.py --selftest`: PASS · `hw_constants.json` parses
- Vendored-skillset manifest gate: green (this PR does not touch the pinned tree)
- `grep` for roles naming `amd_instinct` but not `amd_ryzen`: empty

Coverage is below the 97.52% an early draft reported. That is the rebase onto current `main` pulling
in code with its own coverage, not this change — the diff adds no executable statements outside the
two test files.

## Evidence: four GEAK runs on this branch

All on a gfx1151 box, in a stock `rocm/hyperloom:vllm-v0.27.1-rocm7.2.3` container plus Claude Code,
with **no hardware facts in the prompt** — arch detection and knowledge routing were what was tested.

### 1–2. `e2e_workflow`, Qwen3-4B / vLLM (ISL 1024, OSL 128, conc 16, TP=1)

`phases=setup` (39.8 min, 5 agents, 0 errors) measured a 219.855 tok/s baseline and resolved the
roofline off the new `peaks.md` row. It produced per-kernel attainable speedups that **disagree with
the `%gpu` ranking**:

| rank by %gpu | kernel | %gpu | bound | attainable | e2e ceiling |
|--|--|--|--|--|--|
| 1 | decode `gate_up_proj` | 26.89 | memory | 1.280× | +5.88% |
| 2 | paged attention | 22.85 | latency | 1.000× (saturated) | **+0.00%** |
| 3 | decode `qkv_proj` | 13.07 | latency | **1.921×** | **+6.27%** |

### 3. `kernel_workflow`, `examples/tasks/knn`, `mode=optimize` — the payoff

Two engineers, both correctness-clean, measured against a frozen baseline (15 cases, min-of-5):

| | geomean | min | max |
|---|---|---|---|
| engineer_0 | **5.36×** | 1.06× | 25.52× |
| engineer_1 | **4.49×** | 1.05× | 9.60× |

`amd_ryzen.md` was read by the director, tech_lead and profile_engineer. The profile engineer wrote:

> `knowledge/amd_ryzen.md` is the applicable hardware reference; `amd_instinct.md` is not.

and its device table reproduces the file's machine model exactly. The facts then drove the plan —
`roadmap.md`:

> wave32 … assumes 64 and must be adapted: **5 shuffle steps**, 8 waves per 256-thread block, not 4
> … `shape_3_standard` runs on **2 workgroups out of 20 WGPs**. Proof it is parallelism [bound]

Two PR facts did the work: **wave32** set the reduction width, and the **CU-vs-WGP** distinction
produced the primary diagnosis (grid-fill deficit), which is where the large speedups came from.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ab5703fe0d86`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.