# Issue

**Title:** [biobank] Fix projectId type error, filter lag and container tooltips

## Description

## Description

These changes were made directly in aces/biobank for CBIGR, deployed and tested there, and are ported to core together because they went out together. That is why one PR covers three separate issues.

`Specimen::fromArray()` and `Pool::fromArray()` pass the `projectId` from the request straight to `setProjectId()`, which takes a `\ProjectID`, so any data that carries a `projectId` throws a TypeError.

The specimen and pool tabs search the whole candidate list for every cell they render, and typing in a filter re-renders the table, so the text box falls behind on a large biobank.

The container matrix marks its cells with `data-toggle="tooltip"`, but nothing initializes Bootstrap tooltips on the page, so hovering a cell shows nothing.

## Changes
- Wrapped `projectId` in `new \ProjectID(strval(...))` in both `fromArray()` methods.
- The specimen and pool tabs build a lookup of candidates by PSCID once per render, and the specimen tab does the same for container barcodes.
- Initialized the matrix tooltips in a `useEffect`.

## Related Issues

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a40ffe7695b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.