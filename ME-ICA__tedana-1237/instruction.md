# Issue

**Title:** Update pandas requirement from <=2.2.3,>=2.0 to >=2.0,<=2.3.0

## Description

Updates the requirements on [pandas](https://github.com/pandas-dev/pandas) to permit the latest version.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pandas-dev/pandas/releases">pandas's releases</a>.</em></p>
<blockquote>
<h2>Pandas 2.3.0</h2>
<p>We are pleased to announce the release of pandas 2.3.0.
This release includes some new features, bug fixes, and performance improvements. We recommend that all users upgrade to this version.</p>
<p>See the <a href="https://pandas.pydata.org/pandas-docs/version/2.3.0/whatsnew/v2.3.0.html">full whatsnew</a> for a list of all the changes.
Pandas 2.3.0 supports Python 3.10 and higher.</p>
<p>The release will be available on the defaults and conda-forge channels:</p>
<pre><code>conda install -c conda-forge pandas
</code></pre>
<p>Or via PyPI:</p>
<pre><code>python3 -m pip install --upgrade pandas
</code></pre>
<p>Please report any issues with the release on the <a href="https://github.com/pandas-dev/pandas/issues">pandas issue tracker</a>.</p>
<p>Thanks to all the contributors who made this release possible.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2cc3762</code></a> RLS: 2.3.0</li>
<li><a href=""><code>4a3fb4b</code></a> Backport PR <a href="">#61560</a>: DOC: Set date for v2.3.0.rst whatsnew (<a href="">#61561</a>)</li>
<li><a href=""><code>1976447</code></a> Backport PR <a href="">#61519</a>: BUILD: Bump Cython to 3.1 (<a href="">#61558</a>)</li>
<li><a href=""><code>11c120c</code></a> Backport PR <a href="">#61549</a> on branch 2.3.x (TST: Add error message for test_groupby_r...</li>
<li><a href=""><code>0615219</code></a> Backport PR <a href="">#61518</a> on branch 2.3.x (TST: Use external_error_raised for numpy-...</li>
<li><a href=""><code>61a39e1</code></a> Backport PR <a href="">#60739</a> on branch 2.3.x (ENH: pandas.api.interchange.from_datafram...</li>
<li><a href=""><code>80c9f48</code></a> DOC: Fix formatting in indexing.rst (<a href="">#61480</a>)</li>
<li><a href=""><code>86709da</code></a> Backport PR <a href="">#61399</a>: BUG: round on object columns no longer raises a TypeError...</li>
<li><a href=""><code>5bbd98b</code></a> Backport PR <a href="">#61423</a>: CI: Fix test failures in 32-bit environment (<a href="">#61437</a>)</li>
<li><a href=""><code>9bb152d</code></a> CI: Pin Cython to a specific commit Window PY3.13t builds (<a href="">#61261</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pandas-dev/pandas/compare/v2.0.0...v2.3.0">compare view</a></li>
</ul>
</details>
<br />

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9ecc94f3a7d5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.