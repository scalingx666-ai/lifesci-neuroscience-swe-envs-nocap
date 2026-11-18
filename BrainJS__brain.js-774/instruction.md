# Issue

**Title:** chore(deps): bump node-fetch from 2.6.1 to 2.6.7

## Description

Bumps [node-fetch](https://github.com/node-fetch/node-fetch) from 2.6.1 to 2.6.7.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/node-fetch/node-fetch/releases">node-fetch's releases</a>.</em></p>
<blockquote>
<h2>v2.6.7</h2>
<h1>Security patch release</h1>
<p>Recommended to upgrade, to not leak sensitive cookie and authentication header information to 3th party host while a redirect occurred</p>
<h2>What's Changed</h2>
<ul>
<li>fix: don't forward secure headers to 3th party by <a href="https://github.com/jimmywarting"><code>@​jimmywarting</code></a> in <a href="https://github-redirect.dependabot.com/node-fetch/node-fetch/pull/1453">node-fetch/node-fetch#1453</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/node-fetch/node-fetch/compare/v2.6.6...v2.6.7">https://github.com/node-fetch/node-fetch/compare/v2.6.6...v2.6.7</a></p>
<h2>v2.6.6</h2>
<h2>What's Changed</h2>
<ul>
<li>fix(URL): prefer built in URL version when available and fallback to whatwg by <a href="https://github.com/jimmywarting"><code>@​jimmywarting</code></a> in <a href="https://github-redirect.dependabot.com/node-fetch/node-fetch/pull/1352">node-fetch/node-fetch#1352</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/node-fetch/node-fetch/compare/v2.6.5...v2.6.6">https://github.com/node-fetch/node-fetch/compare/v2.6.5...v2.6.6</a></p>
<h2>v2.6.2</h2>
<p>fixed main path in package.json</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1ef4b56</code></a> backport of <a href="https://github-redirect.dependabot.com/node-fetch/node-fetch/issues/1449">#1449</a> (<a href="https://github-redirect.dependabot.com/node-fetch/node-fetch/issues/1453">#1453</a>)</li>
<li><a href=""><code>8fe5c4e</code></a> 2.x: Specify encoding as an optional peer dependency in package.json (<a href="https://github-redirect.dependabot.com/node-fetch/node-fetch/issues/1310">#1310</a>)</li>
<li><a href=""><code>f56b0c6</code></a> fix(URL): prefer built in URL version when available and fallback to whatwg (...</li>
<li><a href=""><code>b5417ae</code></a> fix: import whatwg-url in a way compatible with ESM Node (<a href="https://github-redirect.dependabot.com/node-fetch/node-fetch/issues/1303">#1303</a>)</li>
<li><a href=""><code>18193c5</code></a> fix v2.6.3 that did not sending query params (<a href="https://github-redirect.dependabot.com/node-fetch/node-fetch/issues/1301">#1301</a>)</li>
<li><a href=""><code>ace7536</code></a> fix: properly encode url with unicode characters (<a href="https://github-redirect.dependabot.com/node-fetch/node-fetch/issues/1291">#1291</a>)</li>
<li><a href=""><code>152214c</code></a> Fix(package.json): Corrected main file path in package.json (<a href="https://github-redirect.dependabot.com/node-fetch/node-fetch/issues/1274">#1274</a>)</li>
<li>See full diff in <a href="https://github.com/node-fetch/node-fetch/compare/v2.6.1...v2.6.7">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~endless">endless</a>, a new releaser for node-fetch since your current version.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=node-fetch&package-manager=npm_and_yarn&previous-version=2.6.1&new-version=2.6.7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BrainJS/brain.js/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `684ff57c3526`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.