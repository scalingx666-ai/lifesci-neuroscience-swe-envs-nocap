# Issue

**Title:** feat: Validate subject directory exists if --fs-no-resume

## Description

This addresses nipreps/fmriprep#3669. The root cause of that issue was that a sessionwise FreeSurfer subject ID was being generated and searched for in an existing FreeSurfer subjects directory that used only the participant label. When combined with `--fs-no-resume`, this led to searching for files in the existing directory, finding none, and then passing empty lists to nodes that expected existing files.

This replaces the resulting inscrutable errors with a `RuntimeError` that clearly indicates the subject ID that was expected. Unfortunately, this happens at workflow runtime, but moving to workflow construction time would be too much of a modification for a patch release.

I believe this is worth bending the patch-release rules, which generally require no changes to workflows. For successful workflows, rerunning should only rerun validation, as it simply passes the values through. The gain in an interpretable error message in an LTS series is worth it, IMO.

@mgxd Do you agree?

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `14d955d85ee4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.