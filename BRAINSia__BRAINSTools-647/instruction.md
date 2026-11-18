# Issue

**Title:** STYLE: Remove unused AtlasCropImageSource and simpleEM

## Description

Remove `AtlasCropImageSource` and `simpleEM`, which have not compiled or been built in years.

<details>
<summary>What changed and how it was verified</summary>

`AtlasCropImageSource.hxx` calls `ImageRegion::size()`, which does not exist (it is `GetSize()`); nothing instantiates the template, so the compiler never reports it. Its only user, `BRAINSABC/TestSuite/simpleEM.cxx`, appears in no CMakeLists.txt. Four files deleted; a stale `simpleEM` mention in a comment in `ESLR.xml` is left alone.

Verified locally on macOS (AppleClang, Release inner build): full `ninja` build and full `ctest` with no new failures against `main`. `pre-commit run --all-files` passes.

</details>

<details>
<summary>AI disclosure</summary>

The dead code was found by a refactoring agent that tried to instantiate the template; the removal was made with assistance from Claude Code. The author reviewed every hunk and is accountable for the code.

</details>

<!--
provenance: claude-code session 2026-10-28
post_merge_action: none; independent of the other style/fix PRs opened the same day
-->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `60b069efa672`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.