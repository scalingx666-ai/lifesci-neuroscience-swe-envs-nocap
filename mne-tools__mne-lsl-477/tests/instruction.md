# Issue

**Title:** Bump pypa/cibuildwheel from 3.1.4 to 3.2.0

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 3.1.4 to 3.2.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v3.2.0</h2>
<ul>
<li>✨ Adds GraalPy v25 (Python 3.12) support (<a href="">#2597</a>)</li>
<li>🛠 Update to CPython 3.14.0rc3 (<a href="">#2602</a>)</li>
<li>🛠 Adds CPython 3.14.0 prerelease support for Android, and a number of improvements to Android builds (<a href="">#2568</a>, <a href="">#2591</a>)</li>
<li>🛠 Improvements to testing on Android, passing environment markers when installing the venv, and providing more debug output when build-verbosity is set (<a href="">#2575</a>)</li>
<li>⚠️ PyPy 3.10 was moved to <code>pypy-eol</code> in the <code>enable</code> option, as it is now end-of-life. (<a href="">#2521</a>)</li>
<li>📚 Docs improvements (<a href="">#2574</a>, <a href="">#2601</a>, <a href="">#2598</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<h3>v3.2.0</h3>
<p><em>22 September 2025</em></p>
<ul>
<li>✨ Adds GraalPy v25 (Python 3.12) support (<a href="">#2597</a>)</li>
<li>🛠 Update to CPython 3.14.0rc3 (<a href="">#2602</a>)</li>
<li>🛠 Adds CPython 3.14.0 prerelease support for Android, and a number of improvements to Android builds (<a href="">#2568</a>, <a href="">#2591</a>)</li>
<li>🛠 Improvements to testing on Android, passing environment markers when installing the venv, and providing more debug output when build-verbosity is set (<a href="">#2575</a>)</li>
<li>⚠️ PyPy 3.10 was moved to <code>pypy-eol</code> in the <code>enable</code> option, as it is now end-of-life. (<a href="">#2521</a>)</li>
<li>📚 Docs improvements (<a href="">#2574</a>, <a href="">#2601</a>, <a href="">#2598</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7c619ef</code></a> Bump version: v3.2.0</li>
<li><a href=""><code>bbebb68</code></a> [Bot] Update dependencies (<a href="">#2603</a>)</li>
<li><a href=""><code>5bbeaf8</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2604</a>)</li>
<li><a href=""><code>7a67c6b</code></a> Add GraalPy 25 and remove workarounds for that version. (<a href="">#2597</a>)</li>
<li><a href=""><code>b8a4fbc</code></a> Improve information about configuration overriding (<a href="">#2598</a>)</li>
<li><a href=""><code>70de033</code></a> Replace the <code>macos-13</code> images with the <code>macos-15-intel</code> images (GHA) (<a href="">#2601</a>)</li>
<li><a href=""><code>ce4c16f</code></a> [Bot] Update dependencies (<a href="">#2602</a>)</li>
<li><a href=""><code>66490f0</code></a> Add CMAKE_CROSSCOMPILING_EMULATOR to Android CMake toolchain (<a href="">#2591</a>)</li>
<li><a href=""><code>77b9e35</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2594</a>)</li>
<li><a href=""><code>39e9da0</code></a> [Bot] Update dependencies (<a href="">#2593</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/v3.1.4...v3.2.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=3.1.4&new-version=3.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `889b2654133d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.