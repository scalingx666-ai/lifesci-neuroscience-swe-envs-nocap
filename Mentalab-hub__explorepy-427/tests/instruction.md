# Issue

**Title:** Prevent ASR while impedance mode is active

## Description

Add ImpedanceModeActiveError and guard ASR availability when impedance is running. StreamProcessor gains is_asr_processor_available() which raises ImpedanceModeActiveError if impedance mode is active and otherwise checks the ASR processor initialization. Explore.is_asr_processor_available() now delegates to the stream processor. Also add the new exception import.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01b6e7a17ce8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.