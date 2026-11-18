# Issue

**Title:** Refactor mini CLI, add kernel auto-discovery and budget-timeout patch selection

## Description

## Summary
  - **Simplify mini CLI flags**: Replace `--apply-best-patch`, `--no-cleanup`, and `--keep-runs` with a single `--debug` flag that disables post-run patch apply and artifact cleanup
  - **Kernel auto-discovery**: When `--kernel-url` is not provided but `--repo` is, automatically run the `codebase-explore` subagent to discover kernel files, removing the hard requirement for a kernel URL        
  - **Budget-timeout select_patch**: When the run is interrupted by budget, run an LLM-based `SelectPatchAgent` across all completed rounds to pick the best patch, instead of relying solely on deterministic        
  finalization                                                                                                                                                                                                        
  - **Propagate agent config to subagents**: Pass `disabled_tools` and `use_skills` from the top-level agent to dispatched subagents via environment variables (`GEAK_DISABLED_TOOLS`, `GEAK_USE_SKILLS`)             
  - **Simplify cleanup**: Replace aggressive artifact pruning with worktree-only cleanup; remove `prune_old_runs` entirely                                                                                            
  - **Enable skills by default**: Set `use_skills: True` in `geak.yaml`                                                                                                                                               
  - **Remove dirty-repo guard**: Drop the `skipped_dirty` check that blocked patch apply when the repo had uncommitted changes; instead commit only patch-affected files                                              
                                                                                                                                                                                                                      
  ## Changes                                                
  | File | What changed |                                                                                                                                                                                             
  |------|-------------|                                    
  | `mini.py` | Replace `--apply-best-patch/--no-cleanup/--keep-runs` with `--debug`; relax kernel_url requirement when `--repo` is set; propagate `disabled_tools`/`use_skills` via env vars; remove `prune_old_runs`
   call |                                                                                                                                                                                                             
  | `unified.py` | Add `_run_timeout_select_patch()` for budget-interrupted runs; invoke after `finalize_run` when budget stopped |                                                                                   
  | `adapter.py` | Add codebase-explore subagent integration (`_run_codebase_explore`, `_find_codebase_explore_prompt`, etc.); make `kernel_url` optional |                                                           
  | `dispatch.py` | Read `GEAK_DISABLED_TOOLS` / `GEAK_USE_SKILLS` env vars and inject into subagent config |                                                                                                         
  | `finalize_apply.py` | Remove artifact pruning logic, `prune_old_runs`, dirty-repo guard; simplify cleanup to worktree removal only; commit only patch-affected files |                                            
  | `geak.yaml` | `use_skills: True` |                                                                                                                                                                                
  | `task_parser.py` | Add helper for task content parsing |                                                                                                                                                          
  | `prompts.py` | Minor prompt adjustments |

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f78a5da7d9fe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.