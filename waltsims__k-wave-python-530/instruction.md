# Issue

**Title:** Bump matplotlib from 3.9.3 to 3.10.0

## Description

Bumps [matplotlib](https://github.com/matplotlib/matplotlib) from 3.9.3 to 3.10.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/matplotlib/matplotlib/releases">matplotlib's releases</a>.</em></p>
<blockquote>
<h2>REL: v3.10.0</h2>
<p>Highlights of this release include:</p>
<pre><code>- Preliminary support for free-threaded CPython 3.13
- Standard getters/setters for axis inversion state
- New more-accessible color cycle
- Dark-mode diverging colormaps
- Exception handling control
- InsetIndicator artist
- FillBetweenPolyCollection
- Fill between 3D lines
- Data in 3D plots can now be dynamically clipped to the axes view limits
- Rotating 3d plots with the mouse
- Increased Figure limits with Agg renderer
- Subfigures no longer provisional
- Subfigures are now added in row-major order
</code></pre>
<h2>Matplotlib v3.10.0rc1</h2>
<p>This is the first release candidate for Matplotlib 3.10.0</p>
<h2>REL: 3.9.4</h2>
<p>This is the fourth bugfix release of the 3.9.x series.</p>
<p>This release contains two bug-fixes:</p>
<ul>
<li>Fix toolbar icons in GTK backend</li>
<li>Fix <code>Poly3DCollection</code> initialization with list of lists</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8d64f03</code></a> REL: v3.10.0 release</li>
<li><a href=""><code>d9dfee8</code></a> [doc] Fix dead links</li>
<li><a href=""><code>87a603f</code></a> Update release notes for 3.10.0</li>
<li><a href=""><code>cdecf97</code></a> Update github stats for 3.10</li>
<li><a href=""><code>b8d19bd</code></a> Merge pull request <a href="">#29306</a> from meeseeksmachine/auto-backport-of-pr-29242-on-v...</li>
<li><a href=""><code>a42d0ed</code></a> Backport PR <a href="">#29242</a>: DOC: Add kwdoc list to scatter() docstring</li>
<li><a href=""><code>1900640</code></a> Merge pull request <a href="">#29299</a> from QuLogic/merge-v39x</li>
<li><a href=""><code>815389c</code></a> Merge branch 'v3.9.x' into v3.10.x</li>
<li><a href=""><code>73873c0</code></a> DOC: Create release notes for 3.9.4</li>
<li><a href=""><code>9d17a2b</code></a> DOC: Add Zenodo DOI for 3.9.4</li>
<li>Additional commits viewable in <a href="https://github.com/matplotlib/matplotlib/compare/v3.9.3...v3.10.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=matplotlib&package-manager=pip&previous-version=3.9.3&new-version=3.10.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `6ccc3285e1f5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.