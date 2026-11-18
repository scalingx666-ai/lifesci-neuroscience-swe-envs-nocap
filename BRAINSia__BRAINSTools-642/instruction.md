# Issue

**Title:** STYLE: Advance the template parsers' cursor without modifying a for index

## Description

The `--posteriorTemplate` and `--outputVolumes` parsers added in #634 and #640 consumed the characters of a conversion by incrementing their `for` counter inside the loop body. CodeQL reports this (`cpp/loop-variable-changed`, five results). Both now use a `while` loop with an explicit cursor, and `ExpandOutputVolumeTemplate` formats the zero-padded index with `std::to_string` and padding instead of `snprintf`, so it no longer needs `<cstdio>`. Behavior is unchanged.

<details>
<summary>Verification</summary>

- The existing tests pass without modification: `OutputVolumeTemplateGTest` (13) and `PosteriorFilenameTemplateGTest` (7), which cover substitution, padding up to `%099d`, literal `%%`, either order, a 10,000-character name, and every rejected form. Together with the `AtlasDefinition` and `BlendImage` tests that is 33/33; every target builds.
- Re-ran CodeQL's `cpp/loop-variable-changed` query on a database traced from a recompile of these headers: 0 results. The same query on the database from `main` (`c00efda8`) reports exactly the five (`OutputVolumeTemplate.h` lines 44, 61, 65, 72 and `PosteriorFilenameTemplate.h` line 57), so the check does detect them.
- The full suite was not rerun: only these two headers changed, and the only code that includes them is `BRAINSABC.cxx` and these two tests. `BRAINSABC` needs `USE_AutoWorkup` and `USE_ReferenceAtlas`, which the CI recipe turns off, so CI does not build the change.

</details>

<details>
<summary>AI assistance disclosure</summary>

Claude Code (Sonnet 5.5) rewrote the loops and ran the CodeQL check; the author reviewed the change.

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c00efda8c97c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.