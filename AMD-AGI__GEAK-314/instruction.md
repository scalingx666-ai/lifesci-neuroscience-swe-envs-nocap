# Issue

**Title:** feat(e2e/kernel): 3-layer cuda-graph-safe robustness for head-kernel integration

## Description

## Problem                                                                                                                                                                                                                                  
                                                                                                                                                                                                                                              
  When a head-kernel optimization is stacked into TP>1 serving, vLLM/sglang capture the                                                                               
  decode path into a CUDA/HIP graph. A kernel that **passes the isolated oracle but breaks                                                                            
  under graph capture** then crashes the live server:                                                                                                                 
                                                                                                                                                                      
  - a JIT/DSL kernel (flydsl, autotuned Triton, CK-JIT) that **lazily compiles a config it                                                                            
    hasn't built yet during the live warmup forward** fails the on-device module load                                                                                 
    (`hipErrorNoBinaryForGpu` / `CUDA_ERROR_NO_BINARY_FOR_GPU`), or                                                                                                                                                                           
  - a host sync / host control flow inside the captured region                                                                                                        
    (`hipErrorStreamCaptureUnsupported`).                                                                                                                             
                                                                                                                                                                      
  The trap: the **single-process isolated unittest compiles & loads fine**, so iso passes                                                                             
  with a large speedup, and only the e2e serving gate catches it — after a full A/B crash                                                                             
  (`cuda_graph_capture_unsafe` / `NO_BINARY_FOR_GPU`, 0 bench samples, gate=rejected).                                                                                
                                                                                                                                                                      
  ## Fix — 3 layers, all opt-in/gated (default behavior byte-identical)                                                
                                                                                                                                                                                                                                              
  **① PREVENT — catch it at the cheap isolated stage**                                                                                                                                                                                        
  - `kernel_workflow.js`: when e2e sets `op_spec.cuda_graph_safe===true`, derive                                                                                                                                                              
    `REQUIRE_GRAPH_CAPTURE` and pass it to the verify role (+ a `graph_safe` schema field).                                                                                                                                                   
  - `roles/verify_engineer.md`: gated **graph capture+replay smoke** — warm once (first-call                                                                                                                                                  
    JIT happens outside capture), capture the 2nd call into `torch.cuda.graph`, replay 3×,                                                                                                                                                    
    compare to eager. FAIL → `correctness_failed` if (a) capture raises (host sync / branch                                                                                                                                                   
    on GPU scalar), (b) a new kernel JIT-compiles at capture time (NO_BINARY under TP>1), or                                                                                                                                                  
    (c) replay diverges. Pure-config candidates → `graph_safe:"n/a"`.                                                                                                                                                                         
                                                                                                                                                                                                                                              
  **② RECOVER — fix it cheaply if it slips to the e2e gate**                                                                                                                                                                                  
  - `e2e_workflow.js`: `tryCorrectiveReauthor()` — on a fixable e2e reject (or a                                                                                                                                                              
    crash-during-warmup, `ab_complete=false`) of a verified iso-winner, spend one targeted                                                                                                                                                    
    re-optimize of the *existing* kernel (keep the algorithm/iso win, fix only the integration                                                                                                                                                
    posture) and re-gate. **Not charged to `HEAD_BUDGET`**; bounded by `HEAD_CORRECTIVE_MAX`                                                                                                                                                  
    (default 2, 0 disables); track-agnostic; wired at all 5 reject/crash sites (default head                                                                                                                                                  
    reject + crash, milestone, deep generic, deep serial).                                                             

  **③ Knowledge — the reusable rule**                      
  - `knowledge/learned/method-cudagraph-safe-integration.md`: generalized to ANY JIT kernel                                                                                                                                                   
    (flydsl/triton/CK-JIT), ROCm+CUDA no-binary errors. Core rule: **precompile/register every                                                                                                                                                
    (shape-bucket × config) the live workload hits — prefill AND decode buckets — at warmup                                                                                                                                                   
    before capture**, so all TP workers load a prebuilt binary instead of each racing a lazy                                                                                                                                                  
    compile. "Anything the kernel can compile at runtime must be compiled at warmup; never                                                                                                                                                    
    lazily on the hot or warmup-forward path."                                                                                                                                                                                                

  ## Validation                                            

  End-to-end on MiniMax-M3-MXFP8 (vLLM TP=4, gfx950): all 4 banked overlays graph-capture-safe,                                                                                                                                               
  **zero warmup crashes**, **+28.3% e2e** (director-validated, gsm8k parity 0.925==0.925). Both                                                                                                                                               
  JS files pass `node --check`. Contrast the prior run on the same model where an iso-4.01×                                                                                                                                                   
  flydsl kernel crashed at capture → 0 banked.                                                                         

  ## Notes                                                 
  - Every change is gated behind a new opt-in flag (`op_spec.cuda_graph_safe`,                                                                                                                                                                
    `head_corrective_max`); with them off, default/fast/deep modes are byte-identical.                                                                                                                                                        
  - Branches off latest `GEAK_v4` (incl. the merged TraceLens wiring #312); upstream                                                                                                                                                          
    `HEAD_PRIORITY` fast-mode feature preserved (3-way merged).

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a83ff01bb2ad`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.