# Issue

**Title:** Upload to PyPI.

## Description

We successfully tested the publish workflow (#81) with TestPyPI, though it required merging #81 first to be able to trigger it.
- https://github.com/UNFmontreal/Dcm2Bids/runs/1426825033?check_suite_focus=true
- https://test.pypi.org/project/dcm2bids/2.1.4rc2/

This follow up points it at the real PyPI.

In order to make the change work, it also bumps the version number. I only incremented the patch version number; I'm not sure if this is correct because I haven't looked at what has changed since 2.1.4. Maybe this should be released as 2.2.0 instead?
Additionally, in order to make the workflow actually run, the code needs to be triggered by going to https://github.com/UNFmontreal/Dcm2Bids/releases, Drafting a new release, then Publishing the new release.

I believe @arnaudbore already put the `PYPI_PASSWORD` credential into this repo's secrets, so as soon as this goes it should Just Work.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `52fc58050b78`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.