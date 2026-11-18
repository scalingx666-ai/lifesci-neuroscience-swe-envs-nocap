# Issue

**Title:** feat(preprocess): thread user `-t` task into UTA + ShapeFixerAgent

## Description

Today the user's `-t prompt.md` is read in `mini.py` and forwarded only to the main optimization agent that runs after preprocessing. The preprocess sub-agents (UnitTestAgent in Step 3b, ShapeFixerAgent in Step 3d) never see it, so any production-shape contract the user supplies in the prompt is invisible to the harness-creation step.

The UTA's system prompt currently hard-codes "If a benchmark file exists FOR THIS KERNEL: use it for shapes." (mini_unit_test_agent.yaml). When the discovery MCP finds an op-test for the kernel, the UTA mirrors that op-test's default M/N/dtype sweep verbatim, even when the user prompt declares the workload pins a much narrower production shape (e.g. SGLang serving Qwen3-8B at TP=8, intermediate/TP=1536, decode m=64 dominant). That mismatch makes the resulting micro-benchmark report flat geomeans across irrelevant shape cells, and any per-kernel speedup it surfaces does not predict end-to-end gain.

This change makes the user prompt available to both preprocess sub-agents and lets it override the discovered benchmark file's defaults when (and only when) the prompt contains an explicit `USER TASK CONTEXT` block.

Plumbing (additive, all new params default to None so all existing call sites are unchanged):
- mini.py: forward task_content into _preprocess_kwargs.
- preprocessor.py: run_preprocessor accepts user_task and passes it to create_validated_harness and run_shape_fixer.
- harness_utils.py: create_validated_harness accepts user_task and forwards it to run_unit_test_agent.
- unit_test_agent.py: run_unit_test_agent accepts user_task and prepends a framed "USER TASK CONTEXT (HIGHEST PRIORITY)" block to the agent task.
- shape_fixer_agent.py: run_shape_fixer / _build_shape_fixer_task accept user_task and prepend the same block to the fixer task, so the post-UTA shape verifier does not undo the UTA's compliance with the user task.

System-prompt rules (the LLM-side half of the change):
- mini_unit_test_agent.yaml: new "HIGHEST PRIORITY" block at the top of agent.system_template instructing the UTA to use shapes/dtypes from a USER TASK CONTEXT block in preference to discovered benchmark file defaults, and to write `user_task:production` to harness_shapes_source.txt.
- mini_shape_fixer.yaml: analogous override so the fixer does not flag a harness as drifting from the SHAPE SOURCE FILE when its shapes match the user task contract instead.

The change is fully backward-compatible: when no user_task is supplied (callers other than `mini -t`) or when the task contains no USER TASK CONTEXT block, both agents fall back to their existing discovery-driven behaviour verbatim.

Tested locally against an SGLang/aiter act_and_mul_kernel run: UTA sees the new context block (grep "USER TASK CONTEXT" in unit_test_agent.log returns hits), and the LLM acknowledges the production shape pins in its first reasoning step instead of mirroring the op-test default sweep.

7 files changed, 95 insertions(+), 1 deletion(-)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90ddc9a9d905`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.