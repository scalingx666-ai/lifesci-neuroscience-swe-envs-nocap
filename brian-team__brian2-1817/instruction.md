# Issue

**Title:** Bump pypa/cibuildwheel from 3.3.1 to 3.4.1

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 3.3.1 to 3.4.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v3.4.1</h2>
<ul>
<li>⚠️ Building for the experimental CPython 3.13 free-threading variant is now deprecated. That functionality will be removed in the next minor release. The <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code></a> option <code>cpython-freethreading</code> is therefore also deprecated. Builds specifying <code>enable = &quot;all&quot;</code> no longer select <code>cpython-freethreading</code>. CPython 3.14 free-threading support remains available without the <code>enable</code> flag. (<a href="">#2787</a>)</li>
<li>🐛 iOS builds will no longer skip <code>repair-wheel-command</code> if it's defined in config (<a href="">#2761</a>)</li>
<li>🐛 Fix bug causing <code>uv</code> to fail when environments define PYTHON_VERSION or UV_PYTHON, conflicting with our venvs (<a href="">#2795</a>)</li>
<li>✨ cibuildwheel prints the selected build identifiers at the start of the build. (<a href="">#2785</a>)</li>
<li>🔐 The GitHub Action now references other actions with a full SHA (<a href="">#2744</a>)</li>
</ul>
<h2>v3.4.0</h2>
<ul>
<li>🌟 You can now build wheels using <code>uv</code> as a build frontend. This should improve performance, especially if your project has lots of build dependencies. To use, set <a href="https://cibuildwheel.pypa.io/en/stable/options/#build-frontend"><code>build-frontend</code></a> to <code>uv</code>. (<a href="">#2322</a>)</li>
<li>⚠️ We no longer support running on Travis CI. It may continue working but we don't run tests there anymore so we can't be sure. (<a href="">#2682</a>)</li>
<li>✨ Improvements to building Rust wheels on Android (<a href="">#2650</a>)</li>
<li>🛠 Update Pyodide to 0.29.3 (<a href="">#2719</a>, <a href="">#2733</a>)</li>
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
<hr />
<h2>title: Changelog</h2>
<h1>Changelog</h1>
<h3>v3.4.1</h3>
<p><em>2 April 2026</em></p>
<ul>
<li>⚠️ Building for the experimental CPython 3.13 free-threading variant is now deprecated. That functionality will be removed in the next minor release. The <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code></a> option <code>cpython-freethreading</code> is therefore also deprecated. Builds specifying <code>enable = &quot;all&quot;</code> no longer select <code>cpython-freethreading</code>. CPython 3.14 free-threading support remains available without the <code>enable</code> flag. (<a href="">#2787</a>)</li>
<li>🐛 iOS builds will no longer skip <code>repair-wheel-command</code> if it's defined in config (<a href="">#2761</a>)</li>
<li>🐛 Fix bug causing <code>uv</code> to fail when environments define PYTHON_VERSION or UV_PYTHON, conflicting with our venvs (<a href="">#2795</a>)</li>
<li>✨ cibuildwheel prints the selected build identifiers at the start of the build. (<a href="">#2785</a>)</li>
<li>🔐 The GitHub Action now references other actions with a full SHA (<a href="">#2744</a>)</li>
</ul>
<h3>v3.4.0</h3>
<p><em>5 March 2026</em></p>
<ul>
<li>🌟 You can now build wheels using <code>uv</code> as a build frontend. This should improve performance, especially if your project has lots of build dependencies. To use, set <a href="https://cibuildwheel.pypa.io/en/stable/options/#build-frontend"><code>build-frontend</code></a> to <code>uv</code>. (<a href="">#2322</a>)</li>
<li>⚠️ We no longer support running on Travis CI. It may continue working but we don't run tests there anymore so we can't be sure. (<a href="">#2682</a>)</li>
<li>✨ Improvements to building rust wheels on Android (<a href="">#2650</a>)</li>
<li>🛠 Update Pyodide to 0.29.3 (<a href="">#2719</a>, <a href="">#2733</a>)</li>
<li>🐛 Fix bug with the GitHub Action on Windows, where PATH was getting unnecessarily changed, causing issues with meson builds. (<a href="">#2723</a>)</li>
<li>✨ Add support for quiet setting on <code>build</code> and <code>uv</code> from the cibuildwheel <code>build-verbosity</code> setting. (<a href="">#2737</a>)</li>
<li>📚 Docs updates, including guidance on using Meson on Windows (<a href="">#2718</a>)</li>
</ul>
<h3>v3.3.1</h3>
<p><em>5 January 2026</em></p>
<ul>
<li>🛠 Update dependencies and container pins, including updating to CPython 3.14.2. (<a href="">#2708</a>)</li>
</ul>
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
<h3>v3.2.1</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8d2b08b</code></a> Bump version: v3.4.1</li>
<li><a href=""><code>54b8a01</code></a> deprecation: cp313t (<a href="">#2787</a>)</li>
<li><a href=""><code>097806b</code></a> tests: fully type the test suite (<a href="">#2794</a>)</li>
<li><a href=""><code>643b30c</code></a> fix: avoid PYTHON_VERSION breaking uv if set (<a href="">#2795</a>)</li>
<li><a href=""><code>fffe2ca</code></a> chore(deps): bump j178/prek-action from 1.1.1 to 2.0.0 in the actions group (...</li>
<li><a href=""><code>6111948</code></a> fix: zizmor &quot;code injection via template expansion&quot; (<a href="">#2784</a>)</li>
<li><a href=""><code>e478767</code></a> chore: remove some string types (<a href="">#2798</a>)</li>
<li><a href=""><code>caf433b</code></a> [Bot] Update dependencies (<a href="">#2789</a>)</li>
<li><a href=""><code>a257a3f</code></a> chore: remove remaining future annotations (<a href="">#2799</a>)</li>
<li><a href=""><code>6df84da</code></a> chore: some cleanup and checks (<a href="">#2792</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/298ed2fb2c105540f5ed055e8a6ad78d82dd3a7e...8d2b08b68458a16aeb24b64e68a09ab1c8e82084">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=3.3.1&new-version=3.4.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65f2d1c0ea8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.