# Issue

**Title:** Adding support to e2e optimization via fp8 gemm tuning

## Description

This is a new feature to support e2e optimization (specifically, sglang+ aiter) via fp8 gemm tuning.
temporally, it can be used liked this:

`geak-gemm-tuning -t "Optimize the e2e performance of the workload via gemm tuning, the benchmark script is <sglang benchmark script location>"`
 By default it will use the yaml with login info here: src/minisweagent/config/mini_gemm_tuning.yaml
 
 or additionally a -c follows hyperloom launch style to have a standalone yaml with login info (e.g. litellm):

`geak-gemm-tuning -c loading.yaml -t "Optimize the e2e performance of the workload via gemm tuning, the benchmark script is <sglang benchmark script location>"`
 
 then the model section in yaml will get overwritten by the login info from provided -c file. 


Verified results are here:
| Model               | TP | SGLang Version From Bench     | Mean E2E Speedup (Baseline / Tuned) |
|---------------------|----|-------------------------------|-------------------------------------|
| qwen3_30b_a3b_fp8  (ISL=30k) | 2  | 0.5.10.dev4+ge714db81a rocm700 | 1.027 |
| qwen3_14b_fp8  (ISL=30k)     | 4  | 0.5.10.dev4+ge714db81a rocm700 | 1.222 |
| qwen3_14b_fp8  (ISL=30k)     | 4  | 0.5.11 rocm720               | 1.213 |
| qwen3_14b_fp8  (ISL=2k)     | 2  | 0.5.11 rocm720                      | 1.421 |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e2a8e2b91823`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.