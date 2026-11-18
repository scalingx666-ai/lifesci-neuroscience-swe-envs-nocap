# Issue

**Title:** ENH: Add timing metadata to GIFTI exports

## Description

#### Reference issue (if any)

None.


#### What does this implement/fix?

Add timing information to the GIFTI files written by
`SourceEstimate.save_as_surface()`.

The exported time-series images now include the start time, time step, units,
and number of samples. Each data array also includes its sample index, time
value, units, and a readable time label.

This allows programs reading the GIFTI files to recover the original
`SourceEstimate` time axis. The data layout, GIFTI intents, filenames, and
numeric values are unchanged.

The existing test now checks the metadata in both hemispheres and verifies that
the exported data values are unchanged.


#### Additional information

`pytest mne/tests/test_source_estimate.py::test_save_stc_as_gifti --verbose`

I also tested the exported files with AFNI/SUMA/Sumaru. SUMA reads the files normally,
uses `TimeStep` as its time-series interval, and displays the per-array `Name`
values as column labels.  Sumaru uses these data to show source time courses
on selected vertices and allows thresholds of absolute values. 

I used OpenAI Codex to formalize/implement my code mockup, and modify the tests. 
All changes reviewed on my own data and ran the tests locally.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec30cd2f1593`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.