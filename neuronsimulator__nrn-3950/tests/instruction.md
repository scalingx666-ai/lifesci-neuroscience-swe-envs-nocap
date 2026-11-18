# Issue

**Title:** LFP: summed reports, and each report's electrodes numbered from 0

## Description

An LFP report writes each cell's contribution to each electrode, so it is larger than what the electrodes record by the number of cells. With 16 electrodes recorded at 10 kHz, it is 3.1 GB per simulated second for 4,870 cells and 19.3 GB for 30,190, where the electrodes' signal is 0.64 MB.

This adds a summed mode:
- report.conf can end a report's line with a method: `by_cell` (the default, today's layout) or `sum`. A line without one, as written until now, still reads as `by_cell`.
- CoreNEURON computes the cells' values as it does for a per-cell report, and asks libsonatareport for the kind `lfp_sum`, which sums them and writes, for each population of the report's cells, one trace per electrode.
- If libsonatareport can't create a summed report, as one without that kind can't, the run stops rather than leaving the report out. Other kinds are unchanged.

The kind `lfp_sum` is openbraininstitute/libsonatareport#10, not merged or released yet, so a summed report needs that libsonatareport; `by_cell` reports work with any. The summed file layout is specified in openbraininstitute/sonata-extension#51, libsonata parses `method` in openbraininstitute/libsonata#74, and neurodamus writes it to report.conf in openbraininstitute/neurodamus#595.

The idea of adding the cells up per electrode, then the ranks, comes from Jorge Blanco Alonso's branch `jblanco/lfp_sum_cells`.

## Also in this PR
The first commit numbers each LFP report's electrodes from 0.
- **Before:** with several LFP reports, a report's element ids were its electrodes' positions among all reports' electrodes. A report of 2 electrodes after one of 3 wrote ids 3 and 4, and a cell missing from an earlier report's electrodes file numbered them from another start.
- **Now:** each report's event also computes only its own electrodes, rather than every report's.

## Tests
- **Unit tests** (`test/coreneuron/unit/lfp`): a second LFP report reads its own electrodes and numbers them from 0.
- **Through neurodamus,** in the OBI neurodamus image, with this branch's NEURON and that libsonatareport:
  - The ringtest (2 populations, 5 cells) with three pairs of LFP reports, each a per-cell and a summed report of the same electrodes: all cells, with 2 and 3 electrodes in the two populations; a single cell, at a report dt of 0.5 ms from 1 ms; RingA from 5 to 15 ms.
  - It ran on 1, 2 and 6 ranks, and on 1 and 2 ranks with the model built in 2 or 3 steps. Every summed report equals its per-cell twin summed over cells, to 1.2e-7 (the per-cell values' float32 rounding), and the summed reports are the same across all runs.
  - neurodamus's report tests (`test_reports.py`, compartment sets included, and the direct-mode reports test) pass.
- **Cost:** on 8 local ranks, a summed report took no more solver time than a per-cell one (17.5 s against 23.0 s at 1,024 electrodes) and writes a file smaller by the number of cells.
- **Formatting:** clang-format 12.0.1 leaves the changed files as they are.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dfd44cec76e9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.