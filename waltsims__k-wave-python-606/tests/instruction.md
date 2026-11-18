# Issue

**Title:** Bump scipy from 1.15.2 to 1.15.3

## Description

Bumps [scipy](https://github.com/scipy/scipy) from 1.15.2 to 1.15.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/scipy/scipy/releases">scipy's releases</a>.</em></p>
<blockquote>
<h1>SciPy 1.15.3 Release Notes</h1>
<p>SciPy <code>1.15.3</code> is a bug-fix release with no new features
compared to <code>1.15.2</code>.</p>
<h1>Authors</h1>
<ul>
<li>Name (commits)</li>
<li>aiudirog (1) +</li>
<li>Nickolai Belakovski (1)</li>
<li>Florian Bourgey (1) +</li>
<li>Richard Strong Bowen (2) +</li>
<li>Jake Bowhay (1)</li>
<li>Dietrich Brunn (2)</li>
<li>Evgeni Burovski (1)</li>
<li>Lucas Colley (1)</li>
<li>Ralf Gommers (1)</li>
<li>Saarthak Gupta (1) +</li>
<li>Matt Haberland (4)</li>
<li>Chengyu Han (1) +</li>
<li>Lukas Huber (1) +</li>
<li>Nick ODell (2)</li>
<li>Ilhan Polat (4)</li>
<li>Tyler Reddy (52)</li>
<li>Neil Schemenauer (1) +</li>
<li>Dan Schult (1)</li>
<li>sildater (1) +</li>
<li>Gagandeep Singh (4)</li>
<li>Albert Steppi (2)</li>
<li>Matthias Urlichs (1) +</li>
<li>David Varela (1) +</li>
<li>ਗਗਨਦੀਪ ਸਿੰਘ (Gagandeep Singh) (3)</li>
</ul>
<p>A total of 24 people contributed to this release.
People with a &quot;+&quot; by their names contributed a patch for the first time.
This list of names is automatically generated, and may not be fully complete.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e29dcb6</code></a> REL: 1.15.3 rel commit [wheel build]</li>
<li><a href=""><code>61e6aa1</code></a> Merge pull request <a href="">#22840</a> from tylerjereddy/treddy_1.15.3_backports</li>
<li><a href=""><code>18c4ca8</code></a> MAINT: PR 22840 wheel build [wheel build]</li>
<li><a href=""><code>bd0f132</code></a> MAINT: PR 22840 revisions</li>
<li><a href=""><code>033b138</code></a> MAINT: PR 22840 revisions</li>
<li><a href=""><code>7a283cc</code></a> DOC: PR 22840 revisions</li>
<li><a href=""><code>3d1ea40</code></a> BUG: spatial.HalfspaceIntersection: raise on non-feasible half space (<a href="">#20035</a>)</li>
<li><a href=""><code>d01b984</code></a> BUG: ndimage.median_filter: fix segfault when using <code>mode='mirror'</code> (<a href="">#22608</a>)</li>
<li><a href=""><code>0879108</code></a> MAINT: special.logsumexp: fix bug when weight of largest magnitude component ...</li>
<li><a href=""><code>9b3b2d8</code></a> Merge pull request <a href="">#22869</a> from smurfix/main</li>
<li>Additional commits viewable in <a href="https://github.com/scipy/scipy/compare/v1.15.2...v1.15.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=scipy&package-manager=pip&previous-version=1.15.2&new-version=1.15.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `62c4c5c75287`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.