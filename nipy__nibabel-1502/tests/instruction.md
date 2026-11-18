# Issue

**Title:** chore(deps): bump astral-sh/setup-uv from 8.0.0 to 8.1.0

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 8.0.0 to 8.1.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v8.1.0 🌈 New input <code>no-project</code></h2>
<h2>Changes</h2>
<p>This add the a new boolean input <code>no-project</code>.
It only makes sense to use in combination with <code>activate-environment: true</code> and will append <code>--no project</code> to the <code>uv venv</code> call. This is for example useful <a href="">if you have a pyproject.toml file with parts unparseable by uv</a></p>
<h2>🚀 Enhancements</h2>
<ul>
<li>Add input no-project in combination with activate-environment <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#856</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>fix: grant contents:write to validate-release job <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#860</a>)</li>
<li>Add a release-gate step to the release workflow <a href="https://github.com/zanieb"><code>@​zanieb</code></a> (<a href="">#859</a>)</li>
<li>Draft commitish releases <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#858</a>)</li>
<li>Add action-types.yml to instructions <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#857</a>)</li>
<li>chore: update known checksums for 0.11.7 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#853</a>)</li>
<li>Refactor version resolving <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#852</a>)</li>
<li>chore: update known checksums for 0.11.6 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#850</a>)</li>
<li>chore: update known checksums for 0.11.5 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#845</a>)</li>
<li>chore: update known checksums for 0.11.4 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#843</a>)</li>
<li>Add a release workflow <a href="https://github.com/zanieb"><code>@​zanieb</code></a> (<a href="">#839</a>)</li>
<li>chore: update known checksums for 0.11.3 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#836</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>Update ignore-nothing-to-cache documentation <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#833</a>)</li>
<li>Pin setup-uv docs to v8 <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#829</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>chore(deps): bump release-drafter/release-drafter from 7.1.1 to 7.2.0 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#855</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0880764</code></a> fix: grant contents:write to validate-release job (<a href="">#860</a>)</li>
<li><a href=""><code>717d6ab</code></a> Add a release-gate step to the release workflow (<a href="">#859</a>)</li>
<li><a href=""><code>5a911eb</code></a> Draft commitish releases (<a href="">#858</a>)</li>
<li><a href=""><code>080c31e</code></a> Add action-types.yml to instructions (<a href="">#857</a>)</li>
<li><a href=""><code>b3e97d2</code></a> Add input no-project in combination with activate-environment (<a href="">#856</a>)</li>
<li><a href=""><code>7dd591d</code></a> chore(deps): bump release-drafter/release-drafter from 7.1.1 to 7.2.0 (<a href="">#855</a>)</li>
<li><a href=""><code>1541b77</code></a> chore: update known checksums for 0.11.7 (<a href="">#853</a>)</li>
<li><a href=""><code>cdfb2ee</code></a> Refactor version resolving (<a href="">#852</a>)</li>
<li><a href=""><code>cb84d12</code></a> chore: update known checksums for 0.11.6 (<a href="">#850</a>)</li>
<li><a href=""><code>1912cc6</code></a> chore: update known checksums for 0.11.5 (<a href="">#845</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/cec208311dfd045dd5311c1add060b2062131d57...08807647e7069bb48b6ef5acd8ec9567f424441b">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=8.0.0&new-version=8.1.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `09bdbf4c40a6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.