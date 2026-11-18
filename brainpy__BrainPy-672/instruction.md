# Issue

**Title:** [math] Add getting JIT connect matrix method for `brainpy.dnn.linear`

## Description

Add getting JIT connect matrix method `brainpy.math.jitconn.get_connect_matrix` for getting the dense connect matrix in the procedure of jitconn opeartors.
Add function `get_connect_matrix` for `JitFPHomoLinear`, `JitFPUniformLinear`, `JitFPNormalLinear`, `EventJitFPHomoLinear`, `EventJitFPUniformLinear` and `EventJitFPNormalLinear` in the module `brainpy.dnn.linear`

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e3a854af9589`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.