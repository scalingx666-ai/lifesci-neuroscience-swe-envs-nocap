# Issue

**Title:** chore(deps): bump uv from 0.11.14 to 0.11.15

## Description

Bumps [uv](https://github.com/astral-sh/uv) from 0.11.14 to 0.11.15.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/uv/releases">uv's releases</a>.</em></p>
<blockquote>
<h2>0.11.15</h2>
<h2>Release Notes</h2>
<p>Released on 2026-05-18.</p>
<h3>Security</h3>
<ul>
<li>Fix a TAR parser differential, see <a href="https://github.com/astral-sh/tokio-tar/security/advisories/GHSA-3cv2-h65g-fgmm">GHSA-3cv2-h65g-fgmm</a> (<a href="">#19463</a>)</li>
<li>Enforce that entry points cannot escape in the scripts directory, see <a href="https://github.com/astral-sh/uv/security/advisories/GHSA-4gg8-gxpx-9rph">GHSA-4gg8-gxpx-9rph</a> (<a href="">#19464</a>)</li>
</ul>
<h3>Enhancements</h3>
<ul>
<li>Add TOML v1.1 -&gt; v1.0 backwards compatibility for source distributions (<a href="">#18741</a>)</li>
<li>Add support for Azure request signing (<a href="">#19421</a>)</li>
<li>Apply stricter validation to all wheel filename segments (<a href="">#19364</a>)</li>
<li>Reject empty strings as an invalid package name (<a href="">#19435</a>)</li>
<li>Use structured errors for signing authentication failures (<a href="">#19422</a>)</li>
</ul>
<h3>Preview</h3>
<ul>
<li>uv audit: Add JSON output (<a href="">#19305</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Respect <code>required-environments</code> in <code>uv pip compile</code> (<a href="">#19378</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid parsing JSON manifest when local Python is available (<a href="">#19398</a>)</li>
<li>Avoid walking nested directories in linker conflict registration (<a href="">#19382</a>)</li>
<li>Optimize async wheel ZIP writing (<a href="">#19383</a>)</li>
<li>Fix dead &quot;already trimmed&quot; fast-path in <code>Version::only_release_trimmed</code> (<a href="">#19425</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Apply workspace-member <code>[tool.uv.sources]</code> credentials under <code>uv sync --frozen</code> (<a href="">#19423</a>)</li>
<li>Skip empty directories in uv build outputs (<a href="">#19437</a>)</li>
<li>Fix Git submodule handling when using relative paths (<a href="">#12156</a>)</li>
<li>Fix line number reporting in netrc parsing (<a href="">#19452</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Move Bazel auth helper setup into integration guide (<a href="">#19392</a>)</li>
</ul>
<h2>Install uv 0.11.15</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/uv/releases/download/0.11.15/uv-installer.sh | sh
&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/uv/blob/main/CHANGELOG.md">uv's changelog</a>.</em></p>
<blockquote>
<h2>0.11.15</h2>
<p>Released on 2026-05-18.</p>
<h3>Security</h3>
<ul>
<li>Fix a TAR parser differential, see <a href="https://github.com/astral-sh/tokio-tar/security/advisories/GHSA-3cv2-h65g-fgmm">GHSA-3cv2-h65g-fgmm</a> (<a href="">#19463</a>)</li>
<li>Enforce that entry points cannot escape in the scripts directory, see <a href="https://github.com/astral-sh/uv/security/advisories/GHSA-4gg8-gxpx-9rph">GHSA-4gg8-gxpx-9rph</a> (<a href="">#19464</a>)</li>
</ul>
<h3>Enhancements</h3>
<ul>
<li>Add TOML v1.1 -&gt; v1.0 backwards compatibility for source distributions (<a href="">#18741</a>)</li>
<li>Add support for Azure request signing (<a href="">#19421</a>)</li>
<li>Apply stricter validation to all wheel filename segments (<a href="">#19364</a>)</li>
<li>Reject empty strings as an invalid package name (<a href="">#19435</a>)</li>
<li>Use structured errors for signing authentication failures (<a href="">#19422</a>)</li>
</ul>
<h3>Preview</h3>
<ul>
<li>uv audit: Add JSON output (<a href="">#19305</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Respect <code>required-environments</code> in <code>uv pip compile</code> (<a href="">#19378</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid parsing JSON manifest when local Python is available (<a href="">#19398</a>)</li>
<li>Avoid walking nested directories in linker conflict registration (<a href="">#19382</a>)</li>
<li>Optimize async wheel ZIP writing (<a href="">#19383</a>)</li>
<li>Fix dead &quot;already trimmed&quot; fast-path in <code>Version::only_release_trimmed</code> (<a href="">#19425</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Apply workspace-member <code>[tool.uv.sources]</code> credentials under <code>uv sync --frozen</code> (<a href="">#19423</a>)</li>
<li>Skip empty directories in uv build outputs (<a href="">#19437</a>)</li>
<li>Fix Git submodule handling when using relative paths (<a href="">#12156</a>)</li>
<li>Fix line number reporting in netrc parsing (<a href="">#19452</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Move Bazel auth helper setup into integration guide (<a href="">#19392</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3cffe97</code></a> Fix crates.io publish script lockfile (<a href="">#19473</a>)</li>
<li><a href=""><code>de16a7b</code></a> Bump version to 0.11.15 (<a href="">#19472</a>)</li>
<li><a href=""><code>cf826cc</code></a> Disable <code>test_simultaneous_create_set_then_move</code> on Linux (<a href="">#19469</a>)</li>
<li><a href=""><code>2d566bc</code></a> Allow retry of <code>custom-publish-crates</code> separately from <code>announce</code> (<a href="">#19470</a>)</li>
<li><a href=""><code>0588b8f</code></a> Run release builds on maturin version bumps in CI (<a href="">#19466</a>)</li>
<li><a href=""><code>9a65753</code></a> Enforce that entry points cannot escape in the scripts directory (<a href="">#19464</a>)</li>
<li><a href=""><code>d77d849</code></a> Revert &quot;Update maturin to v1.13.2 (<a href="">#19445</a>)&quot; (<a href="">#19465</a>)</li>
<li><a href=""><code>5373e96</code></a> Update Rust crate rustls to v0.23.40 (<a href="">#19250</a>)</li>
<li><a href=""><code>fb8d3d4</code></a> Update Rust crate rustls-pki-types to v1.14.1 (<a href="">#19251</a>)</li>
<li><a href=""><code>078480d</code></a> Configure maturin and uv so <code>uv run</code> can be used to work on uv itself (<a href="">#19461</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/uv/compare/0.11.14...0.11.15">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=uv&package-manager=uv&previous-version=0.11.14&new-version=0.11.15)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

You can trigger a rebase of this PR by commenting `@dependabot rebase`.

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/nipy/nibabel/network/alerts).

</details>

> **Note**
> Automatic rebases have been disabled on this pull request as it has been open for over 30 days.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b4561ad875c4`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.