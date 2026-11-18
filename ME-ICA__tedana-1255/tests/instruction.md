# Issue

**Title:** Update pandas requirement from <=2.3.1,>=2.0 to >=2.0,<=2.3.3

## Description

Updates the requirements on [pandas](https://github.com/pandas-dev/pandas) to permit the latest version.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pandas-dev/pandas/releases">pandas's releases</a>.</em></p>
<blockquote>
<h2>Pandas 2.3.3</h2>
<p>We are pleased to announce the release of pandas 2.3.3.
This release includes some improvements and fixes to the future string data type (preview feature for the upcoming pandas 3.0). We recommend that all users upgrade to this version.</p>
<p>See the <a href="https://pandas.pydata.org/pandas-docs/version/2.3/whatsnew/v2.3.3.html">full whatsnew</a> for a list of all the changes.
Pandas 2.3.3 supports Python 3.9 and higher, and is the first release to support Python 3.14.</p>
<p>The release will be available on the conda-forge channel:</p>
<pre><code>conda install pandas --channel conda-forge
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
<li><a href=""><code>9c8bc3e</code></a> RLS: 2.3.3</li>
<li><a href=""><code>6aa788a</code></a> [backport 2.3.x] DOC: prepare 2.3.3 whatsnew notes for release (<a href="">#62499</a>) (<a href="">#62508</a>)</li>
<li><a href=""><code>b64f0df</code></a> [backport 2.3.x] BUG: avoid validation error for ufunc with string[python] ar...</li>
<li><a href=""><code>058eb2b</code></a> [backport 2.3.x] BUG: String[pyarrow] comparison with mixed object (<a href="">#62424</a>) (...</li>
<li><a href=""><code>2ca088d</code></a> [backport 2.3.x] DEPR: remove the Period resampling deprecation (<a href="">#62480</a>) (<a href="">#62</a>...</li>
<li><a href=""><code>92bf98f</code></a> [backport 2.3.x] BUG: fix .str.isdigit to honor unicode superscript for older...</li>
<li><a href=""><code>e57c7d6</code></a> Backport PR <a href="">#62452</a> on branch 2.3.x (TST: Adjust tests for numexpr 2.13) (<a href="">#62454</a>)</li>
<li><a href=""><code>e0fe9a0</code></a> Backport to 2.3.x: REGR: from_records not initializing subclasses properly (#...</li>
<li><a href=""><code>23a1085</code></a> BUG: improve future warning for boolean operations with missaligned indexes (...</li>
<li><a href=""><code>6113696</code></a> Backport PR <a href="">#62396</a> on branch 2.3.x (PKG/DOC: indicate Python 3.14 support in ...</li>
<li>Additional commits viewable in <a href="https://github.com/pandas-dev/pandas/compare/v2.0.0...v2.3.3">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `37a099b55845`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.