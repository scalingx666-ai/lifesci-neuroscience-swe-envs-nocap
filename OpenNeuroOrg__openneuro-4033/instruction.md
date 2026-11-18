# Issue

**Title:** chore(deps): Bump ws from 8.16.0 to 8.21.1

## Description

Bumps [ws](https://github.com/websockets/ws) from 8.16.0 to 8.21.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/websockets/ws/releases">ws's releases</a>.</em></p>
<blockquote>
<h2>8.21.1</h2>
<h1>Bug fixes</h1>
<ul>
<li>Empty fragments are now counted toward the limit (a2f4e7c0).</li>
<li>The default values of the <code>maxBufferedChunks</code> and <code>maxFragments</code> options have
been reduced (f197ac65).</li>
</ul>
<h2>8.21.0</h2>
<h1>Features</h1>
<ul>
<li>Introduced the <code>maxBufferedChunks</code> and <code>maxFragments</code> options (2b2abd45).</li>
</ul>
<h1>Bug fixes</h1>
<ul>
<li>Fixed a remote memory exhaustion DoS vulnerability (2b2abd45).</li>
</ul>
<p>A high volume of tiny fragments and data chunks could be sent by a peer, using
modest network traffic, to crash a <code>ws</code> server or client due to OOM.</p>
<pre lang="js"><code>import { WebSocket, WebSocketServer } from 'ws';
<p>const wss = new WebSocketServer({ port: 0 }, function () {
const data = Buffer.alloc(1);
const options = { fin: false };
const { port } = wss.address();
const ws = new WebSocket(<code>ws://localhost:${port}</code>);</p>
<p>ws.on('open', function () {
(function send() {
ws.send(data, options, function (err) {
if (err) return;
send();
});
})();
});</p>
<p>ws.on('error', console.error);
ws.on('close', function (code, reason) {
console.log(<code>client close - code: ${code} reason: ${reason.toString()}</code>);
});
});</p>
<p>wss.on('connection', function (ws) {
ws.on('error', console.error);
ws.on('close', function (code, reason) {
console.log(<code>server close - code: ${code} reason: ${reason.toString()}</code>);
});
});
</code></pre></p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ae1de54</code></a> [dist] 8.21.1</li>
<li><a href=""><code>8e9511b</code></a> [ci] Trust Coveralls Homebrew tap</li>
<li><a href=""><code>f197ac6</code></a> [fix] Lower default values of <code>maxBufferedChunks</code> and <code>maxFragments</code></li>
<li><a href=""><code>8df8265</code></a> [ci] Update actions/checkout action to v7</li>
<li><a href=""><code>a2f4e7c</code></a> [fix] Count empty fragments toward the limit (<a href="">#2329</a>)</li>
<li><a href=""><code>e79f912</code></a> [pkg] Approve install scripts for bufferutil and utf-8-validate</li>
<li><a href=""><code>4ea355d</code></a> [doc] Document 32-bit signed integer coercion for option values</li>
<li><a href=""><code>2120f4c</code></a> [example] Remove uuid dependency</li>
<li><a href=""><code>4c534a6</code></a> [security] Add latest vulnerability to SECURITY.md</li>
<li><a href=""><code>bca91ad</code></a> [dist] 8.21.0</li>
<li>Additional commits viewable in <a href="https://github.com/websockets/ws/compare/8.16.0...8.21.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=ws&package-manager=npm_and_yarn&previous-version=8.16.0&new-version=8.21.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `17d1ddcd68e5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.