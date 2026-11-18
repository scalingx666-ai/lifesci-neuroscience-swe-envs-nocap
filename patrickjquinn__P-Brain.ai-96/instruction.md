# Issue

**Title:** Bump hosted-git-info from 2.8.5 to 2.8.9

## Description

Bumps [hosted-git-info](https://github.com/npm/hosted-git-info) from 2.8.5 to 2.8.9.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/npm/hosted-git-info/blob/v2.8.9/CHANGELOG.md">hosted-git-info's changelog</a>.</em></p>
<blockquote>
<h2><a href="https://github.com/npm/hosted-git-info/compare/v2.8.8...v2.8.9">2.8.9</a> (2021-04-07)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>backport regex fix from <a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/76">#76</a> (<a href="">29adfe5</a>), closes <a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/84">#84</a></li>
</ul>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h2><a href="https://github.com/npm/hosted-git-info/compare/v2.8.7...v2.8.8">2.8.8</a> (2020-02-29)</h2>
<h3>Bug Fixes</h3>
<ul>
<li><a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/61">#61</a> &amp; <a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/65">#65</a> addressing issues w/ url.URL implmentation which regressed node 6 support (<a href="">5038b18</a>), closes <a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/66">#66</a></li>
</ul>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h2><a href="https://github.com/npm/hosted-git-info/compare/v2.8.6...v2.8.7">2.8.7</a> (2020-02-26)</h2>
<h3>Bug Fixes</h3>
<ul>
<li>Do not attempt to use url.URL when unavailable (<a href="">2d0bb66</a>), closes <a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/61">#61</a> <a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/62">#62</a></li>
<li>Do not pass scp-style URLs to the WhatWG url.URL (<a href="">f2cdfcf</a>), closes <a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/60">#60</a></li>
</ul>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
<h2><a href="https://github.com/npm/hosted-git-info/compare/v2.8.5...v2.8.6">2.8.6</a> (2020-02-25)</h2>
<p><!-- raw HTML omitted --><!-- raw HTML omitted --></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8d4b369</code></a> chore(release): 2.8.9</li>
<li><a href=""><code>29adfe5</code></a> fix: backport regex fix from <a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/76">#76</a></li>
<li><a href=""><code>afeaefd</code></a> chore(release): 2.8.8</li>
<li><a href=""><code>5038b18</code></a> fix: <a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/61">#61</a> &amp; <a href="https://github-redirect.dependabot.com/npm/hosted-git-info/issues/65">#65</a> addressing issues w/ url.URL implmentation which regressed nod...</li>
<li><a href=""><code>7440afa</code></a> chore(release): 2.8.7</li>
<li><a href=""><code>2d0bb66</code></a> fix: Do not attempt to use url.URL when unavailable</li>
<li><a href=""><code>f2cdfcf</code></a> fix: Do not pass scp-style URLs to the WhatWG url.URL</li>
<li><a href=""><code>e1b83df</code></a> chore(release): 2.8.6</li>
<li><a href=""><code>ff259a6</code></a> Ensure passwords in hosted Git URLs are correctly escaped</li>
<li>See full diff in <a href="https://github.com/npm/hosted-git-info/compare/v2.8.5...v2.8.9">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~nlf">nlf</a>, a new releaser for hosted-git-info since your current version.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=hosted-git-info&package-manager=npm_and_yarn&previous-version=2.8.5&new-version=2.8.9)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/patrickjquinn/P-Brain.ai/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b32799b2dd2b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.