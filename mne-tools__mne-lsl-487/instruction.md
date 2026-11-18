# Issue

**Title:** Bump pypa/cibuildwheel from 3.2.1 to 3.3.0

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 3.2.1 to 3.3.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v3.3.0</h2>
<ul>
<li>🐛 Fix an incompatibility with Docker v29 (<a href="">#2660</a>)</li>
<li>✨ Adds <code>test-runtime</code> option, to customise how tests on simulated/emulated environments are run (<a href="">#2636</a>)</li>
<li>✨ Adds support for new <code>manylinux_2_35</code> images on 32-bit ARM <code>armv7l</code>, offering better C++20 compatibility (<a href="">#2656</a>)</li>
<li>✨ <code>build[uv]</code> is now supported on Android (<a href="">#2587</a>)</li>
<li>✨ You can now install extras (such as <code>uv</code>) with a simple option on the GitHub Action (<a href="">#2630</a>)</li>
<li>✨ <code>{project}</code> and <code>{package}</code> placeholders are now supported in <code>repair-wheel-command</code> (<a href="">#2589</a>)</li>
<li>🛠 The versions set with <code>dependency-versions</code> no longer constrain packages specified by your <code>build-system.requires</code>. Previously, on platforms other than Linux, the constraints in this option would remain in the environment during the build. This has been tidied up make behaviour more consistent between platforms, and to prevent version conflicts. (<a href="">#2583</a>)</li>
<li>🛠 Improve the handling of <code>test-command</code> on Android, enabling more options to be passed (<a href="">#2590</a>)</li>
<li>📚 Docs improvements (<a href="">#2618</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<h3>v3.3.0</h3>
<p><em>12 November 2025</em></p>
<ul>
<li>🐛 Fix an incompatibility with Docker v29 (<a href="">#2660</a>)</li>
<li>✨ Adds <code>test-runtime</code> option, to customise how tests on simulated/emulated environments are run (<a href="">#2636</a>)</li>
<li>✨ Adds support for new <code>manylinux_2_35</code> images on 32-bit ARM <code>armv7l</code>, offering better C++20 compatibility (<a href="">#2656</a>)</li>
<li>✨ <code>build[uv]</code> is now supported on Android (<a href="">#2587</a>)</li>
<li>✨ You can now install extras (such as <code>uv</code>) with a simple option on the GitHub Action (<a href="">#2630</a>)</li>
<li>✨ <code>{project}</code> and <code>{package}</code> placeholders are now supported in <code>repair-wheel-command</code> (<a href="">#2589</a>)</li>
<li>🛠 The versions set with <code>dependency-versions</code> no longer constrain packages specified by your <code>build-system.requires</code>. Previously, on platforms other than Linux, the constraints in this option would remain in the environment during the build. This has been tidied up make behaviour more consistent between platforms, and to prevent version conflicts. (<a href="">#2583</a>)</li>
<li>🛠 Improve the handling of <code>test-command</code> on Android, enabling more options to be passed (<a href="">#2590</a>)</li>
<li>📚 Docs improvements (<a href="">#2618</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>63fd63b</code></a> Bump version: v3.3.0</li>
<li><a href=""><code>f4fe311</code></a> fix: support Docker 29 (<a href="">#2660</a>)</li>
<li><a href=""><code>f6c8108</code></a> feat: make the <code>{project}</code> placeholder available to <code>repair-wheel-command</code> (#...</li>
<li><a href=""><code>ccbae30</code></a> feat: support uv with Android (<a href="">#2587</a>)</li>
<li><a href=""><code>1337e50</code></a> chore: pytest log_level is better than log_cli_level (<a href="">#2657</a>)</li>
<li><a href=""><code>720f8e2</code></a> feat: add manylinux_2_35 (<a href="">#2656</a>)</li>
<li><a href=""><code>4c7f369</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2658</a>)</li>
<li><a href=""><code>e1baa60</code></a> chore: enable more Ruff checks (<a href="">#2654</a>)</li>
<li><a href=""><code>1f2f8b2</code></a> fix: don't constrain <code>build-system.requires</code> with our <code>dependency-versions</code> (...</li>
<li><a href=""><code>8c5b02f</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2648</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/v3.2.1...v3.3.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=3.2.1&new-version=3.3.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ddc14f638058`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.