# Issue

**Title:** BF: refix the select_roi indexing

## Description

My original indexing fix only worked for selection of one ROI.

Add new tests from the example from which I found the error.

The example was::

    python examples/labs/need_data/demo_blob_from_image.py

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `32ffcd649f3e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.