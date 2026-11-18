# Issue

**Title:** Bump astral-sh/setup-uv from 7.1.2 to 7.1.4

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 7.1.2 to 7.1.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v7.1.4 🌈 Fix libuv closing bug on Windows</h2>
<h2>Changes</h2>
<p>This release fixes the bug <code>Assertion failed: !(handle-&gt;flags &amp; UV_HANDLE_CLOSING)</code> on Windows runners</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>Wait 50ms before exit to fix libuv bug <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#689</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.9.10 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#681</a>)</li>
<li>chore: update known checksums for 0.9.9 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#679</a>)</li>
</ul>
<h2>v7.1.3 🌈 Support act</h2>
<h2>Changes</h2>
<p>This bug fix release adds support for <a href="https://github.com/nektos/act">https://github.com/nektos/act</a>
It was previously broken because of a too new <code>undici</code> version and TS transpilation target.</p>
<p>Compatibility with act is now automatically tested.</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>use old undici and ES2022 target for act support <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#678</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.9.8 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#677</a>)</li>
<li>chore: update known checksums for 0.9.7 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#671</a>)</li>
<li>chore: update known checksums for 0.9.6 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#670</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>Correct description of <code>cache-dependency-glob</code> <a href="https://github.com/allanlewis"><code>@​allanlewis</code></a> (<a href="">#676</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1e862df</code></a> Wait 50ms before exit to fix libuv bug (<a href="">#689</a>)</li>
<li><a href=""><code>d7d33e1</code></a> chore: update known checksums for 0.9.10 (<a href="">#681</a>)</li>
<li><a href=""><code>486d0b8</code></a> chore: update known checksums for 0.9.9 (<a href="">#679</a>)</li>
<li><a href=""><code>5a7eac6</code></a> use old undici and ES2022 target for act support (<a href="">#678</a>)</li>
<li><a href=""><code>b49dc9e</code></a> chore: update known checksums for 0.9.8 (<a href="">#677</a>)</li>
<li><a href=""><code>30ce38e</code></a> Correct description of <code>cache-dependency-glob</code> (<a href="">#676</a>)</li>
<li><a href=""><code>0d20755</code></a> chore: update known checksums for 0.9.7 (<a href="">#671</a>)</li>
<li><a href=""><code>8491d1d</code></a> chore: update known checksums for 0.9.6 (<a href="">#670</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/setup-uv/compare/85856786d1ce8acfbcc2f13a5f3fbd6b938f9f41...1e862dfacbd1d6d858c55d9b792c756523627244">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=7.1.2&new-version=7.1.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01315468b17c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.