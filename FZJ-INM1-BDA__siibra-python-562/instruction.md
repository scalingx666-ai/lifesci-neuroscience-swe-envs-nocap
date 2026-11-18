# Issue

**Title:** Maint: `volume.fetch`

## Description

During the last refactoring, this method has been changed a few times, leaving some artifacts and small issue to resolve. This PR addresses these.
- Clean up the code
- Repeat only in case of too many requests
- Check if "resolution_mm" supplied without format and set to NG (this behaviour already existent in `parcellationmap.Map.fetch()` but this is going to be removed as it is not it's job.) (Alternatively, the fetch can fail at, say `NiftiProvider.fetch()` but it is not user's job to know which formats are shipped with different resolutions. And since we decided against resampling nifti images if resolution_mm is supplied, this seems to be the best solution at the moment.)
- `formats` property should only list actual formats otherwise recursion occurs.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `5334047aa042`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.