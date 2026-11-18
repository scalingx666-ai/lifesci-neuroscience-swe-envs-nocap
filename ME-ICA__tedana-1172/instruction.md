# Issue

**Title:** Update scipy requirement from <=1.15.1,>=1.2.0 to >=1.2.0,<=1.15.2

## Description

Updates the requirements on [scipy](https://github.com/scipy/scipy) to permit the latest version.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/scipy/scipy/releases">scipy's releases</a>.</em></p>
<blockquote>
<h1>SciPy 1.15.2 Release Notes</h1>
<p>SciPy <code>1.15.2</code> is a bug-fix release with no new features
compared to <code>1.15.1</code>. Free-threaded Python <code>3.13</code> wheels
for Linux ARM platform are available on PyPI starting with
this release.</p>
<h1>Authors</h1>
<ul>
<li>Name (commits)</li>
<li>Peter Bell (1)</li>
<li>Charles Bousseau (1) +</li>
<li>Jake Bowhay (3)</li>
<li>Matthew Brett (1)</li>
<li>Ralf Gommers (3)</li>
<li>Rohit Goswami (1)</li>
<li>Matt Haberland (4)</li>
<li>Parth Nobel (1) +</li>
<li>Tyler Reddy (33)</li>
<li>Daniel Schmitz (2)</li>
<li>Dan Schult (5)</li>
<li>Scott Shambaugh (2)</li>
<li>Edgar Andrés Margffoy Tuay (1)</li>
<li>Warren Weckesser (4)</li>
</ul>
<p>A total of 14 people contributed to this release.
People with a &quot;+&quot; by their names contributed a patch for the first time.
This list of names is automatically generated, and may not be fully complete.</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0f1fd4a</code></a> REL: 1.15.2 rel commit [wheel build]</li>
<li><a href=""><code>7df5cc6</code></a> Merge pull request <a href="">#22471</a> from tylerjereddy/treddy_backports_1.15.2</li>
<li><a href=""><code>a046fa0</code></a> CI: PR 22471 wheel builds [wheel build]</li>
<li><a href=""><code>198aa52</code></a> DOC: PR 22471 revisions</li>
<li><a href=""><code>ba61a58</code></a> CI: PR 22471 revisions</li>
<li><a href=""><code>e0251ee</code></a> do not check dtype in test_compare_with_GCVSPL</li>
<li><a href=""><code>fcc68dd</code></a> MAINT: integrate.cumulative_simpson: bump test tolerance</li>
<li><a href=""><code>6d2c059</code></a> BUG: wrap median_filter stability (<a href="">#22402</a>)</li>
<li><a href=""><code>59cb7d4</code></a> DOC: PR 22471 revisions</li>
<li><a href=""><code>a60d17f</code></a> MAINT: pearsonr SIMD-related shim</li>
<li>Additional commits viewable in <a href="https://github.com/scipy/scipy/compare/v1.2.0...v1.15.2">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `53f54af357e2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.