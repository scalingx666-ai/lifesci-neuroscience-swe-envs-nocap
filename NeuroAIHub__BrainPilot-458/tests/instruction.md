# Issue

**Title:** chore(deps): bump @hono/node-server and @modelcontextprotocol/sdk

## Description

Bumps [@hono/node-server](https://github.com/honojs/node-server) to 2.1.0 and updates ancestor dependency [@modelcontextprotocol/sdk](https://github.com/modelcontextprotocol/typescript-sdk). These dependencies need to be updated together.

Updates `@hono/node-server` from 1.19.14 to 2.1.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/honojs/node-server/releases">@​hono/node-server's releases</a>.</em></p>
<blockquote>
<h2>v2.1.0</h2>
<h2>What's Changed</h2>
<ul>
<li>feat: add Early Hints (HTTP 103) middleware by <a href="https://github.com/bilal-azam"><code>@​bilal-azam</code></a> in <a href="">honojs/node-server#378</a></li>
<li>fix(listener): avoid uncaught error when force-closing a non-standard socket by <a href="https://github.com/mohamedramadan14"><code>@​mohamedramadan14</code></a> in <a href="">honojs/node-server#383</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/bilal-azam"><code>@​bilal-azam</code></a> made their first contribution in <a href="">honojs/node-server#378</a></li>
<li><a href="https://github.com/mohamedramadan14"><code>@​mohamedramadan14</code></a> made their first contribution in <a href="">honojs/node-server#383</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/honojs/node-server/compare/v2.0.12...v2.1.0">https://github.com/honojs/node-server/compare/v2.0.12...v2.1.0</a></p>
<h2>v2.0.12</h2>
<h2>What's Changed</h2>
<ul>
<li>test: replace supertest by <a href="https://github.com/BlankParticle"><code>@​BlankParticle</code></a> in <a href="">honojs/node-server#379</a></li>
<li>fix(response): copy headers when init is a foreign Response by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/node-server#382</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/honojs/node-server/compare/v2.0.11...v2.0.12">https://github.com/honojs/node-server/compare/v2.0.11...v2.0.12</a></p>
<h2>v2.0.11</h2>
<h2>What's Changed</h2>
<ul>
<li>test: use a custom helper for path traversal tests by <a href="https://github.com/BlankParticle"><code>@​BlankParticle</code></a> in <a href="">honojs/node-server#377</a></li>
<li>perf(request): fast-path QUERY methods by <a href="https://github.com/usualoma"><code>@​usualoma</code></a> in <a href="">honojs/node-server#376</a></li>
<li>perf(request): fast-path PATCH method by <a href="https://github.com/yusukebe"><code>@​yusukebe</code></a> in <a href="">honojs/node-server#380</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/honojs/node-server/compare/v2.0.10...v2.0.11">https://github.com/honojs/node-server/compare/v2.0.10...v2.0.11</a></p>
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
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>82ba34e</code></a> 2.1.0</li>
<li><a href=""><code>1f2909a</code></a> fix(listener): avoid uncaught error when force-closing a non-standard socket ...</li>
<li><a href=""><code>977a242</code></a> feat: add Early Hints (HTTP 103) middleware (<a href="">#378</a>)</li>
<li><a href=""><code>a813b6c</code></a> 2.0.12</li>
<li><a href=""><code>caf48ba</code></a> fix(response): copy headers when init is a foreign Response (<a href="">#382</a>)</li>
<li><a href=""><code>3b1dd68</code></a> test: replace supertest (<a href="">#379</a>)</li>
<li><a href=""><code>834e54f</code></a> 2.0.11</li>
<li><a href=""><code>ba72bcd</code></a> perf(request): fast-path PATCH method (<a href="">#380</a>)</li>
<li><a href=""><code>962baa4</code></a> perf(request): fast-path QUERY methods (<a href="">#376</a>)</li>
<li><a href=""><code>62284d6</code></a> test: use a custom helper for path traversal tests (<a href="">#377</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/honojs/node-server/compare/v1.19.14...v2.1.0">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for <code>@​hono/node-server</code> since your current version.</p>
</details>
<br />

Updates `@modelcontextprotocol/sdk` from 1.29.0 to 1.30.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/modelcontextprotocol/typescript-sdk/releases">@​modelcontextprotocol/sdk's releases</a>.</em></p>
<blockquote>
<h2>1.30.0</h2>
<h2>What's Changed</h2>
<ul>
<li>fix(server): prioritize zod issues and format them by <a href="https://github.com/mozmo15"><code>@​mozmo15</code></a> in <a href="">modelcontextprotocol/typescript-sdk#1503</a></li>
<li>chore(ci): switch publish to OIDC trusted publishing by <a href="https://github.com/felixweinberger"><code>@​felixweinberger</code></a> in <a href="">modelcontextprotocol/typescript-sdk#1839</a></li>
<li>Add end-to-end test suite by <a href="https://github.com/felixweinberger"><code>@​felixweinberger</code></a> in <a href="">modelcontextprotocol/typescript-sdk#2167</a></li>
<li>v1 stdio buffer limit by <a href="https://github.com/KKonstantinov"><code>@​KKonstantinov</code></a> in <a href="">modelcontextprotocol/typescript-sdk#2239</a></li>
<li>fix: support Zod 3.25 method literals by <a href="https://github.com/mattzcarey"><code>@​mattzcarey</code></a> in <a href="">modelcontextprotocol/typescript-sdk#2368</a></li>
<li>Validate Content-Type by parsed media type instead of substring match (v1.x) by <a href="https://github.com/felixweinberger"><code>@​felixweinberger</code></a> in <a href="">modelcontextprotocol/typescript-sdk#2444</a></li>
<li>fix: send SSE keep-alive comment frames from Streamable HTTP server transport (v1.x) by <a href="https://github.com/mattzcarey"><code>@​mattzcarey</code></a> in <a href="">modelcontextprotocol/typescript-sdk#2538</a></li>
<li>fix(deps): widen <code>@​hono/node-server</code> past GHSA-frvp-7c67-39w9 by <a href="https://github.com/arimu1"><code>@​arimu1</code></a> in <a href="">modelcontextprotocol/typescript-sdk#2549</a></li>
<li>Fix SSE keep-alive timer lifecycle in Streamable HTTP server transport (v1.x) by <a href="https://github.com/felixweinberger"><code>@​felixweinberger</code></a> in <a href="">modelcontextprotocol/typescript-sdk#2547</a></li>
<li>chore: bump version to 1.30.0 by <a href="https://github.com/felixweinberger"><code>@​felixweinberger</code></a> in <a href="">modelcontextprotocol/typescript-sdk#2563</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/mozmo15"><code>@​mozmo15</code></a> made their first contribution in <a href="">modelcontextprotocol/typescript-sdk#1503</a></li>
<li><a href="https://github.com/arimu1"><code>@​arimu1</code></a> made their first contribution in <a href="">modelcontextprotocol/typescript-sdk#2549</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/modelcontextprotocol/typescript-sdk/compare/v1.29.0...1.30.0">https://github.com/modelcontextprotocol/typescript-sdk/compare/v1.29.0...1.30.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2d889f2</code></a> chore: bump version to 1.30.0 (<a href="">#2563</a>)</li>
<li><a href=""><code>e3f3daa</code></a> Fix SSE keep-alive timer lifecycle in Streamable HTTP server transport (v1.x)...</li>
<li><a href=""><code>bb5a718</code></a> fix(deps): widen <code>@​hono/node-server</code> past GHSA-frvp-7c67-39w9 (<a href="">#2549</a>)</li>
<li><a href=""><code>1dad263</code></a> fix: send SSE keep-alive comment frames from Streamable HTTP server transport...</li>
<li><a href=""><code>69749aa</code></a> Validate Content-Type by parsed media type instead of substring match (v1.x) ...</li>
<li><a href=""><code>369513d</code></a> fix: support Zod 3.25 method literals (<a href="">#2368</a>)</li>
<li><a href=""><code>e7ee57c</code></a> v1 stdio buffer limit (<a href="">#2239</a>)</li>
<li><a href=""><code>c36e1ef</code></a> Add end-to-end test suite (<a href="">#2167</a>)</li>
<li><a href=""><code>bf1e022</code></a> chore(ci): switch publish to OIDC trusted publishing (<a href="">#1839</a>)</li>
<li><a href=""><code>9edbab7</code></a> fix(server): prioritize zod issues and format them (<a href="">#1503</a>)</li>
<li>See full diff in <a href="https://github.com/modelcontextprotocol/typescript-sdk/compare/v1.29.0...1.30.0">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~GitHub%20Actions">GitHub Actions</a>, a new releaser for <code>@​modelcontextprotocol/sdk</code> since your current version.</p>
</details>
<br />

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `142cf27c5aef`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.