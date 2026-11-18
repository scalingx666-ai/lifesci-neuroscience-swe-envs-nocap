# Issue

**Title:** Add vertex number to GiFTI export in SourceEstimate.save_as_surface()

## Description

## Summary

`SourceEstimate.save_as_surface()` currently loses the original vertex numbers when it exports a decimated surface. This makes it difficult to place the exported data back onto the matching full-resolution surface.

This PR adds the parent vertex IDs, hemisphere, parent vertex count, and subject name (when available) to both the anatomical and time-series GIFTI files. The metadata is stored once per file, so the time-series file can be interpreted without its anatomical companion. For FreeSurfer-derived source spaces, these are the original FreeSurfer vertex numbers.

The exporter also checks that the source-estimate vertices match the source space in both values and order, and raises an error before writing if they differ. The existing test fixture exposed a mismatch that previously went unnoticed.

Geometry, data values, scaling, filenames, array intents, and the existing time metadata are unchanged. The mapping uses documented `MNEParent*` metadata keys rather than a `NODE_INDEX` array, preserving the files’ current indexing semantics.

## Testing

Extended the existing export test to check both hemispheres, matching metadata in anatomical and time-series files, missing subject information, geometry and data ordering, time metadata, and rejection of mismatched vertices. Both parametrized cases pass, along with lint, formatting, and docstring checks.

## AI assistance

I used OpenAI Codex to help investigate GIFTI conventions and reader behavior, implement changes, and extend tests. I tested on my own data with both SUMA and Sumaru.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `146a78b93238`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.