# Issue

**Title:** ENH: Further QoL improvements for template scripts

## Description

Changed some parsing / printing behavior, fixing #1932 and also making the scripts behave better with spaces in file names.

**PR summary**

This PR improves portability and reliability of the maintained multivariate template construction scripts.

Changes
- Replace echo with printf when writing commands, filenames, and generated job scripts.
  - Avoids implementation-dependent escape and option handling.
  - Uses real newline characters in assembled command strings.
- Make -p repeatable.
  - Each occurrence adds one line to generated job scripts.
  - Lines are written in the order supplied.
  - Documents the shell interpreters used for Slurm, SGE, and PBS scripts.
- Improve image filename handling.
  - Preserves internal periods in names such as somefile.something.nii.gz.
  - Supports compressed and uncompressed formats including .nii, .nii.gz, .mha, .nrrd, .mnc, and .mnc.gz.
- Improve ANTSpexec.sh interruption handling.
  - Handles both SIGINT and SIGTERM.
  - Terminates the complete descendant process tree.
  - Sends TERM, allows a three-second grace period, and sends KILL to remaining processes.
  - Returns conventional exit statuses 130 and 143.
  - Initializes killme.sh cleanly and quotes its path.
  - Updates help text to describe automatic cleanup.
- Simplify template-script Ctrl-C handlers.
  - Pexec now owns cleanup of processes it starts.
  - Template scripts report cancellation and exit with status 130.
  - Removes the non-portable GNU-only ps --ppid cleanup code.
- Quote filename-list output in shapeupdatetotemplate.sh.
- Simplify process checking in ANTspexec.sh
  - use portable `kill -0`, avoiding running multiple commands on Mac
  - Document that -j controls parallel processes, not strictly "cores"
  - poll less aggressively (2s vs 0.5s) to further minimize system overhead
  
  
The main change is that `-p` is now repeatable, which should make it easier for cluster users to add prepends to job scripts. Before, it wasn't clear how multi-line commands would work and the script was inconsistent about use of `echo` or `echo -e`. I hope it will be easier to send multiple commands now. 

I also documented the hard-coded interpreting shells, `/bin/sh` for slurm and `/bin/bash` for SGE / PBS, because this also  affects what you can send in a `-p` argument.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d92f933e4b8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.