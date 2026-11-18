# Issue

**Title:** Bump tqdm from 4.67.1 to 4.67.2

## Description

Bumps [tqdm](https://github.com/tqdm/tqdm) from 4.67.1 to 4.67.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.67.2 stable</h2>
<ul>
<li>support <code>pandas&gt;=3</code> (<a href="">#1703</a> &lt;- <a href="">#1701</a>, <a href="">#1650</a>, <a href="">#1700</a>)</li>
<li>fix <code>format_interval</code> for negative numbers (<a href="">#1703</a>)</li>
<li>misc linting</li>
<li>framework updates (<a href="">#1704</a>)
<ul>
<li>bump CI workflow &amp; <code>pre-commit</code> dependencies</li>
<li>add <code>pyupgrade</code></li>
<li>add py3.13 support</li>
<li>fix py3.7 tests</li>
<li>update <code>setuptools-scm</code> usage</li>
<li>support auto-dedented docstrings when building docs in py3.13</li>
</ul>
</li>
<li>tests: relax flaky benchmarks</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>09a863b</code></a> bump version, merge pull request <a href="">#1704</a> from tqdm/devel</li>
<li><a href=""><code>33d24cd</code></a> update pyproject syntax</li>
<li><a href=""><code>70b9124</code></a> add py3.13 support</li>
<li><a href=""><code>a74d8f8</code></a> drop _dist_ver</li>
<li><a href=""><code>14d72e2</code></a> Merge pull request <a href="">#1703</a> from wingding12/fix-pandas-3.0-and-negative-interval</li>
<li><a href=""><code>a69dac8</code></a> fix dedented docstrings</li>
<li><a href=""><code>a986d22</code></a> tests: fix pandas deprecation warnings</li>
<li><a href=""><code>bb7aa4d</code></a> tests: fix pandas deprecated applymap</li>
<li><a href=""><code>0647db1</code></a> misc tidy</li>
<li><a href=""><code>9bcd04b</code></a> fix pandas&gt;=3 &amp; negative format_interval</li>
<li>Additional commits viewable in <a href="https://github.com/tqdm/tqdm/compare/v4.67.1...v4.67.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tqdm&package-manager=uv&previous-version=4.67.1&new-version=4.67.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1151c9051b05`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.