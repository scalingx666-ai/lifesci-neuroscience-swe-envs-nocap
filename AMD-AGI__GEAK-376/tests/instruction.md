# Issue

**Title:** Harden workflow prompts to require args as a JSON object

## Description

The e2e/kernel workflows are driven by an LLM agent that relays args into the Workflow tool. When the agent passes args as a JSON-encoded string instead of a real object, the JS reads args.workflow_dir off a string (undefined), so WORKFLOW_DIR is empty and the workflow aborts immediately.

Add explicit guidance at both prompt entry points that args must be a real JSON object, not a stringified one:
- interface/run_e2e.py build_prompt: CRITICAL note in the Workflow invoke instructions
- kernel_workflow/README.md: IMPORTANT note in the invocation block

Prompt-only fix; the workflow JS files are left untouched (kernel_workflow is the immutable single-kernel layer).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `576e183f503f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.