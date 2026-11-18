# Issue

**Title:** Bump jquery from 3.4.1 to 3.5.0

## Description

Bumps [jquery](https://github.com/jquery/jquery) from 3.4.1 to 3.5.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7a0a850</code></a> 3.5.0</li>
<li><a href=""><code>8570a08</code></a> Release: Update AUTHORS.txt</li>
<li><a href=""><code>da3dd85</code></a> Ajax: Do not execute scripts for unsuccessful HTTP responses</li>
<li><a href=""><code>065143c</code></a> Ajax: Overwrite s.contentType with content-type header value, if any</li>
<li><a href=""><code>1a4f10d</code></a> Tests: Blacklist one focusin test in IE</li>
<li><a href=""><code>9e15d6b</code></a> Event: Use only one focusin/out handler per matching window &amp; document</li>
<li><a href=""><code>966a709</code></a> Manipulation: Skip the select wrapper for &lt;option&gt; outside of IE 9</li>
<li><a href=""><code>1d61fd9</code></a> Manipulation: Make jQuery.htmlPrefilter an identity function</li>
<li><a href=""><code>04bf577</code></a> Selector: Update Sizzle from 2.3.4 to 2.3.5</li>
<li><a href=""><code>7506c9c</code></a> Build: Resolve Travis config warnings</li>
<li>Additional commits viewable in <a href="https://github.com/jquery/jquery/compare/3.4.1...3.5.0">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~mgol">mgol</a>, a new releaser for jquery since your current version.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=jquery&package-manager=npm_and_yarn&previous-version=3.4.1&new-version=3.5.0)](https://help.github.com/articles/configuring-automated-security-fixes)

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
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bioimagesuiteweb/bisweb/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3357ef726506`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.