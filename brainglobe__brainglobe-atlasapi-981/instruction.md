# Issue

**Title:** Add the momap mouse motor cortex atlas packaging script.

## Description

## Description

**What is this PR**

- [ ] Bug fix
- [ ] Addition of a new feature
- [x] Other

Addition of a new atlas: the momap mouse motor cortex atlas (`allen_mouse_momap_10um`).

**Why is this PR needed?**

The momap atlas (projection-defined modules of mouse motor cortex; Falasconi and Kanodia et al., 2026, https://doi.org/10.1016/j.cell.2026.08.046) is not yet available through BrainGlobe. This adds the packaging script and registers the atlas name so it can be built and distributed like the other atlases.

**What does this PR do?**

- Adds `atlas_scripts/allen_mouse_momap.py`. The source data is a single public Zenodo archive (https://zenodo.org/records/21104472) that already contains the reference, the annotation, the structure list, and one mesh per structure. The script downloads that archive and passes it to `wrapup_atlas_from_data`.
- Registers `allen_mouse_momap_10um` in `brainglobe_atlasapi/atlas_name.py`.

## References

No existing BrainGlobe issue. Source data and citation:

- Falasconi and Kanodia et al., 2026. https://doi.org/10.1016/j.cell.2026.08.046
- Zenodo record: https://zenodo.org/records/21104472

## How has this PR been tested?

The packaging script was run locally on Windows and produced an atlas archive.

On Windows, cloud-files 6.4.2 crashes before wrapup writes anything. It times every transfer with `time.monotonic()`, which on Windows is `GetTickCount64()` (resolution 15.625 ms). Any I/O that finishes inside one tick gets `start_us == end_us`, and `IntervalTree` refuses that zero-length interval. `CloudVolume(...)` then raises while reading its absent `provenance` file:

`ValueError: IntervalTree: Null Interval objects not allowed in IntervalTree: Interval(1129100593000, 1129100593000, [UUID(...), 0])`


The atlas was packaged by running the script through a local wrapper that is not part of this pull request. The wrapper only patches cloud-files in memory: it points those clock reads at `time.perf_counter()` and floors each interval at 1 µs. It does not modify site-packages or `allen_mouse_momap.py`. On Linux `time.monotonic()` should already resolve to about 1 ns, so the bug cannot trigger there and the atlas script can be run directly.

## Is this a breaking change?

No.

## Does this PR require an update to the documentation?

No documentation change in this repository. `allen_mouse_momap_10um` will show up in the public atlas list once the packaged archive is hosted and `last_versions.conf` is updated.

## Checklist:

- [x] The code has been tested locally
- [ ] Tests have been added to cover all new functionality (unit & integration)
- [ ] The documentation has been updated to reflect any changes
- [ ] The code has been formatted with [pre-commit](https://pre-commit.com/)

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e0f50cf9e1c9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.