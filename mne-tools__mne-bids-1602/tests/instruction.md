# Issue

**Title:** ENH: add keywords parameter to make_dataset_description

## Description

.

Add a ``keywords`` parameter to ``make_dataset_description`` so users can populate the BIDS ``Keywords`` field directly instead of post-patching ``dataset_description.json``.

```python
make_dataset_description(
    path=root, name="my-dataset",
    keywords=["eeg", "motor-imagery"],  # or "eeg, motor-imagery"
)
```

Accepts list / comma-separated str / ``None``, matching the neighbouring list-valued params.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72864570e4f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.