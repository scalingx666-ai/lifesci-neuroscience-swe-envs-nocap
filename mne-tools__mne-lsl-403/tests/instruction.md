# Issue

**Title:** Bump pypa/cibuildwheel from 2.22.0 to 2.23.0

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 2.22.0 to 2.23.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v2.23.0</h2>
<ul>
<li>✨ Adds official support for the new GitHub Actions Arm runners. In fact these worked out-of-the-box, now we include them in our tests and example configs. (<a href="">#2135</a> via <a href="">#2281</a>)</li>
<li>✨ Adds support for building PyPy 3.11 wheels (<a href="">#2268</a> via <a href="">#2281</a>)</li>
<li>🛠 Adopts the beta pypa/manylinux image for armv7l builds (<a href="">#2269</a> via <a href="">#2281</a>)</li>
<li>🛠 Dependency updates, including Pyodide 0.27 (<a href="">#2117</a> and <a href="">#2281</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<h3>v2.23.0</h3>
<p><em>1 March 2025</em></p>
<ul>
<li>✨ Adds official support for the new GitHub Actions Arm runners. In fact these worked out-of-the-box, now we include them in our tests and example configs. (<a href="">#2135</a> via <a href="">#2281</a>)</li>
<li>✨ Adds support for building PyPy 3.11 wheels (<a href="">#2268</a> via <a href="">#2281</a>)</li>
<li>🛠 Adopts the beta pypa/manylinux image for armv7l builds (<a href="">#2269</a> via <a href="">#2281</a>)</li>
<li>🛠 Dependency updates, including Pyodide 0.27 (<a href="">#2117</a> and <a href="">#2281</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6cccd09</code></a> Bump version: v2.23.0</li>
<li><a href=""><code>aa1534d</code></a> chore(2.x): update dependencies (<a href="">#2294</a>)</li>
<li><a href=""><code>ee23dd1</code></a> fix(test): implement retry for test_container_removed</li>
<li><a href=""><code>55037e9</code></a> ci/doc: move azure macOS build to <code>macOS-13</code> (<a href="">#2101</a>)</li>
<li><a href=""><code>8874ee2</code></a> Remove specific Python versions from the update-dependencies job</li>
<li><a href=""><code>f76d345</code></a> chore: bump dependencies</li>
<li><a href=""><code>5a5e514</code></a> Bump to Pyodide 0.27 (<a href="">#2117</a>)</li>
<li><a href=""><code>017abbb</code></a> feature: add PyPy 3.11 (<a href="">#2268</a>)</li>
<li><a href=""><code>bb1fd33</code></a> feat: Add support for ubuntu-24.04-arm GHA runner (<a href="">#2135</a>)</li>
<li><a href=""><code>98a6f3b</code></a> chore: use pypa/manylinux for manylinux_2_31_armv7l (<a href="">#2269</a>)</li>
<li>See full diff in <a href="https://github.com/pypa/cibuildwheel/compare/v2.22.0...v2.23.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=2.22.0&new-version=2.23.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d4a64bd99ba0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.