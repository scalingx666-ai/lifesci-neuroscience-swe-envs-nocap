# Issue

**Title:** chore(deps-dev): Bump vitest from 3.2.4 to 3.2.6

## Description

Bumps [vitest](https://github.com/vitest-dev/vitest/tree/HEAD/packages/vitest) from 3.2.4 to 3.2.6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/vitest-dev/vitest/releases">vitest's releases</a>.</em></p>
<blockquote>
<h2>v3.2.6</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li>Pin last supported vite-node version  -  by <a href="https://github.com/sheremet-va"><code>@​sheremet-va</code></a> <a href=""><!-- raw HTML omitted -->(16f12)<!-- raw HTML omitted --></a></li>
</ul>
<h5>    <a href="https://github.com/vitest-dev/vitest/compare/v3.2.5...v3.2.6">View changes on GitHub</a></h5>
<h2>v3.2.5</h2>
<h3>   🚀 Features</h3>
<ul>
<li><strong>api</strong>: Add <code>allowWrite</code> and <code>allowExec</code> options to <code>api</code> [backport to v3]  -  by <a href="https://github.com/hi-ogawa"><code>@​hi-ogawa</code></a> and <strong>Codex</strong> in <a href="">vitest-dev/vitest#10445</a> <a href=""><!-- raw HTML omitted -->(af88b)<!-- raw HTML omitted --></a></li>
</ul>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li><strong>browser</strong>: Disable client <code>cdp</code> API when <code>allowWrite/allowExec: false</code> [backport to v3]  -  by <a href="https://github.com/hi-ogawa"><code>@​hi-ogawa</code></a> and <strong>Codex</strong> in <a href="">vitest-dev/vitest#10456</a> <a href=""><!-- raw HTML omitted -->(385a1)<!-- raw HTML omitted --></a></li>
</ul>
<h5>    <a href="https://github.com/vitest-dev/vitest/compare/v3.2.4...v3.2.5">View changes on GitHub</a></h5>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b6d56f8</code></a> chore: release v3.2.6</li>
<li><a href=""><code>16f120d</code></a> fix: pin last supported vite-node version</li>
<li><a href=""><code>2cbad0a</code></a> chore: release v3.2.5</li>
<li><a href=""><code>385a1ae</code></a> fix(browser): disable client <code>cdp</code> API when <code>allowWrite/allowExec: false</code> [ba...</li>
<li><a href=""><code>af88b1f</code></a> feat(api): add <code>allowWrite</code> and <code>allowExec</code> options to <code>api</code> [backport to v3]...</li>
<li>See full diff in <a href="https://github.com/vitest-dev/vitest/commits/v3.2.6/packages/vitest">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for vitest since your current version.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=vitest&package-manager=npm_and_yarn&previous-version=3.2.4&new-version=3.2.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/OpenNeuroOrg/openneuro/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `367e3123db57`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.