# Issue

**Title:** chore(deps): bump astral-sh/setup-uv from 10.1.0 to 10.2.0

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 10.1.0 to 10.2.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v10.2.0 🌈 Disable automatic cache saves for merge queues</h2>
<h2>Changes</h2>
<p>This release contains the known-checksum of the most recent uv releases and also disabled the uploading(saving) of the cache when in a merge queue since theses caches would almost never be used.</p>
<h2>🚀 Enhancements</h2>
<ul>
<li>Disable automatic cache saves for merge queues <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#1056</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.12.17 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1058</a>)</li>
<li>chore: update known checksums for 0.12.16 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1057</a>)</li>
<li>chore: update known checksums for 0.12.15 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1054</a>)</li>
<li>chore: update known checksums for 0.12.14 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1053</a>)</li>
<li>chore: update known checksums for 0.12.13 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1045</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>docs: update version references to v10.1.0 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1044</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>chore(deps): roll up Dependabot updates <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#1059</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c18668a</code></a> chore(deps): roll up Dependabot updates (<a href="">#1059</a>)</li>
<li><a href=""><code>ffe1476</code></a> chore: update known checksums for 0.12.17 (<a href="">#1058</a>)</li>
<li><a href=""><code>f5548c5</code></a> chore: update known checksums for 0.12.16 (<a href="">#1057</a>)</li>
<li><a href=""><code>a761a4e</code></a> Disable automatic cache saves for merge queues (<a href="">#1056</a>)</li>
<li><a href=""><code>3377a30</code></a> chore: update known checksums for 0.12.15 (<a href="">#1054</a>)</li>
<li><a href=""><code>dfb5f38</code></a> chore: update known checksums for 0.12.14 (<a href="">#1053</a>)</li>
<li><a href=""><code>45c121f</code></a> chore: update known checksums for 0.12.13 (<a href="">#1045</a>)</li>
<li><a href=""><code>8073452</code></a> docs: update version references to v10.1.0 (<a href="">#1044</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/setup-uv/compare/bec219d24cd3e171d82865faccec33120bb574f4...c18668ad3cf93ea998bef934396af7bb5c839dc7">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=10.1.0&new-version=10.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a490a21bfa25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.