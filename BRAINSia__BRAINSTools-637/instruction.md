# Issue

**Title:** STYLE: Share one prior lookup across the AtlasDefinition accessors

## Description

**Stacked on #635.** This branch contains #635's commit; review only the last commit, `STYLE: Share one prior lookup across the AtlasDefinition accessors`. The diff shrinks to that one commit once #635 merges.

Seven `AtlasDefinition` accessors (`GetPriorFilename`, `GetWeight`, `GetGaussianClusterCount`, `GetLabelCode`, `GetUseForBias`, `GetIsForegroundPrior`, `GetBounds`) each searched `m_PriorMap` twice with identical copies of the same check, and the second search cannot fail once the first succeeds. The fourteen blocks are replaced by one `FindPrior()` helper that raises the exception, and each accessor returns from it: 19 lines added, 71 removed. No behavior change; the exception for an unknown tissue type is the same one #635 introduces.

<details>
<summary>Tests</summary>

No new tests: this is a refactor and `AtlasDefinitionGTest` (added in #635) already exercises it. `ValidAtlasAnswersEveryAccessor` calls all seven accessors on a valid atlas, and `MissingTissueTypeThrowsFromEveryAccessor` calls each with an unknown tissue type, so the results of the two paths are unchanged. Both pass on #635's code and on this branch.

All 16 BRAINSABC-related gtests pass on macOS Release, and every target builds. The full suite was not rerun for this PR: no registered test reaches `AtlasDefinition` other than `AtlasDefinitionGTest`, and the full suite passed (537/537) on #635.

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Sonnet 5.5) drafted the change; the author reviewed it and ran the tests locally.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `378dda19914d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.