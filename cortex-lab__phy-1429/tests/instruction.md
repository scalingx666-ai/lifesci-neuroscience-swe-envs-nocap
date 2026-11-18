# Issue

**Title:** Bump the actions group with 2 updates

## Description

Bumps the actions group with 2 updates: [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) and [actions/upload-artifact](https://github.com/actions/upload-artifact).

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
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/c18668ad3cf93ea998bef934396af7bb5c839dc7...1c37ad07a6a961277cf70c0d37d6f313000f5884">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/upload-artifact` from 7.0.1 to 7.0.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/upload-artifact/releases">actions/upload-artifact's releases</a>.</em></p>
<blockquote>
<h2>v7.0.2</h2>
<h2>What's Changed</h2>
<ul>
<li>Improves artifact download retries when the service returns HTTP 429 (rate limiting), including honoring valid Retry-After headers.</li>
<li>Updates <code>@​actions/artifact</code> to v6.3.1.</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/tunc-d"><code>@​tunc-d</code></a> made their first contribution in <a href="">actions/upload-artifact#821</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/upload-artifact/compare/v7.0.1...v7.0.2">https://github.com/actions/upload-artifact/compare/v7.0.1...v7.0.2</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cf430e0</code></a> Merge pull request <a href="">#822</a> from actions/tunc-d-prepare-upload-v7-0-2</li>
<li><a href=""><code>c2acded</code></a> chore: prepare v7.0.2 release</li>
<li><a href=""><code>4687c1b</code></a> Merge pull request <a href="">#821</a> from actions/tunc-d-upload-artifact-package-bump</li>
<li><a href=""><code>8cbe1be</code></a> Bump <code>@​actions/artifact</code> to 6.3.1</li>
<li>See full diff in <a href="https://github.com/actions/upload-artifact/compare/043fb46d1a93c77aae656e7c1c64a875d1fc6a0a...cf430e030ddbb5b0abf93d22962f4752f3646cd9">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e4394912364`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.