# Issue

**Title:** Bump astral-sh/setup-uv from 7.1.4 to 7.1.6

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 7.1.4 to 7.1.6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v7.1.6 🌈 add OS version to cache key to prevent binary incompatibility</h2>
<h2>Changes</h2>
<p>This release will invalidate your cache existing keys!</p>
<p>The os version e.g. <code>ubuntu-22.04</code> is now part of the cache key. This prevents failing builds when a cache got populated with wheels built with different tools (e.g. glibc) than are present on the runner where the cache got restored.</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>feat: add OS version to cache key to prevent binary incompatibility <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#716</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.9.17 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#714</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>Bump actions/checkout from 5.0.0 to 6.0.1 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#712</a>)</li>
<li>Bump actions/setup-node from 6.0.0 to 6.1.0 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#715</a>)</li>
</ul>
<h2>v7.1.5 🌈 allow setting <code>cache-local-path</code> without <code>enable-cache: true</code></h2>
<h2>Changes</h2>
<p><a href="">astral-sh/setup-uv#612</a> fixed a faulty behavior where this action set <code>UV_CACHE_DIR</code> even though <code>enable-cache</code> was <code>false</code>. It also fixed the cases were the cache dir is already configured in a settings file like <code>pyproject.toml</code> or <code>UV_CACHE_DIR</code> was already set.  Here the action shouldn't overwrite or set <code>UV_CACHE_DIR</code>.</p>
<p>These fixes introduced an unwanted behavior: You can still set <code>cache-local-path</code> but this action didn't do anything. This release fixes that.</p>
<p>You can now use <code>cache-local-path</code> to automatically set <code>UV_CACHE_DIR</code> even when <code>enable-cache</code> is <code>false</code> (or gets set to false by default e.g. on self-hosted runners)</p>
<pre lang="yaml"><code>- name: This is now possible
  uses: astral-sh/setup-uv@v7
  with:
    enable-cache: false
    cache-local-path: &quot;/path/to/cache&quot;
</code></pre>
<h2>🐛 Bug fixes</h2>
<ul>
<li>allow cache-local-path w/o enable-cache <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#707</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>set biome files.maxSize to 2MiB <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#708</a>)</li>
<li>chore: update known checksums for 0.9.16 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#706</a>)</li>
<li>chore: update known checksums for 0.9.15 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#704</a>)</li>
<li>chore: use <code>npm ci --ignore-scripts</code> everywhere <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#699</a>)</li>
<li>chore: update known checksums for 0.9.14 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#700</a>)</li>
<li>chore: update known checksums for 0.9.13 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#694</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>681c641</code></a> Bump actions/checkout from 5.0.0 to 6.0.1 (<a href="">#712</a>)</li>
<li><a href=""><code>2e85713</code></a> Bump actions/setup-node from 6.0.0 to 6.1.0 (<a href="">#715</a>)</li>
<li><a href=""><code>58b6d7b</code></a> fix: add OS version to cache key to prevent binary incompatibility (<a href="">#716</a>)</li>
<li><a href=""><code>e8b52af</code></a> chore: update known checksums for 0.9.17 (<a href="">#714</a>)</li>
<li><a href=""><code>ed21f2f</code></a> Bump peter-evans/create-pull-request from 7.0.8 to 7.0.9 (<a href="">#695</a>)</li>
<li><a href=""><code>93202d8</code></a> bump dependencies (<a href="">#709</a>)</li>
<li><a href=""><code>5ce0900</code></a> set biome files.maxSize to 2MiB (<a href="">#708</a>)</li>
<li><a href=""><code>4180991</code></a> allow cache-local-path w/o enable-cache (<a href="">#707</a>)</li>
<li><a href=""><code>0439606</code></a> Bump github/codeql-action from 4.30.9 to 4.31.6 (<a href="">#698</a>)</li>
<li><a href=""><code>7dd56c1</code></a> chore: update known checksums for 0.9.16 (<a href="">#706</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/1e862dfacbd1d6d858c55d9b792c756523627244...681c641aba71e4a1c380be3ab5e12ad51f415867">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=7.1.4&new-version=7.1.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9578631abe31`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.