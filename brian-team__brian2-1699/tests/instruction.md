# Issue

**Title:** chore(deps): bump astral-sh/setup-uv from 7.1.0 to 7.1.1

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 7.1.0 to 7.1.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v7.1.1 🌈 Fix empty workdir detection and lowest resolution strategy</h2>
<h2>Changes</h2>
<p>This release fixes a bug where the <code>working-directory</code> input was not used to detect an empty work dir. It also fixes the <code>lowest</code> resolution strategy resolving to latest when only a lower bound was specified.</p>
<p>Special thanks to <a href="https://github.com/tpgillam"><code>@​tpgillam</code></a> for the first contribution!</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>Fix &quot;lowest&quot; resolution strategy with lower-bound only <a href="https://github.com/tpgillam"><code>@​tpgillam</code></a> (<a href="">#649</a>)</li>
<li>Use working-directory to detect empty workdir <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#645</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.9.4 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#651</a>)</li>
<li>chore: update known checksums for 0.9.3 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#644</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>Change version in docs to v7 <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#647</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>Bump github/codeql-action from 4.30.7 to 4.30.8 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#639</a>)</li>
<li>Bump actions/setup-node from 5.0.0 to 6.0.0 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#641</a>)</li>
<li>Bump eifinger/actionlint-action from 1.9.1 to 1.9.2 @<a href="https://github.com/apps/dependabot">dependabot[bot]</a> (<a href="">#634</a>)</li>
<li>Update lockfile with latest npm <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#636</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2ddd2b9</code></a> chore: update known checksums for 0.9.4 (<a href="">#651</a>)</li>
<li><a href=""><code>b7bf789</code></a> Fix &quot;lowest&quot; resolution strategy with lower-bound only (<a href="">#649</a>)</li>
<li><a href=""><code>cb6c0a5</code></a> Change version in docs to v7 (<a href="">#647</a>)</li>
<li><a href=""><code>dffc629</code></a> Use working-directory to detect empty workdir (<a href="">#645</a>)</li>
<li><a href=""><code>6e346e1</code></a> chore: update known checksums for 0.9.3 (<a href="">#644</a>)</li>
<li><a href=""><code>3ccd0fd</code></a> Bump github/codeql-action from 4.30.7 to 4.30.8 (<a href="">#639</a>)</li>
<li><a href=""><code>ce6dbd8</code></a> Bump actions/setup-node from 5.0.0 to 6.0.0 (<a href="">#641</a>)</li>
<li><a href=""><code>2382069</code></a> Bump eifinger/actionlint-action from 1.9.1 to 1.9.2 (<a href="">#634</a>)</li>
<li><a href=""><code>b1daf91</code></a> Update lockfile with latest npm (<a href="">#636</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/setup-uv/compare/3259c6206f993105e3a61b142c2d97bf4b9ef83d...2ddd2b9cb38ad8efd50337e8ab201519a34c9f24">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=7.1.0&new-version=7.1.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `23475994ca17`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.