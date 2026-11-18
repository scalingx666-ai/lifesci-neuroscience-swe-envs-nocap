# Issue

**Title:** Read the ragged index before the data when loading NWB table properties

## Description

When `NwbSortingExtractor` builds a sorting it loads every Units-table column as a per-unit property, and for a ragged column it read the whole column and only then checked whether the per-unit lengths were equal, discarding the data when they were not. Ragged columns are frequently per-spike (spike amplitudes, spike depths), as long as the entire spike vector, so on a real session this meant streaming hundreds of megabytes only to throw them away. The waste is nearly invisible on local disk but severe over a network file, where each discarded column becomes many range requests; for a typical IBL session this was about 330 MB of pointless reads (two roughly 20-million-long per-spike columns that were always skipped). Whether a ragged column can even be a per-row property is fully determined by its index, which is only `num_rows` values, so this reads the small index first and returns early without ever materializing the data of a column it is going to skip. I folded this into a single `_read_table_property` helper shared by both the Units (sorting) and electrodes (recording) property paths, so the electrodes side is also hardened against a ragged column rather than reading it wholesale.

While here I removed the per-column "unequal shapes" warning. It fired on essentially every real sorting file, because per-spike columns are universal, reported correct and expected behavior, and offered the user nothing to act on, so it was noise rather than a warning; skipping a ragged non-per-unit column is now silent and documented in the code. There is no behavior change to what gets loaded: the same columns become properties and the same ones are skipped, only the skipped ones are no longer read first. The existing `test_sorting_extraction_of_ragged_arrays` already covers that a non-uniform ragged column is skipped and a uniform one is loaded on both the pynwb and hdf5 paths.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `38509ec511aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.