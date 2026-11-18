# Issue

**Title:** Bump socket.io from 2.3.0 to 2.4.0

## Description

Bumps [socket.io](https://github.com/socketio/socket.io) from 2.3.0 to 2.4.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/socketio/socket.io/releases">socket.io's releases</a>.</em></p>
<blockquote>
<h2>2.4.0</h2>
<p>Related blog post: <a href="https://socket.io/blog/socket-io-2-4-0/">https://socket.io/blog/socket-io-2-4-0/</a></p>
<h3>Features (from Engine.IO)</h3>
<ul>
<li>add support for all cookie options (<a href="">19cc582</a>)</li>
<li>disable perMessageDeflate by default (<a href="">5ad2736</a>)</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li><strong>security:</strong> do not allow all origins by default (<a href="">f78a575</a>)</li>
<li>properly overwrite the query sent in the handshake (<a href="">d33a619</a>)</li>
</ul>
<p>:warning: <strong>BREAKING CHANGE</strong> :warning:</p>
<p>Previously, CORS was enabled by default, which meant that a Socket.IO server sent the necessary CORS headers (<code>Access-Control-Allow-xxx</code>) to <strong>any</strong> domain. This will not be the case anymore, and you now have to explicitly enable it.</p>
<p>Please note that you are not impacted if:</p>
<ul>
<li>you are using Socket.IO v2 and the <code>origins</code> option to restrict the list of allowed domains</li>
<li>you are using Socket.IO v3 (disabled by default)</li>
</ul>
<p>This commit also removes the support for '*' matchers and protocol-less URL:</p>
<pre><code>io.origins('https://example.com:443'); =&gt; io.origins(['https://example.com']);
io.origins('localhost:3000');          =&gt; io.origins(['http://localhost:3000']);
io.origins('http://localhost:*');      =&gt; io.origins(['http://localhost:3000']);
io.origins('*:3000');                  =&gt; io.origins(['http://localhost:3000']);
</code></pre>
<p>To restore the previous behavior (please use with caution):</p>
<pre lang="js"><code>io.origins((_, callback) =&gt; {
  callback(null, true);
});
</code></pre>
<p>See also:</p>
<ul>
<li><a href="https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS">https://developer.mozilla.org/en-US/docs/Web/HTTP/CORS</a></li>
<li><a href="https://socket.io/docs/v3/handling-cors/">https://socket.io/docs/v3/handling-cors/</a></li>
<li><a href="https://socket.io/docs/v3/migrating-from-2-x-to-3-0/#CORS-handling">https://socket.io/docs/v3/migrating-from-2-x-to-3-0/#CORS-handling</a></li>
</ul>
<p>Thanks a lot to <a href="https://github.com/ni8walk3r"><code>@ni8walk3r</code></a> for the security report.</p>
<h4>Links:</h4>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/socketio/socket.io/blob/2.4.0/CHANGELOG.md">socket.io's changelog</a>.</em></p>
<blockquote>
<h1><a href="https://github.com/socketio/socket.io/compare/2.3.0...2.4.0">2.4.0</a> (2021-01-04)</h1>
<h3>Bug Fixes</h3>
<ul>
<li><strong>security:</strong> do not allow all origins by default (<a href="">f78a575</a>)</li>
<li>properly overwrite the query sent in the handshake (<a href="">d33a619</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>873fdc5</code></a> chore(release): 2.4.0</li>
<li><a href=""><code>f78a575</code></a> fix(security): do not allow all origins by default</li>
<li><a href=""><code>d33a619</code></a> fix: properly overwrite the query sent in the handshake</li>
<li><a href=""><code>3951a79</code></a> chore: bump engine.io version</li>
<li><a href=""><code>6fa026f</code></a> ci: migrate to GitHub Actions</li>
<li>See full diff in <a href="https://github.com/socketio/socket.io/compare/2.3.0...2.4.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=socket.io&package-manager=npm_and_yarn&previous-version=2.3.0&new-version=2.4.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/patrickjquinn/P-Brain.ai/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b207caabe84d`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.