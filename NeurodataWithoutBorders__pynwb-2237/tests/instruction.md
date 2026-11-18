# Issue

**Title:** Make Units.waveform_unit configurable

## Description

.

Updates the nwb-schema submodule to the latest schema dev (2.10.1-alpha), which includes NeurodataWithoutBorders/nwb-schema#707 and NeurodataWithoutBorders/nwb-schema#709.

### Configurable waveform unit (nwb-schema#707)

That PR changes the `unit` attribute of `Units.waveform_mean`, `waveform_sd`, and `waveforms` from a fixed value of `"volts"` to a default value of `"volts"`.

HDMF short-circuits attribute resolution when a spec has a fixed value, so the existing mapping from `Units.waveform_unit` onto the `unit` attribute was never reached. With the schema change it is reachable, so no write-path change was needed.

Also implements the warning placeholder in `UnitsMap._get_waveform_stat`, since a file can now carry different `unit` values across the three waveform columns while the `Units` container holds only one.

### Waveform peak alignment (nwb-schema#709)

That PR adds an optional `time_before_peak_in_ms` attribute to `Units.waveform_mean`, `waveform_sd`, and `waveforms`. It holds the time, in milliseconds, from the start of each waveform to the spike peak, that is, the alignment point used during spike sorting. The value is the same for every unit and every spike.

PyNWB exposes it as the `waveform_time_before_peak_in_ms` constructor argument and field of `Units`, following the existing `waveform_rate` and `waveform_unit` pattern: one value on the container, written onto all three waveform columns, and read back from the first populated column with a warning when the columns disagree.

### `NO_OVERRIDE` in `UnitsMap`

The constructor argument overrides in `UnitsMap` returned `None` to signal "no override". HDMF 6.2.0 deprecates that in favor of the `ObjectMapper.NO_OVERRIDE` sentinel, and under HDMF 8.0 a `None` return will set the constructor argument to `None`, which would clobber the `"volts"` default of `waveform_unit`. They now return the sentinel via the existing `pynwb.io.utils.NO_OVERRIDE` shim.

### Note

`waveform_unit`, `waveform_rate`, and `waveform_time_before_peak_in_ms` can only be set on the `Units` constructor, so they are not reachable from the `nwbfile.add_unit(...)` path that auto-creates the table. Worth addressing separately.

🤖 Generated with [Claude Code](https://claude.com/claude-code)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5101a86519a0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.