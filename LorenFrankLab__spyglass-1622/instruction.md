# Issue

**Title:** Version bump for release

## Description

# Description

This PR version bumps to `0.6.0` given the breaking changes. 

Function deprecation is postponed to `0.6.1`, planned for the end of the month.

<details><summary>Release Notes alter block</summary>

```python
# Alter Decoding v1 table
from spyglass.common.common_filter import FirFilterParameters
from spyglass.decoding.v1.core import DecodingParameters

FirFilterParameters().alter()
DecodingParameters().alter()

# Alter v0 recompute table
from spyglass.spikesorting.v0.spikesorting_recompute import (
    RecordingRecompute,
    RecordingRecomputeSelection,
    RecordingRecomputeVersions,  # noqa F401
    UserEnvironment,  # noqa F401
)

RecordingRecomputeSelection().alter()
RecordingRecompute().alter()

# Alter v1 recompute table
from spyglass.spikesorting.v1.recompute import (
    RecordingRecompute,
    RecordingRecomputeSelection,
    RecordingRecomputeVersions,  # noqa F401
    UserEnvironment,  # noqa F401
)

RecordingRecomputeSelection().alter()
RecordingRecompute().alter()


# Fix LFPBandV1 issue #1481
from spyglass.lfp.analysis.v1 import LFPBandV1

LFPBandV1().fix_1481()

# Increase DLCProject.config_path length
from spyglass.position.v1.position_dlc_project import DLCProject

DLCProject().alter()
```

</details>

# Checklist:

- [X] If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [X] N/a. If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [X] N/a. If this PR makes changes to position, I ran the relevant tests locally.
- [X] N/a. If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [X] I have updated the `CHANGELOG.md` ~~with PR number and description.~~

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `de09a672b1d0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.