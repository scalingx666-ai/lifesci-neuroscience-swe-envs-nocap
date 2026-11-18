# Issue

**Title:** chore(deps): bump astral-sh/setup-uv from 6.3.1 to 7.1.0

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 6.3.1 to 7.1.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v7.1.0 🌈 Support all the use cases</h2>
<h2>Changes</h2>
<p><strong>Support all the use cases!!!</strong>
... well, that we know of.</p>
<p>This release adds support for some use cases that most users don't encounter but are useful for e.g. people running Gitea.</p>
<p>The input <code>resolution-strategy</code> lets you use the lowest possible version of uv from a version range. Useful if you want to test your tool with different versions of uv.</p>
<p>If you use <code>activate-environment</code> the path to the activated venv is now also exposed under the output <code>venv</code>.</p>
<p>Downloaded python installations can now also be uploaded to the GitHub Actions cache backend. Useful if you are running in <code>act</code> and have configured your own backend and don't want to download python again, and again over a slow internet connection.</p>
<p>Finally the path to installed python interpreters is now added to the <code>PATH</code> on Windows.</p>
<h2>🚀 Enhancements</h2>
<ul>
<li>Add resolution-strategy input to support oldest compatible version selection @<a href="https://github.com/apps/copilot-swe-agent">copilot-swe-agent[bot]</a> (<a href="">#631</a>)</li>
<li>Add value of UV_PYTHON_INSTALL_DIR to path <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#628</a>)</li>
<li>Set output venv when activate-environment is used <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#627</a>)</li>
<li>Cache python installs <a href="https://github.com/merlinz01"><code>@​merlinz01</code></a> (<a href="">#621</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>Add copilot-instructions.md <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#630</a>)</li>
<li>chore: update known checksums for 0.9.2 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#626</a>)</li>
<li>chore: update known checksums for 0.9.1 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#625</a>)</li>
<li>Fall back to PR for updating known versions <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#623</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>Split up documentation <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#632</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>Bump deps <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#633</a>)</li>
<li>Bump github/codeql-action from 3.30.6 to 4.30.7 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#614</a>)</li>
</ul>
<h2>v7.0.0 🌈 node24 and a lot of bugfixes</h2>
<h2>Changes</h2>
<p>This release comes with a load of bug fixes and a speed up. Because of switching from node20 to node24 it is also a breaking change. If you are running on GitHub hosted runners this will just work, if you are using self-hosted runners make sure, that your runners are up to date. If you followed the normal installation instructions your self-hosted runner will keep itself updated.</p>
<p>This release also removes the deprecated input <code>server-url</code> which was used to download uv releases from a different server.
The <a href="https://github.com/astral-sh/setup-uv?tab=readme-ov-file#manifest-file">manifest-file</a> input supersedes that functionality by adding a flexible way to define available versions and where they should be downloaded from.</p>
<h3>Fixes</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3259c62</code></a> Bump deps (<a href="">#633</a>)</li>
<li><a href=""><code>bf8e8ed</code></a> Split up documentation (<a href="">#632</a>)</li>
<li><a href=""><code>9c6b5e9</code></a> Add resolution-strategy input to support oldest compatible version selection ...</li>
<li><a href=""><code>a5129e9</code></a> Add copilot-instructions.md (<a href="">#630</a>)</li>
<li><a href=""><code>d18bcc7</code></a> Add value of UV_PYTHON_INSTALL_DIR to path (<a href="">#628</a>)</li>
<li><a href=""><code>bd1f875</code></a> Set output venv when activate-environment is used (<a href="">#627</a>)</li>
<li><a href=""><code>1a91c38</code></a> chore: update known checksums for 0.9.2 (<a href="">#626</a>)</li>
<li><a href=""><code>c79f606</code></a> chore: update known checksums for 0.9.1 (<a href="">#625</a>)</li>
<li><a href=""><code>e0249f1</code></a> Fall back to PR for updating known versions (<a href="">#623</a>)</li>
<li><a href=""><code>6d2eb15</code></a> Cache python installs (<a href="">#621</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/bd01e18f51369d5a26f1651c3cb451d3417e3bba...3259c6206f993105e3a61b142c2d97bf4b9ef83d">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=6.3.1&new-version=7.1.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b59b3771975f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.