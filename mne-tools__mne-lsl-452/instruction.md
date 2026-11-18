# Issue

**Title:** Bump pypa/cibuildwheel from 3.0.0 to 3.0.1

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 3.0.0 to 3.0.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v3.0.1</h2>
<ul>
<li>🛠 Updates CPython 3.14 prerelease to 3.14.0b3 (<a href="">#2471</a>)</li>
<li>✨ Adds a CPython 3.14 prerelease iOS build (only when prerelease builds are <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable">enabled</a>) (<a href="">#2475</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<h3>v3.0.1</h3>
<p><em>5 July 2025</em></p>
<ul>
<li>🛠 Updates CPython 3.14 prerelease to 3.14.0b3 (<a href="">#2471</a>)</li>
<li>✨ Adds a CPython 3.14 prerelease iOS build (only when prerelease builds are <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable">enabled</a>) (<a href="">#2475</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>95d2f3a</code></a> Bump version: v3.0.1</li>
<li><a href=""><code>40de3fe</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2483</a>)</li>
<li><a href=""><code>9200810</code></a> feat: added Python 3.14 preview for iOS (<a href="">#2475</a>)</li>
<li><a href=""><code>94fe0a2</code></a> [Bot] Update dependencies (<a href="">#2482</a>)</li>
<li><a href=""><code>405ddd5</code></a> fix: pyodide missing some logging (<a href="">#2477</a>)</li>
<li><a href=""><code>34b4f1e</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2474</a>)</li>
<li><a href=""><code>e69b553</code></a> [Bot] Update dependencies (<a href="">#2473</a>)</li>
<li><a href=""><code>3e86452</code></a> [Bot] Update dependencies (<a href="">#2471</a>)</li>
<li><a href=""><code>e737495</code></a> chore(deps): bump actions/attest-build-provenance from 2.3.0 to 2.4.0 in the ...</li>
<li><a href=""><code>588dee0</code></a> docs: include Windows ARM in examples (<a href="">#2468</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/v3.0.0...v3.0.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=3.0.0&new-version=3.0.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8ff09c804ae0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.