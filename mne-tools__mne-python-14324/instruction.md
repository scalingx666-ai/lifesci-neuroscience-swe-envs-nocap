# Issue

**Title:** [dependabot]: Bump the actions group with 3 updates

## Description

Bumps the actions group with 3 updates: [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv), [github/codeql-action](https://github.com/github/codeql-action) and [codecov/codecov-action](https://github.com/codecov/codecov-action).

Updates `astral-sh/setup-uv` from 10.0.1 to 10.1.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v10.1.0 🌈  New output <code>python-runtime-id</code>and respect NO_PROXY</h2>
<h2>Changes</h2>
<p>This release adds more bheind the scene security improvements and also 2 small improvements.</p>
<h3>NO_PROXY</h3>
<p>This action now respects <code>no_proxy/NO_PROXY</code> environment variables which were previously ignored.</p>
<h3>New output <code>python-runtime-id</code></h3>
<p>The new output <code>python-runtime-id</code> can be used to know which python version exactly was installed if you use <code>activate-environment</code>. See <a href="">pyca/cryptography#15572</a> for details on why this can be useful.</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>fix: respect no proxy directive <a href="https://github.com/mj0nez"><code>@​mj0nez</code></a> (<a href="">#1037</a>)</li>
<li>Use JSON + a typed wrapper instead of TS codegen <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#1025</a>)</li>
</ul>
<h2>🚀 Enhancements</h2>
<ul>
<li>Expose a Python &quot;identity&quot; output <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#1036</a>)</li>
<li>Verify downloads with astral-sh/versions checksums <a href="https://github.com/zaniebot"><code>@​zaniebot</code></a> (<a href="">#1033</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.12.12 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1041</a>)</li>
<li>chore: update known checksums for 0.12.10/0.12.11 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1038</a>)</li>
<li>chore: update known checksums for 0.12.9 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1035</a>)</li>
<li>chore: update known checksums for 0.12.7/0.12.8 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1031</a>)</li>
<li>chore: update known checksums for 0.12.6 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1030</a>)</li>
<li>chore: update known checksums for 0.12.5 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1020</a>)</li>
<li>Use self-repo syntax for all in-repo actions/reusable workflows <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#1024</a>)</li>
<li>Pin one-shot tools <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#1022</a>)</li>
<li>ci: remove obsolete direct push attempts <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#1019</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>docs: update version references to v10.0.1 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1018</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>chore(deps-dev): roll up Dependabot updates <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#1043</a>)</li>
<li>Harden npm install defaults <a href="https://github.com/zaniebot"><code>@​zaniebot</code></a> (<a href="">#1026</a>)</li>
<li>Add dependency cooldowns <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#1021</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bec219d</code></a> chore(deps-dev): roll up Dependabot updates (<a href="">#1043</a>)</li>
<li><a href=""><code>b90ec40</code></a> fix: respect no proxy directive (<a href="">#1037</a>)</li>
<li><a href=""><code>421feb6</code></a> chore: update known checksums for 0.12.12 (<a href="">#1041</a>)</li>
<li><a href=""><code>f634bf4</code></a> Expose a Python &quot;identity&quot; output (<a href="">#1036</a>)</li>
<li><a href=""><code>a6772c8</code></a> chore: update known checksums for 0.12.10/0.12.11 (<a href="">#1038</a>)</li>
<li><a href=""><code>e105c8f</code></a> chore: update known checksums for 0.12.9 (<a href="">#1035</a>)</li>
<li><a href=""><code>cd13f92</code></a> Verify downloads with astral-sh/versions checksums (<a href="">#1033</a>)</li>
<li><a href=""><code>3aef7b9</code></a> chore: update known checksums for 0.12.7/0.12.8 (<a href="">#1031</a>)</li>
<li><a href=""><code>d08d816</code></a> chore: update known checksums for 0.12.6 (<a href="">#1030</a>)</li>
<li><a href=""><code>19b4d1e</code></a> Harden npm install defaults (<a href="">#1026</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/v10.0.1...v10.1.0">compare view</a></li>
</ul>
</details>
<br />

Updates `github/codeql-action` from 4.37.9 to 4.38.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v4.38.0</h2>
<ul>
<li>On GitHub-hosted runners, the CodeQL Action now deletes unused CodeQL bundles from the toolcache before downloading a different bundle, which frees up disk space for the analysis. We expect to roll this change out to everyone in September. <a href="">#4124</a></li>
<li>The CodeQL Action now supports CodeQL releases that are compatible with Linux Arm64 and downloads the native <code>linux-arm64</code> CodeQL bundle when available. <a href="">#4072</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.0">2.27.0</a>. <a href="">#4129</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h2>4.38.0 - 09 Sept 2026</h2>
<ul>
<li>On GitHub-hosted runners, the CodeQL Action now deletes unused CodeQL bundles from the toolcache before downloading a different bundle, which frees up disk space for the analysis. We expect to roll this change out to everyone in September. <a href="">#4124</a></li>
<li>The CodeQL Action now supports CodeQL releases that are compatible with Linux Arm64 and downloads the native <code>linux-arm64</code> CodeQL bundle when available. <a href="">#4072</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.0">2.27.0</a>. <a href="">#4129</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b96794f</code></a> Merge pull request <a href="">#4131</a> from github/update-v4.38.0-7e08580a9</li>
<li><a href=""><code>02d5093</code></a> Update changelog for v4.38.0</li>
<li><a href=""><code>7e08580</code></a> Merge pull request <a href="">#4130</a> from github/henrymercer/workflow-runner-sizing</li>
<li><a href=""><code>bfcc52b</code></a> Run slow macOS checks on larger runners</li>
<li><a href=""><code>8c251e7</code></a> Merge pull request <a href="">#4129</a> from github/update-bundle/codeql-bundle-v2.27.0</li>
<li><a href=""><code>0b7ca40</code></a> Add changelog note</li>
<li><a href=""><code>40484b3</code></a> Update default bundle to codeql-bundle-v2.27.0</li>
<li><a href=""><code>977e6ce</code></a> Merge pull request <a href="">#4124</a> from github/henrymercer/toolcache-bundle-cleanup</li>
<li><a href=""><code>40a6b38</code></a> Address toolcache cleanup review feedback</li>
<li><a href=""><code>deece8f</code></a> Apply suggestion from <a href="https://github.com/henrymercer"><code>@​henrymercer</code></a></li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/v4.37.9...v4.38.0">compare view</a></li>
</ul>
</details>
<br />

Updates `codecov/codecov-action` from 7.0.0 to 7.1.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/codecov/codecov-action/releases">codecov/codecov-action's releases</a>.</em></p>
<blockquote>
<h2>v7.1.0</h2>
<h2>What's Changed</h2>
<ul>
<li>chore(release): 7.1.0 by <a href="https://github.com/thomasrockhu-codecov"><code>@​thomasrockhu-codecov</code></a> in <a href="">codecov/codecov-action#1971</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/codecov/codecov-action/compare/v7.0.0...v7.1.0">https://github.com/codecov/codecov-action/compare/v7.0.0...v7.1.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0b35c9e</code></a> chore(release): 7.1.0 (<a href="">#1971</a>)</li>
<li>See full diff in <a href="https://github.com/codecov/codecov-action/compare/v7.0.0...v7.1.0">compare view</a></li>
</ul>
</details>
<br />

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
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8f0ad6bf3d17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.