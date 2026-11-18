# Issue

**Title:** Bump matplotlib from 3.10.1 to 3.10.3

## Description

Bumps [matplotlib](https://github.com/matplotlib/matplotlib) from 3.10.1 to 3.10.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matplotlib/matplotlib/releases">matplotlib's releases</a>.</em></p>
<blockquote>
<h2>REL: v3.10.3</h2>
<p>This is the third bugfix release of the 3.10.x series</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8b82729</code></a> REL: v3.10.3</li>
<li><a href=""><code>71e6946</code></a> REL prep 3.10.3</li>
<li><a href=""><code>0ef15b6</code></a> Merge pull request <a href="">#30018</a> from meeseeksmachine/auto-backport-of-pr-29907-on-v...</li>
<li><a href=""><code>3b50d5c</code></a> Backport PR <a href="">#29907</a>: Ensure text metric calculation always uses the text cache</li>
<li><a href=""><code>acb7361</code></a> Merge pull request <a href="">#30010</a> from rcomer/auto-backport-of-pr-29992-on-v3.10.x</li>
<li><a href=""><code>0ef1165</code></a> Backport PR <a href="">#29992</a> on v3.10.x: Update pinned oldest win image on azure</li>
<li><a href=""><code>0595366</code></a> Merge pull request <a href="">#29867</a> from QuLogic/auto-backport-of-pr-29827-on-v3.10.x</li>
<li><a href=""><code>9f40c83</code></a> Merge pull request <a href="">#30002</a> from meeseeksmachine/auto-backport-of-pr-29673-on-v...</li>
<li><a href=""><code>95c87f2</code></a> Backport PR <a href="">#29673</a>: DOC: document the issues with overlaying new mpl on old mpl</li>
<li><a href=""><code>a64d453</code></a> Merge pull request <a href="">#29999</a> from QuLogic/auto-backport-of-pr-29997-on-v3.10.x</li>
<li>Additional commits viewable in <a href="https://github.com/matplotlib/matplotlib/compare/v3.10.1...v3.10.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matplotlib&package-manager=pip&previous-version=3.10.1&new-version=3.10.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2bb4e634f17b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.