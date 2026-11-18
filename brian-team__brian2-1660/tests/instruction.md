# Issue

**Title:** chore(deps): bump pypa/cibuildwheel from 3.0.1 to 3.1.1

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 3.0.1 to 3.1.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v3.1.1</h2>
<ul>
<li>🐛 Fix a bug showing an incorrect wheel count at the end of execution, and misrepresenting test-only runs in the GitHub Action summary (<a href="">#2512</a>)</li>
<li>📚 Docs fix (<a href="">#2510</a>)</li>
</ul>
<h2>v3.1.0</h2>
<ul>
<li>🌟 CPython 3.14 wheels are now built by default - without the <code>&quot;cpython-prerelease&quot;</code> <code>enable</code> set. It's time to build and upload these wheels to PyPI! This release includes CPython 3.14.0rc1, which is guaranteed to be ABI compatible with the final release. (<a href="">#2507</a>) Free-threading is no longer experimental in 3.14, so you have to skip it explicitly with <code>'cp31?t-*'</code> if you don't support it yet. (<a href="">#2503</a>)</li>
<li>🌟 Adds the ability to <a href="https://cibuildwheel.pypa.io/en/stable/platforms/#android">build wheels for Android</a>! Set the <a href="https://cibuildwheel.pypa.io/en/stable/options/#platform"><code>platform</code> option</a> to <code>android</code> on Linux or macOS to try it out! (<a href="">#2349</a>)</li>
<li>🌟 Adds Pyodide 0.28, which builds 3.13 wheels (<a href="">#2487</a>)</li>
<li>✨ Support for 32-bit <code>manylinux_2_28</code> (now a consistent default) and <code>manylinux_2_34</code> added (<a href="">#2500</a>)</li>
<li>🛠 Improved summary, will also use markdown summary output on GHA (<a href="">#2469</a>)</li>
<li>🛠 The riscv64 images now have a working default (as they are now part of pypy/manylinux), but are still experimental (and behind an <code>enable</code>) since you can't push them to PyPI yet (<a href="">#2506</a>)</li>
<li>🛠 Fixed a typo in the 3.9 MUSL riscv64 identifier (<code>cp39-musllinux_ricv64</code> -&gt; <code>cp39-musllinux_riscv64</code>) (<a href="">#2490</a>)</li>
<li>🛠 Mistyping <code>--only</code> now shows the correct possibilities, and even suggests near matches on Python 3.14+ (<a href="">#2499</a>)</li>
<li>🛠 Only support one output from the repair step on linux like other platforms; auditwheel fixed this over four years ago! (<a href="">#2478</a>)</li>
<li>🛠 We now use pattern matching extensively (<a href="">#2434</a>)</li>
<li>📚 We now have platform maintainers for our special platforms and interpreters! (<a href="">#2481</a>)</li>
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
<h3>v3.1.1</h3>
<p><em>24 July 2025</em></p>
<ul>
<li>🐛 Fix a bug showing an incorrect wheel count at the end of execution, and misrepresenting test-only runs in the GitHub Action summary (<a href="">#2512</a>)</li>
<li>📚 Docs fix (<a href="">#2510</a>)</li>
</ul>
<h3>v3.1.0</h3>
<p><em>23 July 2025</em></p>
<ul>
<li>🌟 CPython 3.14 wheels are now built by default - without the <code>&quot;cpython-prerelease&quot;</code> <code>enable</code> set. It's time to build and upload these wheels to PyPI! This release includes CPython 3.14.0rc1, which is guaranteed to be ABI compatible with the final release. (<a href="">#2507</a>) Free-threading is no longer experimental in 3.14, so you have to skip it explicitly with <code>'cp31?t-*'</code> if you don't support it yet. (<a href="">#2503</a>)</li>
<li>🌟 Adds the ability to <a href="https://cibuildwheel.pypa.io/en/stable/platforms/#android">build wheels for Android</a>! Set the <a href="https://cibuildwheel.pypa.io/en/stable/options/#platform"><code>platform</code> option</a> to <code>android</code> on Linux or macOS to try it out! (<a href="">#2349</a>)</li>
<li>🌟 Adds Pyodide 0.28, which builds 3.13 wheels (<a href="">#2487</a>)</li>
<li>✨ Support for 32-bit <code>manylinux_2_28</code> (now a consistent default) and <code>manylinux_2_34</code> added (<a href="">#2500</a>)</li>
<li>🛠 Improved summary, will also use markdown summary output on GHA (<a href="">#2469</a>)</li>
<li>🛠 The riscv64 images now have a working default (as they are now part of pypy/manylinux), but are still experimental (and behind an <code>enable</code>) since you can't push them to PyPI yet (<a href="">#2506</a>)</li>
<li>🛠 Fixed a typo in the 3.9 MUSL riscv64 identifier (<code>cp39-musllinux_ricv64</code> -&gt; <code>cp39-musllinux_riscv64</code>) (<a href="">#2490</a>)</li>
<li>🛠 Mistyping <code>--only</code> now shows the correct possibilities, and even suggests near matches on Python 3.14+ (<a href="">#2499</a>)</li>
<li>🛠 Only support one output from the repair step on linux like other platforms; auditwheel fixed this over four years ago! (<a href="">#2478</a>)</li>
<li>🛠 We now use pattern matching extensively (<a href="">#2434</a>)</li>
<li>📚 We now have platform maintainers for our special platforms and interpreters! (<a href="">#2481</a>)</li>
</ul>
<h3>v3.0.1</h3>
<p><em>5 July 2025</em></p>
<ul>
<li>🛠 Updates CPython 3.14 prerelease to 3.14.0b3 (<a href="">#2471</a>)</li>
<li>✨ Adds a CPython 3.14 prerelease iOS build (only when prerelease builds are <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable">enabled</a>) (<a href="">#2475</a>)</li>
</ul>
<h3>v3.0.0</h3>
<p><em>11 June 2025</em></p>
<p>See <a href="https://github.com/henryiii"><code>@​henryiii</code></a>'s <a href="https://iscinumpy.dev/post/cibuildwheel-3-0-0/">release post</a> for more info on new features!</p>
<ul>
<li>
<p>🌟 Adds the ability to <a href="https://cibuildwheel.pypa.io/en/stable/platforms/#ios">build wheels for iOS</a>! Set the <a href="https://cibuildwheel.pypa.io/en/stable/options/#platform"><code>platform</code> option</a> to <code>ios</code> on a Mac with the iOS toolchain to try it out! (<a href="">#2286</a>, <a href="">#2363</a>, <a href="">#2432</a>)</p>
</li>
<li>
<p>🌟 Adds support for the GraalPy interpreter! Enable for your project using the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code> option</a>. (<a href="">#1538</a>, <a href="">#2411</a>, <a href="">#2414</a>)</p>
</li>
<li>
<p>✨ Adds CPython 3.14 support, under the <a href="https://cibuildwheel.pypa.io/en/stable/options/#enable"><code>enable</code> option</a> <code>cpython-prerelease</code>. This version of cibuildwheel uses 3.14.0b2. (<a href="">#2390</a>)</p>
<p><em>While CPython is in beta, the ABI can change, so your wheels might not be compatible with the final release. For this reason, we don't recommend distributing wheels until RC1, at which point 3.14 will be available in cibuildwheel without the flag.</em> (<a href="">#2390</a>)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e6de07e</code></a> Bump version: v3.1.1</li>
<li><a href=""><code>2ca692b</code></a> docs: iOS typo fix in docs (<a href="">#2510</a>)</li>
<li><a href=""><code>1ac7fa7</code></a> fix: report defects in logs and HTML summaries (<a href="">#2512</a>)</li>
<li><a href=""><code>ffd835c</code></a> Bump version: v3.1.0</li>
<li><a href=""><code>3e2a9aa</code></a> fix: regenerate schema</li>
<li><a href=""><code>10c727e</code></a> feat: Python 3.14rc1 build by default (<a href="">#2507</a>)</li>
<li><a href=""><code>f628c9d</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2505</a>)</li>
<li><a href=""><code>0f487ee</code></a> feat: add support for building Android wheels (<a href="">#2349</a>)</li>
<li><a href=""><code>e2e2488</code></a> feat: add default riscv64 images (<a href="">#2506</a>)</li>
<li><a href=""><code>a8bff94</code></a> [Bot] Update dependencies (<a href="">#2504</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/95d2f3a92fbf80abe066b09418bbf128a8923df2...e6de07ed3921b51089aae6981989889cf1eddd0c">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=3.0.1&new-version=3.1.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `77ce78ed163e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.