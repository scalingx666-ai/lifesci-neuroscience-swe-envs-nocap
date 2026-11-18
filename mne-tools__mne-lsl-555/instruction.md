# Issue

**Title:** Bump pypa/cibuildwheel from 4.0.0 to 4.1.0

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 4.0.0 to 4.1.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v4.1.0</h2>
<ul>
<li>✨ Updates Pyodide to the final 314.0.0 release, so Pyodide 3.14 wheels now build by default without the <code>pyodide-prerelease</code> <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code></a> flag. (<a href="">#2906</a>)</li>
<li>🐛 Raises clear errors when a build produces no wheel, instead of failing later with a confusing message (<a href="">#2909</a>)</li>
<li>🛠 Speeds up CLI startup through lazy imports on Python 3.15 (<a href="">#2797</a>)</li>
<li>📚 Adds an FAQ section on caching cibuildwheel's downloaded tools with <code>CIBW_CACHE_PATH</code> (<a href="">#2842</a>)</li>
<li>📚 Documentation improvements: clarifies which shell is used for command options, clarifies environment variable precedence, and fixes a dead Pyodide env info link (<a href="">#2904</a>, <a href="">#2905</a>, <a href="">#2911</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<h3>v4.1.0</h3>
<p><em>12 June 2026</em></p>
<ul>
<li>✨ Updates Pyodide to the final 314.0.0 release, so Pyodide 3.14 wheels now build by default without the <code>pyodide-prerelease</code> <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code></a> flag. (<a href="">#2906</a>)</li>
<li>🐛 Raises clear errors when a build produces no wheel, instead of failing later with a confusing message (<a href="">#2909</a>)</li>
<li>🛠 Speeds up CLI startup through lazy imports on Python 3.15 (<a href="">#2797</a>)</li>
<li>📚 Adds an FAQ section on caching cibuildwheel's downloaded tools with <code>CIBW_CACHE_PATH</code> (<a href="">#2842</a>)</li>
<li>📚 Documentation improvements: clarifies which shell is used for command options, clarifies environment variable precedence, and fixes a dead Pyodide env info link (<a href="">#2904</a>, <a href="">#2905</a>, <a href="">#2911</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2947353</code></a> Bump version: v4.1.0</li>
<li><a href=""><code>14a3c3a</code></a> Remove Travis pre-commit check</li>
<li><a href=""><code>42aa134</code></a> chore: minor cleanups and perf tweaks from code review (<a href="">#2910</a>)</li>
<li><a href=""><code>01265e5</code></a> Clarify shell used for command options (<a href="">#2904</a>)</li>
<li><a href=""><code>f4afd95</code></a> Add FAQ section on caching cibuildwheel's downloaded tools (<a href="">#2842</a>)</li>
<li><a href=""><code>6c08562</code></a> fix: faster CLI on Python 3.15 (<a href="">#2797</a>)</li>
<li><a href=""><code>4f42ee3</code></a> fix: raise clear errors when no wheel is produced (<a href="">#2909</a>)</li>
<li><a href=""><code>f3aa1be</code></a> Fix dead Pyodide env info link, remove mention of alpha ABI (<a href="">#2911</a>)</li>
<li><a href=""><code>d60fc2b</code></a> Support new graalpy asset names that include Python version. (<a href="">#2863</a>)</li>
<li><a href=""><code>55c8985</code></a> docs: clarify environment precedence (<a href="">#2905</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/v4.0.0...v4.1.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=4.0.0&new-version=4.1.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `81e3b9942b9e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.