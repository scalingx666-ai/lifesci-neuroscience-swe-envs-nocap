# Issue

**Title:** Bump astral-sh/setup-uv from 7 to 8.0.0

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 7 to 8.0.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v8.0.0 🌈 Immutable releases and secure tags</h2>
<h1>This is the first immutable release of <code>setup-uv</code> 🥳</h1>
<p>All future releases are also immutable, if you want to know more about what this means checkout <a href="https://docs.github.com/en/code-security/concepts/supply-chain-security/immutable-releases">the docs</a>.</p>
<p>This release also has two breaking changes</p>
<h2>New format for <code>manifest-file</code></h2>
<p>The previously deprecated way of defining a custom version manifest to control which <code>uv</code> versions are available and where to download them from got removed. The functionality is still there but you have to use the <a href="https://github.com/astral-sh/setup-uv/blob/main/docs/customization.md#format">new format</a>.</p>
<h2>No more major and minor tags</h2>
<p>To increase <strong>security</strong> even more we will <strong>stop publishing minor tags</strong>. You won't be able to use <code>@v8</code> or <code>@v8.0</code> any longer. We do this because pinning to major releases opens up users to supply chain attacks like what happened to <a href="https://unit42.paloaltonetworks.com/github-actions-supply-chain-attack/">tj-actions</a>.</p>
<blockquote>
<p>[!TIP]
Use the immutable tag as a version <code>astral-sh/setup-uv@v8.0.0</code>
Or even better the githash <code>astral-sh/setup-uv@cec208311dfd045dd5311c1add060b2062131d57</code></p>
</blockquote>
<h2>🚨 Breaking changes</h2>
<ul>
<li>Remove update-major-minor-tags workflow <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#826</a>)</li>
<li>Remove deprecrated custom manifest <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#813</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>Shortcircuit latest version from manifest <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#828</a>)</li>
<li>Simplify inputs.ts <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#827</a>)</li>
<li>Bump release-drafter to v7.1.1 <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#825</a>)</li>
<li>Refactor inputs <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#823</a>)</li>
<li>Replace inline compile args with tsconfig <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#824</a>)</li>
<li>chore: update known checksums for 0.11.2 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#821</a>)</li>
<li>chore: update known checksums for 0.11.1 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#817</a>)</li>
<li>chore: update known checksums for 0.11.0 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#815</a>)</li>
<li>Fix latest-version workflow check <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#812</a>)</li>
<li>chore: update known checksums for 0.10.11/0.10.12 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#811</a>)</li>
</ul>
<h2>v7.6.0 🌈 Fetch uv from Astral's mirror by default</h2>
<h2>Changes</h2>
<p>We now default to download uv from <code>releases.astral.sh</code>.
This means by default we don't hit the GitHub API at all and shouldn't see any rate limits and timeouts any more.</p>
<h2>🚀 Enhancements</h2>
<ul>
<li>Fetch uv from Astral's mirror by default <a href="https://github.com/zsol"><code>@​zsol</code></a> (<a href="">#809</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>Switch to ESM for source and test, use CommonJS for dist <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#806</a>)</li>
<li>chore: update known checksums for 0.10.10 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#804</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>cec2083</code></a> Shortcircuit latest version from manifest (<a href="">#828</a>)</li>
<li><a href=""><code>4dd8ab4</code></a> Simplify inputs.ts (<a href="">#827</a>)</li>
<li><a href=""><code>7fdbe7c</code></a> Remove update-major-minor-tags workflow (<a href="">#826</a>)</li>
<li><a href=""><code>485abd0</code></a> Bump release-drafter to v7.1.1 (<a href="">#825</a>)</li>
<li><a href=""><code>f82eb19</code></a> Refactor inputs (<a href="">#823</a>)</li>
<li><a href=""><code>868d1f7</code></a> Replace inline compile args with tsconfig (<a href="">#824</a>)</li>
<li><a href=""><code>447e6d0</code></a> chore: update known checksums for 0.11.2 (<a href="">#821</a>)</li>
<li><a href=""><code>5c62c59</code></a> chore: update known checksums for 0.11.1 (<a href="">#817</a>)</li>
<li><a href=""><code>e1a7373</code></a> chore: update known checksums for 0.11.0 (<a href="">#815</a>)</li>
<li><a href=""><code>8970931</code></a> Remove deprecrated custom manifest (<a href="">#813</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/v7...v8.0.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=7&new-version=8.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `45c97eabaab3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.