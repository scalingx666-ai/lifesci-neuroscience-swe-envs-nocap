# Issue

**Title:** Bump pypa/cibuildwheel from 3.0.1 to 3.1.3

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 3.0.1 to 3.1.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v3.1.3</h2>
<ul>
<li>🐛 Fix bug where &quot;latest&quot; dependencies couldn't update to pip 25.2 on Windows (<a href="">#2537</a>)</li>
<li>🛠 Use pytest-rerunfailures to improve some of our iOS/Android tests (<a href="">#2527</a>, <a href="">#2539</a>)</li>
<li>🛠 Remove some GraalPy Windows workarounds in our tests (<a href="">#2501</a>)</li>
</ul>
<h2>v3.1.2</h2>
<ul>
<li>⚠️  Add an error if <code>CIBW_FREE_THREADING_SUPPORT</code> is set; you are likely missing 3.13t wheels, please use the <code>enable</code>/<code>CIBW_ENABLE</code> (<a href="">#2520</a>)</li>
<li>🛠 <code>riscv64</code> now enabled if you target that architecture, it's now supported on PyPI (<a href="">#2509</a>)</li>
<li>🛠 Add warning when using <code>cpython-experimental-riscv64</code> (no longer needed) (<a href="">#2526</a>, <a href="">#2528</a>)</li>
<li>🛠 iOS versions bumped, fixing issues with 3.14 (now RC 1) (<a href="">#2530</a>)</li>
<li>🐛 Fix bug in Android running wheel from our GitHub Action (<a href="">#2517</a>)</li>
<li>🐛 Fix warning when using <code>test-skip</code> of <code>&quot;*-macosx_universal2:arm64&quot;</code> (<a href="">#2522</a>)</li>
<li>🐛 Fix incorrect number of wheels reported in logs, again (<a href="">#2517</a>)</li>
<li>📚 We welcome our Android platform maintainer (<a href="">#2516</a>)</li>
</ul>
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
<h3>v3.1.3</h3>
<p><em>1 August 2025</em></p>
<ul>
<li>🐛 Fix bug where &quot;latest&quot; dependencies couldn't update to pip 25.2 on Windows (<a href="">#2537</a>)</li>
<li>🛠 Use pytest-rerunfailures to improve some of our iOS/Android tests (<a href="">#2527</a>, <a href="">#2539</a>)</li>
<li>🛠 Remove some GraalPy Windows workarounds in our tests (<a href="">#2501</a>)</li>
</ul>
<h3>v3.1.2</h3>
<p><em>29 July 2025</em></p>
<ul>
<li>⚠️  Add an error if <code>CIBW_FREE_THREADING_SUPPORT</code> is set; you are likely missing 3.13t wheels, please use the <code>enable</code>/<code>CIBW_ENABLE</code> (<a href="">#2520</a>)</li>
<li>🛠 <code>riscv64</code> now enabled if you target that architecture, it's now supported on PyPI (<a href="">#2509</a>)</li>
<li>🛠 Add warning when using <code>cpython-experimental-riscv64</code> (no longer needed) (<a href="">#2526</a>, <a href="">#2528</a>)</li>
<li>🛠 iOS versions bumped, fixing issues with 3.14 (now RC 1) (<a href="">#2530</a>)</li>
<li>🐛 Fix bug in Android running wheel from our GitHub Action (<a href="">#2517</a>)</li>
<li>🐛 Fix warning when using <code>test-skip</code> of <code>&quot;*-macosx_universal2:arm64&quot;</code> (<a href="">#2522</a>)</li>
<li>🐛 Fix incorrect number of wheels reported in logs, again (<a href="">#2517</a>)</li>
<li>📚 We welcome our Android platform maintainer (<a href="">#2516</a>)</li>
</ul>
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
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>352e013</code></a> Bump version: v3.1.3</li>
<li><a href=""><code>c463e56</code></a> tests: another iOS flaky spot (<a href="">#2539</a>)</li>
<li><a href=""><code>8c5c738</code></a> docs(project): add Falcon to working examples (<a href="">#2538</a>)</li>
<li><a href=""><code>feeb399</code></a> tests: add flaky test handling (<a href="">#2527</a>)</li>
<li><a href=""><code>60b9cc9</code></a> fix: never call pip directly (<a href="">#2537</a>)</li>
<li><a href=""><code>e2c7102</code></a> chore: remove some GraalPy Windows workarounds. (<a href="">#2501</a>)</li>
<li><a href=""><code>9e4e50b</code></a> Bump version: v3.1.2</li>
<li><a href=""><code>8ef9414</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2532</a>)</li>
<li><a href=""><code>1953c04</code></a> Adding <a href="https://github.com/mhsmith"><code>@​mhsmith</code></a> as platform maintainer for Android (<a href="">#2516</a>)</li>
<li><a href=""><code>46a6d27</code></a> Bump iOS support package versions. (<a href="">#2530</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/v3.0.1...v3.1.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=3.0.1&new-version=3.1.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `25e0564fc2a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.