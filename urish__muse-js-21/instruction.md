# Issue

**Title:** chore(deps): bump diff from 3.2.0 to 3.5.0

## Description

Bumps [diff](https://github.com/kpdecker/jsdiff) from 3.2.0 to 3.5.0.
<details>
<summary>Changelog</summary>

*Sourced from [diff's changelog](https://github.com/kpdecker/jsdiff/blob/master/release-notes.md).*

> ## v3.5.0 - March 4th, 2018
> - Omit redundant slice in join method of diffArrays - 1023590
> - Support patches with empty lines - fb0f208
> - Accept a custom JSON replacer function for JSON diffing - 69c7f0a
> - Optimize parch header parser - 2aec429
> - Fix typos - e89c832
>
> [Commits](https://github.com/kpdecker/jsdiff/compare/v3.4.0...v3.5.0)
>
> ## v3.4.0 - October 7th, 2017
> -  - Feature request: ability to specify a custom equality checker for `diffArrays`
> -  - Bug: diffArrays gives wrong result on array of booleans
> -  - diffArrays will not compare the empty string in array?
> - comparator for custom equality checks - 30e141e
> - count oldLines and newLines when there are conflicts - 53bf384
> - Fix: diffArrays can compare falsey items - 9e24284
> - Docs: Replace grunt with npm test - 00e2f94
>
> [Commits](https://github.com/kpdecker/jsdiff/compare/v3.3.1...v3.4.0)
>
> ## v3.3.1 - September 3rd, 2017
> -  - Cannot apply patch because my file delimiter is "/r/n" instead of "/n"
> -  - Fix: Bad merge when adding new files ()
> - correct spelling mistake - 21fa478
>
> [Commits](https://github.com/kpdecker/jsdiff/compare/v3.3.0...v3.3.1)
>
> ## v3.3.0 - July 5th, 2017
> -  - /patch/merge not exported
> - Gracefully accept invalid newStart in hunks, same as patch(1) does. - d8a3635
> - Use regex rather than starts/ends with for parsePatch - 6cab62c
> - Add browser flag - e64f674
> - refactor: simplified code a bit more - 8f8e0f2
> - refactor: simplified code a bit - b094a6f
> - fix: some corrections re ignoreCase option - 3c78fd0
> - ignoreCase option - 3cbfbb5
> - Sanitize filename while parsing patches - 2fe8129
> - Added better installation methods - aced50b
> - Simple export of functionality - 8690f31
>
> [Commits](https://github.com/kpdecker/jsdiff/compare/v3.2.0...v3.3.0)
</details>
<details>
<summary>Commits</summary>

-  v3.5.0
-  Update release notes
-  Update release notes
-  Omit redundant slice in join method of diffArrays
-  Add missing test coverage
-  Support patches with empty lines
-  Support patches with empty lines
-  Support patches with empty lines
-  Support patches with empty lines
-  Support patches with empty lines
- Additional commits viewable in [compare view](https://github.com/kpdecker/jsdiff/compare/v3.2.0...v3.5.0)
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=diff&package-manager=npm_and_yarn&previous-version=3.2.0&new-version=3.5.0)](https://help.github.com/articles/configuring-automated-security-fixes)

Dependabot will resolve any conflicts with this PR as long as you don't alter it yourself. You can also trigger a rebase manually by commenting `@dependabot rebase`.

[//]: # (dependabot-automerge-start)
[//]: # (dependabot-automerge-end)

---

<details>
<summary>Dependabot commands and options</summary>
<br />

You can trigger Dependabot actions by commenting on this PR:
- `@dependabot rebase` will rebase this PR
- `@dependabot recreate` will recreate this PR, overwriting any edits that have been made to it
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot ignore this [patch|minor|major] version` will close this PR and stop Dependabot creating any more for this minor/major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/urish/muse-js/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `72cbd4d388dc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.