# Issue

**Title:** fix(e2e): GEMM bake-off verdicts on gfx1151, warm-server bench, Tensile kernel matching

## Description

## Summary

, , . Three bugs seen on gfx1151 runs. Each issue has the original log and a main-vs-this-branch repro. Each commit fixes one issue and carries its own tests. Rebased on main. #602 was closed as not planned, so its part is out.

- **The GEMM speedup is scored against the live BLAS default** (#603, `op_bench.py`). This is the library the server's torch BLAS calls go to.
  - **How the default is decided:**
    - `TORCH_BLAS_PREFER_HIPBLASLT` or `TORCH_BLAS_PREFER_CUBLASLT` in `--server-env`, when set there. The e2e workflow passes `CURRENT_ENV` to every bake-off, so an env winner accepted earlier, or one in `INIT_ENV`, is seen.
    - Otherwise, torch's preference in op_bench's own process. That process runs on the server's image: rocBLAS on gfx1151, hipBLASLt on CDNA.
    - The string is read the way the launchers apply it (`env $EXTRA_ENV`: whitespace split, quotes kept, last setting wins) and the way torch reads it: only `1` and `0` are honoured, and a `1` on either name wins.
  - **How it is read:**
    - `main()` reads it once, before any arm switches it, and hands it to every path.
    - It is published as `live_blas_default` together with `_source` and `_error`.
    - When it cannot be read, or is neither library, hipBLASLt is assumed as before. In that case `_source` is `assumed` and `_error` says why.
  - **How it is used:**
    - Its arm is benched even when `--backends` omits it.
    - It is the only baseline. If it produced no correct timing, the verdict is withheld rather than scored against hipBLASLt: the verdict fields are null, `verdict_withheld` and `verdict_withheld_reason` say why, and `OPBENCH NO_VERDICT` is printed. `op_benchmarker.md` says which gate that returns.
    - An arm that switches the BLAS library afterwards restores the live default.
    - A winner that is not the live default deploys `TORCH_BLAS_PREFER_HIPBLASLT=1` (hipBLASLt) or `TORCH_BLAS_PREFER_HIPBLASLT=0 TORCH_BLAS_PREFER_CUBLASLT=0` (rocBLAS). The recipe is appended to the server's env, where a `1` on either name keeps hipBLASLt.
- **`bench_e2e.sh` creates `PROFILE_DIR` on the reused-server path** (#604).
- **Tensile solutions of one kernel match** (#605, `kernel_selection.py` and `kernelIdentitiesMatch` in `e2e_workflow.js`).
  - Two `Cijk` symbols match when they differ only in `SIA`/`SU`/`SUS`/`WGM`. Dtype, layout, tile, workgroup and ISA tokens must still agree.
  - Joint chains stay exact. `verify_chain` matches members exactly, to each other and to the launches, and the joint checks in `e2e_workflow.js` (candidate coverage, duplicate members, reported set, member evidence) turn the relaxation off. Single-kernel selection and profiled-vs-declared identity stay relaxed. `kernel_symbols.json` pins both verdicts on both sides.

## Behaviour change on CDNA (Instinct)

- hipBLASLt is the default there, so the baseline is unchanged. A rocBLAS recipe now also sets `TORCH_BLAS_PREFER_CUBLASLT=0`. A `--backends` list without `hipblaslt` now also benches it, and a run whose hipBLASLt arm has no correct timing publishes no verdict.
- hipBLASLt `Cijk` symbols that differ only in the four solution knobs now match, except between members of a joint chain.

## Not covered

- A GEMM the server does not send through torch BLAS is still scored against the live BLAS arm: vLLM's skinny GEMMs for small decode batches on gfx1151 (`wvSplitK`), aiter's tuned GEMM on CDNA when it is enabled. That was so on main too. The integrate A/B is what catches a win that does not engage.
- On the multi-GPU FAST_MODE head track, every head is baked before any is integrated, so a second head's bake-off sees the env from before the first head's accept.

## Test plan

- **New checks fail on main or on the previous head:**
  - `test_op_bench.py`:
    - an untimed or incorrect live default withholds instead of falling back to hipBLASLt, the blockscale path included;
    - `--server-env` parsing: both names, quotes, the last setting, and torch's 1/0-only rule;
    - a deploy recipe appended to the server env selects the winner, the `TORCH_BLAS_PREFER_CUBLASLT` alias included;
    - every bake-off call passes `CURRENT_ENV`;
    - an unknown or unreadable default is reported as assumed;
    - the live default is read once and reaches every path;
    - every BLAS switch hands the default back.
  - `test_bench_replica_lifecycle.py`: reused server.
  - `test_kernel_selection.py` and `test_agentx_baseline_selection.js`: joint members that are Tensile variants stay distinct.
  - `kernel_symbols.json` rows on both the Python and the JS side: nine Tensile rows (one a verbatim gfx1151 pair), with `member_match` on the two that match.
- **Existing `test_op_bench.py` cases:**
  - The fake stack now answers hipBLASLt as torch's default, so they exercise the known-default path.
  - A case whose winner is not hipBLASLt gets a slower hipBLASLt row, its baseline, so the verdict it asserts is unchanged.
- **Measured on gfx1151** (torch 2.11, jiangyon.geak):
  - `preferred_blas_library()` is Cublas by default.
  - It is Cublaslt with `TORCH_BLAS_PREFER_HIPBLASLT=1` or `TORCH_BLAS_PREFER_CUBLASLT=1` (a 1 on either wins), and Cublas with `=0`.
  - Applied as `env $EXTRA_ENV` would: `TORCH_BLAS_PREFER_CUBLASLT=1 TORCH_BLAS_PREFER_HIPBLASLT=0` stays Cublaslt; appending `TORCH_BLAS_PREFER_CUBLASLT=0` gives Cublas.
  - The preference routes `linear` with and without bias alike (rocBLAS/hipBLASLt call logs): rocBLAS by default and with both names at 0, hipBLASLt with `TORCH_BLAS_PREFER_HIPBLASLT=1`.
  - `true`/`yes`/`on`/`"1"` are ignored with "valid values are 0 or 1".
- **Full local L0** (every step of `ci-l0-checks.yml`, compared per test) gives the same results as main:
  - the same three pytest failures (environmental), with 12 more tests passing;
  - the same ruff count;
  - the same node-18 failure in the AgentX step;
  - no gitleaks here.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dbcd1d86fa24`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.