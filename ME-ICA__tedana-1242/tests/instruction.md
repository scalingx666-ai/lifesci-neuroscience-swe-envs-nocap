# Issue

**Title:** Update pandas requirement from <=2.3.0,>=2.0 to >=2.0,<=2.3.1

## Description

Updates the requirements on [pandas](https://github.com/pandas-dev/pandas) to permit the latest version.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pandas-dev/pandas/releases">pandas's releases</a>.</em></p>
<blockquote>
<h2>Pandas 2.3.1</h2>
<p>We are pleased to announce the release of pandas 2.3.1.
This release includes some improvements and fixes to the future string data type (preview feature for the upcoming pandas 3.0). We recommend that all users upgrade to this version.</p>
<p>See the <a href="https://pandas.pydata.org/pandas-docs/version/2.3.1/whatsnew/v2.3.1.html">full whatsnew</a> for a list of all the changes.
Pandas 2.3.1 supports Python 3.9 and higher.</p>
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
<li><a href=""><code>c888af6</code></a> RLS: 2.3.1</li>
<li><a href=""><code>6aea302</code></a> Backport PR <a href="">#61794</a> on branch 2.3.x (DOC: prepare 2.3.1 whatsnew notes for rel...</li>
<li><a href=""><code>a160ae6</code></a> [backport 2.3.x] BUG[string]: incorrect index downcast in DataFrame.join (<a href="">#61</a>...</li>
<li><a href=""><code>cf5db68</code></a> [backport 2.3.x] TST: update expected dtype for sum of decimals with pyarrow ...</li>
<li><a href=""><code>50ad136</code></a> Backport PR <a href="">#61795</a> on branch 2.3.x (DOC: add section about upcoming pandas 3....</li>
<li><a href=""><code>6c762f3</code></a> Backport PR <a href="">#61770</a> on branch 2.3.x (BUG: Fix unpickling of string dtypes of l...</li>
<li><a href=""><code>fd99ef7</code></a> Backport PR <a href="">#61705</a> on branch 2.3.x (DOC: add pandas 3.0 migration guide for t...</li>
<li><a href=""><code>4e5237d</code></a> [backport 2.3.x] CI: clean up wheel build workarounds now that Cython 3.1.0 i...</li>
<li><a href=""><code>4d42cd8</code></a> Revert &quot;[2.3.x] DEPS: Drop Python 3.9 (<a href="">#60792</a>)&quot; (<a href="">#61755</a>)</li>
<li><a href=""><code>5d32ae9</code></a> BLD: Build wheels for 3.9 and musllinux-aarch64 for pandas 2.3 (<a href="">#61569</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pandas-dev/pandas/compare/v2.0.0...v2.3.1">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `40e27609f8b5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.