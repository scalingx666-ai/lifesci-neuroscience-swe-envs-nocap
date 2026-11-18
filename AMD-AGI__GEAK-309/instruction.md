# Issue

**Title:** Geak v4 tracelens

## Description

## Tracelens Position:
Setup → Profile ──▶ [profile_analyzer_tracelens] ──▶ Strategize → ConfigSweep → HeadKernel → …
 
## How TraceLens is called
- CSVs — run the TraceLens perf report on the captured trace:
```
python3 -m TraceLens.Reporting.generate_perf_report_pytorch_inference \
    --profile_json_path "$TRACE" \
    --output_csvs_dir   "$OUT/perf_report_csvs"
```
- summary.md — generated with TraceLens's own LLM-summary approach, invoked as a subagent (not via the CC SDK). 

## summary.md guides optimization
Use the results in summary.md to guide kernel selection and optimization; the rest of the GEAK v4 pipeline is unchanged.

## Others
TraceLens profile analysis is enabled by default; to turn it off, pass profile_analysis=false.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `eca7d04eef62`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.