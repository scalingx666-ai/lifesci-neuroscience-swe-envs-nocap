# Issue

**Title:** GEAK v4 review PR

## Description

# GEAK v4 Release

GEAK v4 is a major redesign of GEAK, upgrading it from a single-kernel optimization agent into an end-to-end GPU performance optimization system for AMD Instinct GPUs.

The headline change is **e2e_workflow**: GEAK can now optimize full LLM serving workloads on sglang and vLLM, not just isolated kernels. It profiles the real workload, ranks bottlenecks by Amdahl impact, pulls the cheapest high-leverage levers first, and recursively calls the single-kernel workflow only for kernels that can truly move model throughput.

## Highlights

### End-to-End LLM Serving Optimization

GEAK v4 introduces `e2e_workflow`, a system-level optimizer for whole-model serving throughput. The workflow:

- preflights the GPU, backend, model, and profiler environment;
- profiles a warm sglang/vLLM server on the target workload;
- ranks hot kernels by `pct_gpu_time × achievable_speedup`;
- runs config/backend sweeps before expensive source rewrites;
- extracts high-impact kernels into standalone tasks;
- recursively invokes `kernel_workflow` to author or optimize kernels;
- overlays accepted changes back into the live server reversibly;
- validates gains with warm-server A/B, engagement proof, output parity, and throughput gating.

### Workflow-Based Orchestration

GEAK v4 moves the optimization control plane into deterministic JavaScript Workflows. Budget loops, parallel fan-out, verification, recursion, and stop conditions are handled in code, while LLM agents focus on judgment-heavy work such as analysis, strategy, kernel authoring, debugging, and integration.

This makes GEAK v4 easier to run, easier to reproduce, and easier to debug than a fully prompt-driven optimization loop.

### Stronger Single-Kernel Workflow

The original kernel optimization capability remains first-class through `kernel_workflow`. It supports Triton, HIP, CK, FlyDSL, and other AMD GPU source paths through a hierarchical multi-agent design:

- Director for workspace setup and final validation;
- TechLead for strategy and round planning;
- specialist engineers for algorithm, memory, compute, and host/runtime optimization;
- independent verification for every candidate patch;
- integration and re-profiling across rounds.

Each patch is measured independently before it can become the new best candidate.

### Performance Knowledge and Expert Skills

GEAK v4 adds a structured `perf_knowledge` layer for AMD GPU optimization. It organizes operator, backend, GPU-generation, dtype, and regime knowledge into a machine-queryable kernel matrix. Expert skills can seed high-value optimization directions, but they never replace measurement: every candidate must still pass on-box validation.

## What’s New

### Added

- `e2e_workflow/` for whole-model sglang/vLLM serving-throughput optimization.
- `kernel_workflow/` as a workflow-native single-kernel optimizer.
- Deterministic JS Workflow orchestration for budget control, parallelism, verification, and recursive workflow calls.
- Amdahl-driven profiling and triage for system-level bottleneck selection.
- Config/backend sweep before source-level kernel authoring.
- Warm-server end-to-end validation with interleaved A/B comparison, engagement proof, output parity, and noise-band gating.
- Reversible overlay-based integration for serving backends.
- `perf_knowledge/` for AMD operator × backend optimization knowledge.
- Expert-skill support for reusable, measurement-gated kernel optimization recipes.
- Example e2e reports and benchmark comparisons under `examples/`.

### Improved

- Clearer separation between deterministic control flow and LLM judgment.
- Better usability through natural-language workflow invocation.
- More reliable benchmarking and verification through independent patch validation.
- Better alignment between kernel optimization and real serving workloads.
- Improved long-run optimization support for multi-kernel and multi-backend exploration.
- Stronger artifact discipline: each run writes structured reports, patches, overlays, and per-stage outputs.

## Requirements

- AMD Instinct MI GPU, such as gfx942 or gfx950.
- ROCm 6+.
- ROCm profiler support, such as `rocprof-compute`, `rocprofv3`, or `rocprof`.
- Python 3.8+.
- Claude Code 2.1.177 or newer for dynamic Workflow support.
- For end-to-end optimization: runnable sglang or vLLM backend and local model weights.

## Getting Started

```bash
git clone https://github.com/AMD-AGI/GEAK.git
````

Invoke the workflow in natural language.

For end-to-end serving optimization:

```text
use path_to_GEAK/e2e_workflow to optimize inference for /models/Qwen3.5-27B-FP8, sglang, ISL/OSL=1024, conc=64, gpus 0,1,2,3
```

For single-kernel optimization:

```text
use path_to_GEAK/kernel_workflow to optimize path_to_GEAK/examples/tasks/knn
```

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6b0bf8f8c00d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.