# Issue

**Title:** Bump scipy from 1.15.0 to 1.15.1

## Description

Bumps [scipy](https://github.com/scipy/scipy) from 1.15.0 to 1.15.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/scipy/scipy/releases">scipy's releases</a>.</em></p>
<blockquote>
<h1>SciPy 1.15.1 Release Notes</h1>
<p>SciPy <code>1.15.1</code> is a bug-fix release with no new features
compared to <code>1.15.0</code>. Importantly, an issue with the
import of <code>scipy.optimize</code> breaking other packages
has been fixed.</p>
<h1>Authors</h1>
<ul>
<li>Name (commits)</li>
<li>Ralf Gommers (3)</li>
<li>Rohit Goswami (1)</li>
<li>Matt Haberland (2)</li>
<li>Tyler Reddy (7)</li>
<li>Daniel Schmitz (1)</li>
</ul>
<p>A total of 5 people contributed to this release.
People with a &quot;+&quot; by their names contributed a patch for the first time.
This list of names is automatically generated, and may not be fully complete.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>df134ea</code></a> REL: 1.15.1 rel commit [wheel build]</li>
<li><a href=""><code>f939c19</code></a> Merge pull request <a href="">#22296</a> from tylerjereddy/treddy_1.15.1_backports</li>
<li><a href=""><code>609bb3c</code></a> DOC: PR 22296 revisions</li>
<li><a href=""><code>5bfd6a2</code></a> TST: stats.Normal: bump tolerance on test of logcdf (<a href="">#22276</a>)</li>
<li><a href=""><code>f9a549c</code></a> DOC: update 1.15.1 relnotes</li>
<li><a href=""><code>6f011d8</code></a> MAINT: Update highs subproject commit</li>
<li><a href=""><code>0ff01de</code></a> TST: fix thread safety issue in interpolate.bsplines memmap test</li>
<li><a href=""><code>21c65ab</code></a> BLD: fix some issues with undeclared internal build dependencies</li>
<li><a href=""><code>826759e</code></a> MAINT: fix url for array-api-extra git submodule</li>
<li><a href=""><code>9af1fcd</code></a> Merge pull request <a href="">#22235</a> from tylerjereddy/treddy_prep_1.15.1</li>
<li>Additional commits viewable in <a href="https://github.com/scipy/scipy/compare/v1.15.0...v1.15.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=scipy&package-manager=pip&previous-version=1.15.0&new-version=1.15.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ca0eab933d2f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.