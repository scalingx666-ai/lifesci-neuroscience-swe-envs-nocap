# Issue

**Title:** Bump astral-sh/setup-uv from 6.0.1 to 6.1.0

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 6.0.1 to 6.1.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v6.1.0 🌈</h2>
<h2>Changes</h2>
<p>This release adds the input <code>server-url</code> which defaults to <code>https://github.com</code>. You can set this to a custom url to control where this action downloads the uv release from. This is useful for users of gitea and comparable solutions.</p>
<p><a href="https://github.com/sebadevo"><code>@​sebadevo</code></a> pointed out that we don't invalidate the cache when the <code>prune-cache</code> input is changed. This leads to unnessecarily big caches. The input is now used to compute the cache key, properly invalidating the cache when it is changed.</p>
<blockquote>
<p>[!NOTE]<br />
For most users this release will invalidate the cache once.
You will see the known warning <a href="https://github.com/astral-sh/setup-uv?tab=readme-ov-file#why-do-i-see-warnings-like-no-github-actions-cache-found-for-key">no-github-actions-cache-found-for-key</a>
This is expected and will only appear once.</p>
</blockquote>
<h2>🐛 Bug fixes</h2>
<ul>
<li>Purge cache in cache key <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#423</a>)</li>
</ul>
<h2>🚀 Enhancements</h2>
<ul>
<li>feat: support custom github url <a href="https://github.com/Zoupers"><code>@​Zoupers</code></a> (<a href="">#414</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known versions for 0.7.7 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#422</a>)</li>
<li>chore: update known versions for 0.7.6 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#415</a>)</li>
<li>chore: update known versions for 0.7.5 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#412</a>)</li>
<li>chore: update known versions for 0.7.4 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#410</a>)</li>
<li>chore: update known versions for 0.7.3 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#405</a>)</li>
<li>Fix path to known-checksums.ts <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#404</a>)</li>
<li>Fix update-known-versions workflow argument <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#401</a>)</li>
<li>Fix update-known-versions workflow <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#400</a>)</li>
<li>Create version-manifest.json on uv release <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#399</a>)</li>
<li>Run infrastructure workflows on arm runners <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#396</a>)</li>
<li>chore: update known checksums for 0.7.2 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#395</a>)</li>
<li>chore: update known checksums for 0.7.0 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#390</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>Add section to README explaining if packages are installed by setup-uv <a href="https://github.com/pirate"><code>@​pirate</code></a> (<a href="">#398</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>Bump dependencies <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#424</a>)</li>
<li>Bump typescript from 5.8.2 to 5.8.3 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#393</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f0ec1fc</code></a> Bump dependencies (<a href="">#424</a>)</li>
<li><a href=""><code>e3d2ea5</code></a> Purge cache in cache key (<a href="">#423</a>)</li>
<li><a href=""><code>b3d7ca7</code></a> chore: update known versions for 0.7.7 (<a href="">#422</a>)</li>
<li><a href=""><code>0e0f4bf</code></a> feat: support custom github url (<a href="">#414</a>)</li>
<li><a href=""><code>71bb882</code></a> chore: update known versions for 0.7.6 (<a href="">#415</a>)</li>
<li><a href=""><code>1417e89</code></a> chore: update known versions for 0.7.5 (<a href="">#412</a>)</li>
<li><a href=""><code>1761eea</code></a> chore: update known versions for 0.7.4 (<a href="">#410</a>)</li>
<li><a href=""><code>9864bc9</code></a> chore: update known versions for 0.7.3 (<a href="">#405</a>)</li>
<li><a href=""><code>0e9cccb</code></a> Fix path to known-checksums.ts (<a href="">#404</a>)</li>
<li><a href=""><code>b6f9e9c</code></a> Bump typescript from 5.8.2 to 5.8.3 (<a href="">#393</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/6b9c6063abd6010835644d4c2e1bef4cf5cd0fca...f0ec1fc3b38f5e7cd731bb6ce540c5af426746bb">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=6.0.1&new-version=6.1.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `923d8828b735`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.