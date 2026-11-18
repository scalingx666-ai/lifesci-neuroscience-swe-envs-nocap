# Issue

**Title:** Replace lfp_factors unordered_map with flat arrays

## Description

## Summary

Replace `CellMapping::lfp_factors` (`std::unordered_map<int, std::vector<double>>`) with two flat contiguous vectors:
- `lfp_segment_ids`: segment IDs (one per compartment)
- `lfp_factors_flat`: all electrode weights in a single allocation (stride = num_electrodes)

Additionally:
- `num_electrodes()` is now derived from the arrays (`lfp_factors_flat.size() / lfp_segment_ids.size()`) — no stored member needed
- `add_segment_lfp_factor()` validates stride consistency on every insertion (mismatched factor count → abort with clear error)
- Renamed `to_report` → `electrode_outputs` in `lfp_calc` for clarity

## Motivation

The unordered_map was never used for random O(1) lookup in the hot path — `lfp_calc` iterates ALL entries sequentially. The hash map introduces:
- ~84 bytes overhead per entry (bucket + inner vector header + heap allocation)
- Pointer chasing and scattered memory in the hot path
- ~3x more memory than needed

The flat layout matches the actual access pattern: sequential iteration with a constant stride.

## Changes

- `nrnsection_mapping.hpp`:
  - Replace `unordered_map<int, vector<double>>` with `vector<int>` + `vector<double>`
  - `num_electrodes()` returns `size_t`, derived from array sizes
  - `add_segment_lfp_factor()` validates stride consistency, returns early on empty factors
- `report_event.cpp`:
  - `lfp_calc` uses index-based iteration over flat arrays
  - Uses `size_t` for loop indices, `const auto` for locals
  - Renamed `to_report` → `electrode_outputs`
- `test/coreneuron/unit/lfp/lfp.cpp`: Update assertion to use `lfp_segment_ids.size()`

## Testing

- nrn `ctest -R lfp` passes
- neurodamus `tox -m local` passes (all envs including scientific LFP tests)
- No behavioral change — purely internal data structure swap
- The `add_segment_lfp_factor` API is unchanged (same signature), so no changes needed in callers

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd201dea82db`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.