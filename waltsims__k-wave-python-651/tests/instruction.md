# Issue

**Title:** Bump matplotlib from 3.10.3 to 3.10.7

## Description

Bumps [matplotlib](https://github.com/matplotlib/matplotlib) from 3.10.3 to 3.10.7.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matplotlib/matplotlib/releases">matplotlib's releases</a>.</em></p>
<blockquote>
<h2>REL: v3.10.7</h2>
<p>This is the latest bugfix release in the 3.10.x series.</p>
<p>The most important update in this release is that the minimum version
of <code>pyparsing</code> has been updated to version 3.0.</p>
<h2>REL: v3.10.6</h2>
<p>This is a bugfix release in the 3.10.x series.</p>
<p>Highlights from this release include:</p>
<pre><code>- Fix regression of hi-dpi support for Qt
- Fix race condition in TexManager.make_dvi &amp; make_png
- Various documentation and other bugfixes
</code></pre>
<h2>REL: v3.10.5</h2>
<p>This is the fourth bugfix release of the 3.10.x series.</p>
<p>Included in this release is distributed wheels for Python 3.14 (including freethreaded) and Windows ARM.</p>
<p>There are also several smaller bugfixes.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4aeb773</code></a> REL: v3.10.7</li>
<li><a href=""><code>080add3</code></a> Merge branch 'v3.10.6-doc' into v3.10.x</li>
<li><a href=""><code>a604a8b</code></a> Github Stats v3.10.7</li>
<li><a href=""><code>f550261</code></a> Zenodo v3.10.6</li>
<li><a href=""><code>9a5e3e4</code></a> Merge pull request <a href="">#30628</a> from meeseeksmachine/auto-backport-of-pr-30626-on-v...</li>
<li><a href=""><code>eb8cb0c</code></a> Backport PR <a href="">#30626</a>: MNT: Fix new F401 unused imports warnings</li>
<li><a href=""><code>8fadc71</code></a> Backport PR <a href="">#29745</a>: Use PEP8 style method and function names from (<a href="">#30589</a>)</li>
<li><a href=""><code>098876e</code></a> Merge pull request <a href="">#30614</a> from meeseeksmachine/auto-backport-of-pr-30612-on-v...</li>
<li><a href=""><code>eb42d86</code></a> Backport PR <a href="">#30612</a>: MNT: update black pin</li>
<li><a href=""><code>4a9c187</code></a> Merge pull request <a href="">#30572</a> from QuLogic/auto-backport-of-pr-30571-on-v3.10.x</li>
<li>Additional commits viewable in <a href="https://github.com/matplotlib/matplotlib/compare/v3.10.3...v3.10.7">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matplotlib&package-manager=pip&previous-version=3.10.3&new-version=3.10.7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

You can trigger a rebase of this PR by commenting `@dependabot rebase`.

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

> **Note**
> Automatic rebases have been disabled on this pull request as it has been open for over 30 days.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37dbc21a64c2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.