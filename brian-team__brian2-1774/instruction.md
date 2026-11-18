# Issue

**Title:** Bump astral-sh/setup-uv from 7.1.6 to 7.3.0

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 7.1.6 to 7.3.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v7.3.0 🌈 New features and bug fixes for activate-environment</h2>
<h2>Changes</h2>
<p>This release contains a few bug fixes and a new feature for the activate-environment functionality.</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>fix: warn instead of error when no python to cache <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#762</a>)</li>
<li>fix: use --clear to create venv <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#761</a>)</li>
</ul>
<h2>🚀 Enhancements</h2>
<ul>
<li>feat: add venv-path input for activate-environment <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#746</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.10.0 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#759</a>)</li>
<li>refactor: tilde-expansion tests as unittests and no self-hosted tests <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#760</a>)</li>
<li>chore: update known checksums for 0.9.30 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#756</a>)</li>
<li>chore: update known checksums for 0.9.29 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#748</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>Fix punctuation <a href="https://github.com/pm-dev563"><code>@​pm-dev563</code></a> (<a href="">#747</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>Bump typesafegithub/github-actions-typing from 2.2.1 to 2.2.2 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#753</a>)</li>
<li>Bump peter-evans/create-pull-request from 8.0.0 to 8.1.0 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#751</a>)</li>
<li>Bump actions/checkout from 6.0.1 to 6.0.2 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#740</a>)</li>
<li>Bump release-drafter/release-drafter from 6.1.0 to 6.2.0 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#743</a>)</li>
<li>Bump eifinger/actionlint-action from 1.9.3 to 1.10.0 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#731</a>)</li>
<li>Bump actions/setup-node from 6.1.0 to 6.2.0 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#738</a>)</li>
</ul>
<h2>v7.2.0 🌈 add outputs python-version and python-cache-hit</h2>
<h2>Changes</h2>
<p>Among some minor typo fixes and quality of life features for developers of actions the main feature of this release are new outputs:</p>
<ul>
<li><strong>python-version:</strong> The Python version that was set (same content as existing <code>UV_PYTHON</code>)</li>
<li><strong>python-cache-hit:</strong> A boolean value to indicate the Python cache entry was found</li>
</ul>
<p>While implementing this it became clear, that it is easier to handle the Python binaries in a separate cache entry. The added benefit for users is that the &quot;normal&quot; cache containing the dependencies can be used in all runs no matter if these cache the Python binaries or not.</p>
<blockquote>
<p>[!NOTE]<br />
This release will invalidate caches that contain the Python binaries. This happens a single time.</p>
</blockquote>
<h2>🐛 Bug fixes</h2>
<ul>
<li>chore: remove stray space from UV_PYTHON_INSTALL_DIR message <a href="https://github.com/akx"><code>@​akx</code></a> (<a href="">#720</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>eac588a</code></a> Bump typesafegithub/github-actions-typing from 2.2.1 to 2.2.2 (<a href="">#753</a>)</li>
<li><a href=""><code>a97c6cb</code></a> Bump peter-evans/create-pull-request from 8.0.0 to 8.1.0 (<a href="">#751</a>)</li>
<li><a href=""><code>02182fa</code></a> fix: warn instead of error when no python to cache (<a href="">#762</a>)</li>
<li><a href=""><code>a3b3eae</code></a> chore: update known checksums for 0.10.0 (<a href="">#759</a>)</li>
<li><a href=""><code>78cebec</code></a> fix: use --clear to create venv (<a href="">#761</a>)</li>
<li><a href=""><code>b6b8e2c</code></a> refactor: tilde-expansion tests as unittests and no self-hosted tests (<a href="">#760</a>)</li>
<li><a href=""><code>e31bec8</code></a> chore: update known checksums for 0.9.30 (<a href="">#756</a>)</li>
<li><a href=""><code>db2b65e</code></a> Bump actions/checkout from 6.0.1 to 6.0.2 (<a href="">#740</a>)</li>
<li><a href=""><code>3511ff7</code></a> feat: add venv-path input for activate-environment (<a href="">#746</a>)</li>
<li><a href=""><code>99b0f04</code></a> Fix punctuation (<a href="">#747</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/681c641aba71e4a1c380be3ab5e12ad51f415867...eac588ad8def6316056a12d4907a9d4d84ff7a3b">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=7.1.6&new-version=7.3.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `526f6f2dc677`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.