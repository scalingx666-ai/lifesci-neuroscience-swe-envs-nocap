# Issue

**Title:** fix(e2e): remove forced high-priority-GEMM head reordering (HEAD_PRIORITY)

## Description

## What
                                                                                                                                                                      
  Removes the `HEAD_PRIORITY` mechanism introduced in #304, which force-reordered the
  head-kernel queue to optimize GEMM first.                                                                                                                           
                                                                                                                                                                      
  In FAST_MODE, when `head_priority` was set (e.g. `head_priority="gemm"`), matching head
  ops were pulled to the **front** of the head queue *before* the budget slice, so the
  dense/scaled-GEMM head was guaranteed to be selected and integrated/stacked first —
  overriding the Architect's Amdahl ranking.                                        
                                                                                    
  This PR drops that logic so head ops are processed strictly in the order the System
  Architect ranks them (by `pct_gpu_time × achievable_speedup`), with no hard-coded 
  GEMM-first bias.                        
                                                                                    
  ## Changes
                                                                                    
  `e2e_workflow/e2e_workflow.js` only (+2 / −18):                                   
  - Remove the `HEAD_PRIORITY` constant + its comment block.
  - Remove the FAST_MODE head-queue reordering block; head selection is now simply  
    `headQueue.slice(0, HEAD_BUDGET)` in Amdahl order.
                                          
  ## Why
                                                                                    
  Forcing GEMM to the front is a hard-coded heuristic that pre-empts the Architect's
  per-run prioritization. Different workloads/regimes don't always want GEMM optimized
  first; the queue should reflect the measured Amdahl priority, not a fixed op-kind rule.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f9e829c5be3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.