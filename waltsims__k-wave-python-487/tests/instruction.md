# Issue

**Title:** Bump coverage from 7.6.3 to 7.6.4

## Description

Bumps [coverage](https://github.com/nedbat/coveragepy) from 7.6.3 to 7.6.4.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/nedbat/coveragepy/blob/master/CHANGES.rst">coverage's changelog</a>.</em></p>
<blockquote>
<h2>Version 7.6.4 — 2024-10-20</h2>
<ul>
<li>fix: multi-line <code>with</code> statements could cause contained branches to be
incorrectly marked as missing (<code>issue 1880</code>_).  This is now fixed.</li>
</ul>
<p>.. _issue 1880: <a href="">nedbat/coveragepy#1880</a></p>
<p>.. _changes_7-6-3:</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f24f76b</code></a> docs: sample HTML for 7.6.4</li>
<li><a href=""><code>96e10f7</code></a> docs: prep for 7.6.4</li>
<li><a href=""><code>b8c236a</code></a> fix: multi-line with-statements exit correctly. <a href="">#1880</a></li>
<li><a href=""><code>64b7a45</code></a> docs: another discord reference</li>
<li><a href=""><code>68d7427</code></a> docs: Python Discord</li>
<li><a href=""><code>43adcea</code></a> build: include 3.14 in the usual Pythons</li>
<li><a href=""><code>fb2b49f</code></a> build: github_releases can update older releases, and pauses to get the sorti...</li>
<li><a href=""><code>ca550ca</code></a> 3.0b2 wasn't correctly titled</li>
<li><a href=""><code>debcc77</code></a> build: bump version</li>
<li>See full diff in <a href="https://github.com/nedbat/coveragepy/compare/7.6.3...7.6.4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=coverage&package-manager=pip&previous-version=7.6.3&new-version=7.6.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `bfd998b3ae6c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.