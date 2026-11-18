# Issue

**Title:** Cosim coupl monitor

## Description

Added some property methods in CoSimulator class to compute existing_connections, min_idelay and min_delay.
Added also relative_output_time_steps to be able to get delayed outputs from monitors from further in the past, e.g., from 2*synchronization_time in the past.

Modified the CosimCouplingMonitor to be able to provide future values up to min_idelay steps instead of synchronization_n_step.

Modified the CosimHistory to have a length of TVB min_idelay instead of synchronization_n_step.

Allowing negative relative time steps for the loop_cosim_monitor_output method of CoSimunlator, in order to be able to send the TVB state or the initial condition to the other co-simulator from further in the past, , e.g., from 2*synchronization_time in the past.

This was necessary to allow for sending to the transformers future values of the period 
[current_step + min_idelay/2, current_step+min_idelay] 
to be processed  in parallel with current cosimulation
 [current_step, current_step + min_idelay/2],
 assuming that synchronization_n_step = min_idelay/2.

This will work in settings where Transformers can run in parallel with the CoSimulators.

All cosimulation tests PASS.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4660042aa8a4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.