# Issue

**Title:** Bump pypa/cibuildwheel from 3.2.0 to 3.2.1

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 3.2.0 to 3.2.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v3.2.1</h2>
<ul>
<li>🛠 Update to CPython 3.14.0 final (<a href="">#2614</a>)</li>
<li>🐛 Fix the default MACOSX_DEPLOYMENT_TARGET on Python 3.14 (<a href="">#2613</a>)</li>
<li>📚 Docs improvements (<a href="">#2617</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<h3>v3.2.1</h3>
<p><em>12 October 2025</em></p>
<ul>
<li>🛠 Update to CPython 3.14.0 final (<a href="">#2614</a>)</li>
<li>🐛 Fix the default MACOSX_DEPLOYMENT_TARGET on Python 3.14 (<a href="">#2613</a>)</li>
<li>📚 Docs improvements (<a href="">#2617</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9c00cb4</code></a> Bump version: v3.2.1</li>
<li><a href=""><code>ae65c7d</code></a> [Bot] Update dependencies (<a href="">#2614</a>)</li>
<li><a href=""><code>86c3857</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2615</a>)</li>
<li><a href=""><code>68b1a81</code></a> docs: include free-threading builds in identifier list (<a href="">#2617</a>)</li>
<li><a href=""><code>f131cd7</code></a> fix: Python 3.14 on macOS requires MACOSX_DEPLOYMENT_TARGET set to 10.15 (<a href="">#2613</a>)</li>
<li><a href=""><code>8602e86</code></a> [Bot] Update dependencies (<a href="">#2606</a>)</li>
<li><a href=""><code>8ccc265</code></a> fix: resolve issues with macOS-15 runners (<a href="">#2607</a>)</li>
<li><a href=""><code>c0c1dea</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2608</a>)</li>
<li>See full diff in <a href="https://github.com/pypa/cibuildwheel/compare/v3.2.0...v3.2.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=3.2.0&new-version=3.2.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `12d66aa99c99`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.