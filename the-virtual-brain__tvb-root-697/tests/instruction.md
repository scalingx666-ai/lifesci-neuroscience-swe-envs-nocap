# Issue

**Title:** CoSimulator exclusive proxy nodes connectivity bug correction

## Description

Corrected bug with setting the CoSimulator.connectivity.weights[proxy_inds][:, proxy_inds] = 0.0
when CoSimulator.exlusive = True (default behavior)
The above line was doing nothing...
The correct one uses np._ix

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8eb997a077f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.