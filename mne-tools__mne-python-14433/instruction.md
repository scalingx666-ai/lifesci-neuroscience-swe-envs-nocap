# Issue

**Title:** [dependabot]: Bump the actions group with 2 updates

## Description

Bumps the actions group with 2 updates: [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) and [github/codeql-action](https://github.com/github/codeql-action).

Updates `astral-sh/setup-uv` from 10.2.0 to 10.3.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v10.3.0 🌈 Add Python architecture selection</h2>
<h2>Changes</h2>
<p>This release adds the <code>python-arch</code> input to select a Python architecture independently of the Python version. With <code>uv</code> 0.13.0 or later, set <code>python-arch: x86_64</code> to use x64 Python on Windows ARM64 runners.</p>
<p>It also includes embedded checksums for <code>uv</code> releases through 0.13.0.</p>
<ul>
<li>Use macOS 15 runners for tests <a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a> (<a href="">#1081</a>)</li>
</ul>
<h2>🚀 Enhancements</h2>
<ul>
<li>Add <code>python-arch</code> support <a href="https://github.com/zanieb"><code>@​zanieb</code></a> (<a href="">#1079</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.13.0 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1089</a>)</li>
<li>chore: update known checksums for 0.12.24 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1084</a>)</li>
<li>chore: update known checksums for 0.12.23 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1082</a>)</li>
<li>chore: update known checksums for 0.12.22 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1080</a>)</li>
<li>chore: update known checksums for 0.12.21 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1078</a>)</li>
<li>chore: update known checksums for 0.12.20 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1076</a>)</li>
<li>chore: update known checksums for 0.12.19 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1068</a>)</li>
<li>chore: update known checksums for 0.12.18 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1065</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>chore(deps): bump zizmorcore/zizmor-action from 0.6.2 to 0.6.3 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#1077</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1c37ad0</code></a> chore: update known checksums for 0.13.0 (<a href="">#1089</a>)</li>
<li><a href=""><code>b3c9b5f</code></a> chore: update known checksums for 0.12.24 (<a href="">#1084</a>)</li>
<li><a href=""><code>b06acff</code></a> Add <code>python-arch</code> support (<a href="">#1079</a>)</li>
<li><a href=""><code>c84232c</code></a> chore: update known checksums for 0.12.23 (<a href="">#1082</a>)</li>
<li><a href=""><code>51fdd26</code></a> Use macOS 15 runners for tests (<a href="">#1081</a>)</li>
<li><a href=""><code>a96208b</code></a> chore: update known checksums for 0.12.22 (<a href="">#1080</a>)</li>
<li><a href=""><code>0e3884b</code></a> chore: update known checksums for 0.12.21 (<a href="">#1078</a>)</li>
<li><a href=""><code>bcf0580</code></a> chore: update known checksums for 0.12.20 (<a href="">#1076</a>)</li>
<li><a href=""><code>b92a892</code></a> chore(deps): bump zizmorcore/zizmor-action from 0.6.2 to 0.6.3 (<a href="">#1077</a>)</li>
<li><a href=""><code>227a0f6</code></a> chore: update known checksums for 0.12.19 (<a href="">#1068</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/v10.2.0...v10.3.0">compare view</a></li>
</ul>
</details>
<br />

Updates `github/codeql-action` from 4.38.2 to 4.38.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/releases">github/codeql-action's releases</a>.</em></p>
<blockquote>
<h2>v4.38.3</h2>
<ul>
<li><em>Upcoming breaking change</em>: CodeQL version 2.21.2 and earlier were discontinued on 24 September 2026 alongside GitHub Enterprise Server 3.17, and will be unsupported by the next minor release of the CodeQL Action. Added a deprecation warning for customers using these versions of CodeQL. <a href="">#4188</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.2">2.27.2</a>. <a href="">#4203</a></li>
<li>Fixed a bug where the decision of whether to use a per-language bundle did not account for custom configurations that reference queries outside of compiled CodeQL packs. This issue was caught during internal testing and did not affect any customer repositories. We will resume the roll out of per-language bundles in the coming weeks. <a href="">#4184</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/github/codeql-action/blob/main/CHANGELOG.md">github/codeql-action's changelog</a>.</em></p>
<blockquote>
<h2>4.38.3 - 08 Oct 2026</h2>
<ul>
<li><em>Upcoming breaking change</em>: CodeQL version 2.21.2 and earlier were discontinued on 24 September 2026 alongside GitHub Enterprise Server 3.17, and will be unsupported by the next minor release of the CodeQL Action. Added a deprecation warning for customers using these versions of CodeQL. <a href="">#4188</a></li>
<li>Update default CodeQL bundle version to <a href="https://github.com/github/codeql-action/releases/tag/codeql-bundle-v2.27.2">2.27.2</a>. <a href="">#4203</a></li>
<li>Fixed a bug where the decision of whether to use a per-language bundle did not account for custom configurations that reference queries outside of compiled CodeQL packs. This issue was caught during internal testing and did not affect any customer repositories. We will resume the roll out of per-language bundles in the coming weeks. <a href="">#4184</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>24c5418</code></a> Merge pull request <a href="">#4214</a> from github/update-v4.38.3-e0b52dbdc</li>
<li><a href=""><code>69e87c5</code></a> Add changelog note for <a href="">#4184</a></li>
<li><a href=""><code>23b6828</code></a> Update changelog for v4.38.3</li>
<li><a href=""><code>e0b52db</code></a> Merge pull request <a href="">#4210</a> from github/henrymercer/pin-python-for-older-clis-in-ci</li>
<li><a href=""><code>6b99698</code></a> Pin Python 3.13.15 for older CLI versions in multi-language check</li>
<li><a href=""><code>63d3d63</code></a> Merge pull request <a href="">#4203</a> from github/update-bundle/codeql-bundle-v2.27.2</li>
<li><a href=""><code>7377a10</code></a> Add changelog note</li>
<li><a href=""><code>c1a30cd</code></a> Update default bundle to codeql-bundle-v2.27.2</li>
<li><a href=""><code>d208ec7</code></a> Merge pull request <a href="">#4200</a> from github/mbg/esm/migrate-pr-checks</li>
<li><a href=""><code>a71b0c6</code></a> Replace <code>__dirname</code> in <code>sync.ts</code></li>
<li>Additional commits viewable in <a href="https://github.com/github/codeql-action/compare/v4.38.2...v4.38.3">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ad4f8b424eb0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.