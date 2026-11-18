# Issue

**Title:** Add analysis_table property to mixin and docs

## Description

# Description


This pull request introduces a new `analysis_table` property to streamline access to the linked `AnalysisNwbfile` table for analysis and compute table classes. The documentation is updated to recommend using this property, and code examples are refactored to use it, improving clarity and consistency for developers. The changes also include updates to developer documentation and the `SpyglassMixin` class implementation.

Documentation improvements:

* Updated `docs/src/Features/AnalysisTables.md` to recommend using the `analysis_table` property instead of directly referencing `AnalysisNwbfile()`, and refactored all code examples to use `self.analysis_table.build()` for creating and registering analysis objects. [[1]](diffhunk://#diff-96eac1bc5f3cf2bfc3853a1abd0f7f2558cfa550e6d4e976c7eeb81cfd2495aaR43-R47) [[2]](diffhunk://#diff-96eac1bc5f3cf2bfc3853a1abd0f7f2558cfa550e6d4e976c7eeb81cfd2495aaL70-R75) [[3]](diffhunk://#diff-96eac1bc5f3cf2bfc3853a1abd0f7f2558cfa550e6d4e976c7eeb81cfd2495aaL194-R199) [[4]](diffhunk://#diff-96eac1bc5f3cf2bfc3853a1abd0f7f2558cfa550e6d4e976c7eeb81cfd2495aaL385-R390)

Developer experience enhancements:

* Updated `docs/src/ForDevelopers/CustomPipelines.md` to use `self.analysis_table.create()` in example code, ensuring consistency across developer-facing documentation.

Core implementation changes:

* Added the `analysis_table` property to the `SpyglassMixin` class in `src/spyglass/utils/dj_mixin.py`, allowing compute/analysis table classes to easily access their linked `AnalysisNwbfile` table. The property checks the linkage and warns if no table is found.
# Checklist:

<!--
For items below with `if`, please mark those that do not apply with N/A

For example:
- [X] N/A. If this PR X, related item.
- [X] If this PR Y, other item.
- [X] I have updated the `CHANGELOG.md` ...

Alter notes example:
```python
from spyglass.example import Table
Table.alter() # Comment regarding the change
```
-->

- [x] NA If this PR should be accompanied by a release, I have updated the `CITATION.cff`
- [x] NA If this PR edits table definitions, I have included an `alter` snippet for release notes.
- [x] NA If this PR makes changes to position, I ran the relevant tests locally.
- [x] Y If this PR makes user-facing changes, I have added/edited docs/notebooks to reflect the changes
- [x] I have updated the `CHANGELOG.md` with PR number and description.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ed5eef641d18`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.