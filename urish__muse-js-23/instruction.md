# Issue

**Title:** chore(deps): bump js-yaml from 3.8.4 to 3.13.1

## Description

Bumps [js-yaml](https://github.com/nodeca/js-yaml) from 3.8.4 to 3.13.1.
<details>
<summary>Changelog</summary>

*Sourced from [js-yaml's changelog](https://github.com/nodeca/js-yaml/blob/master/CHANGELOG.md).*

> ## [3.13.1] - 2019-04-05
> ### Security
> - Fix possible code execution in (already unsafe) `.load()`, .
>
>
> ## [3.13.0] - 2019-03-20
> ### Security
> - Security fix: `safeLoad()` can hang when arrays with nested refs
>   used as key. Now throws exception for nested arrays. .
>
>
> ## [3.12.2] - 2019-02-26
> ### Fixed
> - Fix `noArrayIndent` option for root level, .
>
>
> ## [3.12.1] - 2019-01-05
> ### Added
> - Added `noArrayIndent` option, .
>
>
> ## [3.12.0] - 2018-06-02
> ### Changed
> - Support arrow functions without a block statement, .
>
>
> ## [3.11.0] - 2018-03-05
> ### Added
> - Add arrow functions suport for `!!js/function`.
>
> ### Fixed
> - Fix dump in bin/octal/hex formats for negative integers, .
>
>
> ## [3.10.0] - 2017-09-10
> ### Fixed
> - Fix `condenseFlow` output (quote keys for sure, instead of spaces), , .
> - Dump astrals as codepoints instead of surrogate pair, .
>
>
> ## [3.9.1] - 2017-07-08
> ### Fixed
> - Ensure stack is present for custom errors in node 7.+, .
>
>
> ## [3.9.0] - 2017-07-08
> ### Added
> - Add `condenseFlow` option (to create pretty URL query params), .
>
> ### Fixed
></tr></table> ... (truncated)
</details>
<details>
<summary>Commits</summary>

-  3.13.1 released
-  Browser files rebuild
-  Merge pull request  from nodeca/toString
-  Fix possible code execution in (already unsafe) load()
-  3.13.0 released
-  Browser files rebuild
-  Restrict data types for object keys
-  Fix test name
-  3.12.2 released
-  Browser files rebuild
- Additional commits viewable in [compare view](https://github.com/nodeca/js-yaml/compare/3.8.4...3.13.1)
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=js-yaml&package-manager=npm_and_yarn&previous-version=3.8.4&new-version=3.13.1)](https://help.github.com/articles/configuring-automated-security-fixes)

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