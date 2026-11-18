# Issue

**Title:** chore(deps): bump pypa/cibuildwheel from 3.1.1 to 3.1.4

## Description

Bumps [pypa/cibuildwheel](https://github.com/pypa/cibuildwheel) from 3.1.1 to 3.1.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/releases">pypa/cibuildwheel's releases</a>.</em></p>
<blockquote>
<h2>v3.1.4</h2>
<ul>
<li>✨ Add a <code>--clean-cache</code> command to clean up our cache (<a href="">#2489</a>)</li>
<li>🛠 Update Python to 3.14rc2 and other patch version bumps (<a href="">#2542</a>, <a href="">#2556</a>)</li>
<li>🛠 Update Pyodide to 0.28.2 (<a href="">#2562</a>, <a href="">#2558</a>)</li>
<li>🐛 Fix resolution with <code>pyodide-build</code> when <code>dependency-versions</code> is set (<a href="">#2548</a>)</li>
<li>🐛 Set <code>CMAKE_FIND_ROOT_PATH_MODE_PACKAGE</code> to <code>BOTH</code> on Android (<a href="">#2547</a>)</li>
<li>🐛 Add <code>patchelf</code> dependency for platforms that can build Android wheels (<a href="">#2552</a>)</li>
<li>🐛 Ignore empty values for <code>CIBW_ARCHS</code> like most other environment variables (<a href="">#2541</a>)</li>
<li>💼 The <code>color</code> and <code>suggest_on_error</code> argparse options are now default in 3.14rc1+ (<a href="">#2554</a>)</li>
<li>💼 Use the virtualenv release URL instead of blob URL (should be more robust) (<a href="">#2555</a>)</li>
<li>🧪 For iOS, lowering to macos-14 is needed for now due to issues with GitHub's runner images (<a href="">#2557</a>)</li>
<li>🧪 Split out platforms iOS and Android in our tests (<a href="">#2519</a>)</li>
<li>🧪 Fix and enable doctests (<a href="">#2546</a>)</li>
<li>📚 Improve our docs on free-threading (<a href="">#2549</a>)</li>
</ul>
<h2>v3.1.3</h2>
<ul>
<li>🐛 Fix bug where &quot;latest&quot; dependencies couldn't update to pip 25.2 on Windows (<a href="">#2537</a>)</li>
<li>🧪 Use pytest-rerunfailures to improve some of our iOS/Android tests (<a href="">#2527</a>, <a href="">#2539</a>)</li>
<li>🧪 Remove some GraalPy Windows workarounds in our tests (<a href="">#2501</a>)</li>
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
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pypa/cibuildwheel/blob/main/docs/changelog.md">pypa/cibuildwheel's changelog</a>.</em></p>
<blockquote>
<hr />
<h2>title: Changelog</h2>
<h1>Changelog</h1>
<h3>v3.1.4</h3>
<p><em>19 August 2025</em></p>
<ul>
<li>✨ Add a <code>--clean-cache</code> command to clean up our cache (<a href="">#2489</a>)</li>
<li>🛠 Update Python to 3.14rc2 and other patch version bumps (<a href="">#2542</a>, <a href="">#2556</a>)</li>
<li>🛠 Update Pyodide to 0.28.2 (<a href="">#2562</a>, <a href="">#2558</a>)</li>
<li>🐛 Fix resolution with <code>pyodide-build</code> when <code>dependency-versions</code> is set (<a href="">#2548</a>)</li>
<li>🐛 Set <code>CMAKE_FIND_ROOT_PATH_MODE_PACKAGE</code> to <code>BOTH</code> on Android (<a href="">#2547</a>)</li>
<li>🐛 Add <code>patchelf</code> dependency for platforms that can build Android wheels (<a href="">#2552</a>)</li>
<li>🐛 Ignore empty values for <code>CIBW_ARCHS</code> like most other environment variables (<a href="">#2541</a>)</li>
<li>💼 The <code>color</code> and <code>suggest_on_error</code> argparse options are now default in 3.14rc1+ (<a href="">#2554</a>)</li>
<li>💼 Use the virtualenv release URL instead of blob URL (should be more robust) (<a href="">#2555</a>)</li>
<li>🧪 For iOS, lowering to macos-14 is needed for now due to issues with GitHub's runner images (<a href="">#2557</a>)</li>
<li>🧪 Split out platforms iOS and Android in our tests (<a href="">#2519</a>)</li>
<li>🧪 Fix and enable doctests (<a href="">#2546</a>)</li>
<li>📚 Improve our docs on free-threading (<a href="">#2549</a>)</li>
</ul>
<h3>v3.1.3</h3>
<p><em>1 August 2025</em></p>
<ul>
<li>🐛 Fix bug where &quot;latest&quot; dependencies couldn't update to pip 25.2 on Windows (<a href="">#2537</a>)</li>
<li>🧪 Use pytest-rerunfailures to improve some of our iOS/Android tests (<a href="">#2527</a>, <a href="">#2539</a>)</li>
<li>🧪 Remove some GraalPy Windows workarounds in our tests (<a href="">#2501</a>)</li>
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
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c923d83</code></a> Bump version: v3.1.4</li>
<li><a href=""><code>55ee8e4</code></a> chore: bump to Pyodide 0.28.2 (<a href="">#2562</a>)</li>
<li><a href=""><code>afe486c</code></a> feat: add a <code>--clean-cache</code> command to clean up locations specified at `CIBW_...</li>
<li><a href=""><code>1c1ba8a</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#2561</a>)</li>
<li><a href=""><code>33b75f4</code></a> chore: extend CODEOWNERS file to include platform-specific constraints files ...</li>
<li><a href=""><code>c59c2fe</code></a> [Bot] Update dependencies (<a href="">#2556</a>)</li>
<li><a href=""><code>24b64c5</code></a> chore: update Pyodide constraints (<a href="">#2558</a>)</li>
<li><a href=""><code>6425e48</code></a> docs: minor doc link fix (<a href="">#2560</a>)</li>
<li><a href=""><code>0264b4d</code></a> Revert to macOS-14 image for ARM64 iOS testing (<a href="">#2557</a>)</li>
<li><a href=""><code>68f9762</code></a> chore: Use the virtualenv release URL rather than the blob URL (<a href="">#2555</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pypa/cibuildwheel/compare/e6de07ed3921b51089aae6981989889cf1eddd0c...c923d83ad9c1bc00211c5041d0c3f73294ff88f6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pypa/cibuildwheel&package-manager=github_actions&previous-version=3.1.1&new-version=3.1.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aca83f0b7794`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.