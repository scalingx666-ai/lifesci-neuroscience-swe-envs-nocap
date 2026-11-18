# Issue

**Title:** chore(deps): bump tokio-tungstenite from 0.21.0 to 0.28.0 in /src-tauri

## Description

Bumps [tokio-tungstenite](https://github.com/snapview/tokio-tungstenite) from 0.21.0 to 0.28.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/snapview/tokio-tungstenite/blob/master/CHANGELOG.md">tokio-tungstenite's changelog</a>.</em></p>
<blockquote>
<h1>0.28.0</h1>
<ul>
<li>Update <code>tungstenite</code> to <code>0.18.0</code>. See <a href="https://github.com/snapview/tungstenite-rs/blob/master/CHANGELOG.md"><code>tungstenite</code> release</a>.</li>
</ul>
<h1>0.27.0</h1>
<ul>
<li>See <a href="https://github.com/snapview/tungstenite-rs/blob/master/CHANGELOG.md#0270">performance updates in <code>tungstenite-rs</code></a>.</li>
</ul>
<h1>0.26.2</h1>
<ul>
<li>Update <code>tungstenite</code>, see <a href="https://github.com/snapview/tungstenite-rs/blob/master/CHANGELOG.md#0262">changes here</a>.</li>
</ul>
<h1>0.26.1</h1>
<ul>
<li>Update <code>tungstenite</code> to address an issue that might cause UB in certain cases.</li>
</ul>
<h1>0.26.0</h1>
<ul>
<li>Update <code>tungstenite</code> to <code>0.26.0</code> (<a href="https://github.com/snapview/tungstenite-rs/blob/master/CHANGELOG.md#0260">breaking changes</a>).</li>
</ul>
<h1>0.25.0</h1>
<ul>
<li>Update <code>tungstenite</code> to <code>0.25.0</code> (<a href="https://github.com/snapview/tungstenite-rs/blob/master/CHANGELOG.md#0250">important updates!</a>).</li>
</ul>
<h1>0.24.0</h1>
<ul>
<li>Update dependencies (TLS, tungstenite).</li>
<li>Return a runtime error when WSS URLs are used without a proper TLS feature enabled.</li>
</ul>
<h1>0.23.1</h1>
<ul>
<li>Introduce a <code>url</code> feature (proxies to <code>tungstenite/url</code>).</li>
</ul>
<h1>0.23.0</h1>
<ul>
<li>Update <code>tungstenite</code> to <code>0.23.0</code>.</li>
<li>Disable default features on TLS crates.</li>
</ul>
<h1>0.22.0</h1>
<ul>
<li>Update TLS dependencies.</li>
<li><del>Update <code>tungstenite</code> to match <code>0.22.0</code>.</del></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>35d110c</code></a> Implement into_inner to get the underlying stream (<a href="">#367</a>)</li>
<li><a href=""><code>f3ae75d</code></a> Update <code>tungstenite</code> version and fix bugs</li>
<li><a href=""><code>25b544e</code></a> Allow getting a reference to the shared inner stream (<a href="">#363</a>)</li>
<li><a href=""><code>e855f9e</code></a> Fix errors in the examples caused by <code>Utf8Error</code></li>
<li><a href=""><code>21c5d19</code></a> Bump version</li>
<li><a href=""><code>fbd1471</code></a> Update performance notes in README</li>
<li><a href=""><code>a8d9f19</code></a> Bump version</li>
<li><a href=""><code>aafb2f9</code></a> Bump version</li>
<li><a href=""><code>0eefa27</code></a> Bump version</li>
<li><a href=""><code>2d23077</code></a> Update to new <code>tungstenite</code> and bump version</li>
<li>Additional commits viewable in <a href="https://github.com/snapview/tokio-tungstenite/compare/v0.21.0...v0.28.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=tokio-tungstenite&package-manager=cargo&previous-version=0.21.0&new-version=0.28.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `71c155645e6b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.