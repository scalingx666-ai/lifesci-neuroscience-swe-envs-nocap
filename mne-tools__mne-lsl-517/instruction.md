# Issue

**Title:** Bump pypa/cibuildwheel from 3.3.1 to 3.4.0

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 3.3.1 to 3.4.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v3.4.0</h2>
<ul>
<li>🌟 You can now build wheels using <code>uv</code> as a build frontend. This should improve performance, especially if your project has lots of build dependencies. To use, set <a href="https://cibuildwheel.pypa.io/en/stable/options/#build-frontend"><code>build-frontend</code></a> to <code>uv</code>. (<a href="">#2322</a>)</li>
<li>⚠️ We no longer support running on Travis CI. It may continue working but we don't run tests there anymore so we can't be sure. (<a href="">#2682</a>)</li>
<li>✨ Improvements to building Rust wheels on Android (<a href="">#2650</a>)</li>
<li>🐛 Fix bug with the GitHub Action on Windows, where PATH was getting unnecessarily changed, causing issues with meson builds. (<a href="">#2723</a>)</li>
<li>✨ Add support for quiet setting on <code>build</code> and <code>uv</code> from the cibuildwheel <code>build-verbosity</code> setting. (<a href="">#2737</a>)</li>
<li>📚 Docs updates, including guidance on using Meson on Windows (<a href="">#2718</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<h3>v3.4.0</h3>
<p><em>5 March 2026</em></p>
<ul>
<li>🌟 You can now build wheels using <code>uv</code> as a build frontend. This should improve performance, especially if your project has lots of build dependencies. To use, set <a href="https://cibuildwheel.pypa.io/en/stable/options/#build-frontend"><code>build-frontend</code></a> to <code>uv</code>. (<a href="">#2322</a>)</li>
<li>⚠️ We no longer support running on Travis CI. It may continue working but we don't run tests there anymore so we can't be sure. (<a href="">#2682</a>)</li>
<li>✨ Improvements to building rust wheels on Android (<a href="">#2650</a>)</li>
<li>🐛 Fix bug with the GitHub Action on Windows, where PATH was getting unnecessarily changed, causing issues with meson builds. (<a href="">#2723</a>)</li>
<li>✨ Add support for quiet setting on <code>build</code> and <code>uv</code> from the cibuildwheel <code>build-verbosity</code> setting. (<a href="">#2737</a>)</li>
<li>📚 Docs updates, including guidance on using Meson on Windows (<a href="">#2718</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ee02a15</code></a> Bump version: v3.4.0</li>
<li><a href=""><code>f08ce70</code></a> chore: match copyright to BSD-2-clause template (<a href="">#2758</a>)</li>
<li><a href=""><code>95b4b79</code></a> Fix incorrect document regarding pyodide auditwheel (<a href="">#2752</a>)</li>
<li><a href=""><code>f046d0a</code></a> Bump to Pyodide v0.29.3 (<a href="">#2743</a>)</li>
<li><a href=""><code>f5a31ee</code></a> chore(deps): bump the actions group across 1 directory with 4 updates (<a href="">#2755</a>)</li>
<li><a href=""><code>35ec456</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2756</a>)</li>
<li><a href=""><code>51fed90</code></a> [Bot] Update dependencies (<a href="">#2734</a>)</li>
<li><a href=""><code>b70562f</code></a> Debug GraalPy/uv test failures on Windows (<a href="">#2741</a>)</li>
<li><a href=""><code>0a85e29</code></a> Work around CDN rate limiting on Python.org in bin/update_pythons.py (<a href="">#2753</a>)</li>
<li><a href=""><code>2d33864</code></a> Pin the actions/setup-python for the externally used action.yml (<a href="">#2749</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/v3.3.1...v3.4.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=3.3.1&new-version=3.4.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `248b7cfa44c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.