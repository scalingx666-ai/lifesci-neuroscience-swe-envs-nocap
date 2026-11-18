# Issue

**Title:** Increasing minimum nilearn and mapca versions

## Description

My wonderful colleague @javiergcas just crashed tedana immediately after we released a new version. It turns out we are using `nilearn.image.binarize_img` with the `copy_header` parameter:

https://github.com/ME-ICA/tedana/blob/0f234ad165f11801336225731fd733b874af02d7/tedana/reporting/static_figures.py#L682

This parameter was added to nilearn in v0.11.0 and our minimum version was 0.10.3. I don't love pegging our min version to something less than 2 years old, but nilearn seems to change rapidly.

Changes proposed in this pull request:

- Changes the minimum version of nilearn to 0.11.0
- Changes the minimum version of mapca to 0.0.7
  - This is a separate, but related issue with nilearn in mapca

Note: @javiergcas also discovered a related nilearn issue that we fixed in tedana but not mapca. The corresponding fix is here:  We should probably get that into mapca, release a new mapca version, and then update the minimum mapca version as part of this PR before merging.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0f234ad165f1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.