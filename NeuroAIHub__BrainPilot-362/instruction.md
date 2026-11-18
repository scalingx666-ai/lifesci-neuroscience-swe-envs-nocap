# Issue

**Title:** chore(deps): bump @hono/node-server from 1.19.14 to 2.0.10

## Description

Bumps [@hono/node-server](https://github.com/honojs/node-server) from 1.19.14 to 2.0.10.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/honojs/node-server/releases">@​hono/node-server's releases</a>.</em></p>
<blockquote>
<h2>v2.0.10</h2>
<h2>Security fixes</h2>
<p>This release includes a fix for the following security issue:</p>
<h3>Unauthenticated memory-leak DoS via aborted WebSocket handshake</h3>
<p>Affects: <code>upgradeWebSocket</code>. A WebSocket upgrade request with a missing or malformed <code>Sec-WebSocket-Key</code> header leaked the request's <code>IncomingMessage</code> and left a promise pending, even though no connection was established. Since the route is reachable pre-handshake without authentication, an attacker could flood it to gradually exhaust memory. <a href="https://github.com/honojs/node-server/security/advisories/GHSA-9mqv-5hh9-4cgg">GHSA-9mqv-5hh9-4cgg</a></p>
<hr />
<p>Users of <code>upgradeWebSocket</code> are encouraged to upgrade to this version.</p>
<h2>v2.0.9</h2>
<h2>What's Changed</h2>
<ul>
<li>fix(websocket): polyfill missing ErrorEvent global by <a href="https://github.com/otnc"><code>@​otnc</code></a> in <a href="">honojs/node-server#371</a></li>
<li>fix(serve-static): correct Range header parsing edge cases by <a href="https://github.com/otnc"><code>@​otnc</code></a> in <a href="">honojs/node-server#372</a></li>
<li>fix: recover complete request bodies after client disconnect by <a href="https://github.com/usualoma"><code>@​usualoma</code></a> in <a href="">honojs/node-server#375</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/otnc"><code>@​otnc</code></a> made their first contribution in <a href="">honojs/node-server#371</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/honojs/node-server/compare/v2.0.8...v2.0.9">https://github.com/honojs/node-server/compare/v2.0.8...v2.0.9</a></p>
<h2>v2.0.8</h2>
<h2>What's Changed</h2>
<ul>
<li>ci(release): add <code>--no-git-checks</code> option for <code>pnpm stage publish</code> by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/node-server#369</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/honojs/node-server/compare/v2.0.7...v2.0.8">https://github.com/honojs/node-server/compare/v2.0.7...v2.0.8</a></p>
<h2>v2.0.7</h2>
<h2>What's Changed</h2>
<ul>
<li>chore: migrate to pnpm by <a href="https://github.com/BlankParticle"><code>@​BlankParticle</code></a> in <a href="">honojs/node-server#367</a></li>
<li>fix(serve-static): serve precompressed files for application/octet-stream by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/node-server#366</a></li>
<li>chore: bump <code>supertest</code> by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/node-server#368</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/honojs/node-server/compare/v2.0.6...v2.0.7">https://github.com/honojs/node-server/compare/v2.0.6...v2.0.7</a></p>
<h2>v2.0.6</h2>
<h2>What's Changed</h2>
<ul>
<li>ci: publish to npm from CI with OIDC trusted publishing and bump <code>np</code> by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/node-server#361</a></li>
<li>ci: use npm Staged publishing by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/node-server#364</a></li>
<li>fix: preserve status and statusText when cloning a Response with liveheaders by <a href="https://github.com/usualoma"><code>@​usualoma</code></a> in <a href="">honojs/node-server#363</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/honojs/node-server/compare/v2.0.5...v2.0.6">https://github.com/honojs/node-server/compare/v2.0.5...v2.0.6</a></p>
<h2>v2.0.5</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7c1457e</code></a> 2.0.10</li>
<li><a href=""><code>3a21938</code></a> Merge commit from fork</li>
<li><a href=""><code>9842021</code></a> 2.0.9</li>
<li><a href=""><code>51f3bf5</code></a> fix: recover complete request bodies after client disconnect (<a href="">#375</a>)</li>
<li><a href=""><code>fdb87ba</code></a> fix(serve-static): correct Range header parsing edge cases (<a href="">#372</a>)</li>
<li><a href=""><code>912e3fd</code></a> fix(websocket): polyfill missing ErrorEvent global (<a href="">#371</a>)</li>
<li><a href=""><code>114c15e</code></a> 2.0.8</li>
<li><a href=""><code>5db2d5d</code></a> ci(release): add <code>--no-git-checks</code> option for <code>pnpm stage publish</code> (<a href="">#369</a>)</li>
<li><a href=""><code>a528a77</code></a> 2.0.7</li>
<li><a href=""><code>b2d610c</code></a> chore: bump <code>supertest</code> (<a href="">#368</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/honojs/node-server/compare/v1.19.14...v2.0.10">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for <code>@​hono/node-server</code> since your current version.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=@hono/node-server&package-manager=npm_and_yarn&previous-version=1.19.14&new-version=2.0.10)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/NeuroAIHub/BrainPilot/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8d5a2e6ab547`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.