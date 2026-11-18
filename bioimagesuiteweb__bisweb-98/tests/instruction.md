# Issue

**Title:** Bump bootstrap from 3.4.0 to 3.4.1

## Description

Bumps [bootstrap](https://github.com/twbs/bootstrap) from 3.4.0 to 3.4.1.
<details>
<summary>Release notes</summary>

*Sourced from [bootstrap's releases](https://github.com/twbs/bootstrap/releases).*

> ## v3.4.1
> * **Security:** Fixed an XSS vulnerability (CVE-2019-8331) in our tooltip and popover plugins by implementing a new HTML sanitizer
> * Handle bad selectors (`#`) in `data-target` for Dropdowns
> * Clarified tooltip selector documentation
> * Added support for NuGet contentFiles
</details>
<details>
<summary>Commits</summary>

-  Dist
-  handle # selector for dropdown
-  Bump version to 3.4.1.
-  Backport sanitize docs from v4.
-  Add wdm gem for Windows.
-  ES5 fixes.
-  Add sanitize for tooltips and popovers html content.
-  Bump year.
-  less/modals.less: Add missing semicolon.
-  Use https.
- Additional commits viewable in [compare view](https://github.com/twbs/bootstrap/compare/v3.4.0...v3.4.1)
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=bootstrap&package-manager=npm_and_yarn&previous-version=3.4.0&new-version=3.4.1)](https://help.github.com/articles/configuring-automated-security-fixes)

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

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bioimagesuiteweb/bisweb/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a75768459d1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.