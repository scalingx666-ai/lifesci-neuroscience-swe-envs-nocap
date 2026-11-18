# Issue

**Title:** chore(deps): bump astral-sh/setup-uv from 7.1.1 to 7.1.2

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 7.1.1 to 7.1.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v7.1.2 🌈 Speed up extraction on Windows</h2>
<h2>Changes</h2>
<p><a href="https://github.com/lazka"><code>@​lazka</code></a> fixed a bug that caused extracting uv to take up to 30s. Thank you!</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>Use tar for extracting the uv zip file on Windows too <a href="https://github.com/lazka"><code>@​lazka</code></a> (<a href="">#660</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.9.5 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#663</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>Bump dependencies <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#664</a>)</li>
<li>Bump github/codeql-action from 4.30.8 to 4.30.9 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#652</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8585678</code></a> Bump dependencies (<a href="">#664</a>)</li>
<li><a href=""><code>22d500a</code></a> Bump github/codeql-action from 4.30.8 to 4.30.9 (<a href="">#652</a>)</li>
<li><a href=""><code>14d5571</code></a> chore: update known checksums for 0.9.5 (<a href="">#663</a>)</li>
<li><a href=""><code>29cd235</code></a> Use tar for extracting the uv zip file on Windows too (<a href="">#660</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/setup-uv/compare/2ddd2b9cb38ad8efd50337e8ab201519a34c9f24...85856786d1ce8acfbcc2f13a5f3fbd6b938f9f41">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=7.1.1&new-version=7.1.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b3fe6192b2e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.