# Issue

**Title:** Bump serialize-javascript from 7.0.5 to 7.1.4

## Description

Bumps [serialize-javascript](https://github.com/yahoo/serialize-javascript) from 7.0.5 to 7.1.4.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/yahoo/serialize-javascript/releases">serialize-javascript's releases</a>.</em></p>
<blockquote>
<h2>v7.1.4</h2>
<h2>What's Changed</h2>
<ul>
<li>Fix methods containing nested functions and arrows by <a href="https://github.com/Shubham-Padkonde"><code>@​Shubham-Padkonde</code></a> in <a href="">yahoo/serialize-javascript#231</a></li>
<li>docs: add SECURITY.md by <a href="https://github.com/redonkulus"><code>@​redonkulus</code></a> in <a href="">yahoo/serialize-javascript#237</a></li>
<li>release: v7.1.4 by <a href="https://github.com/redonkulus"><code>@​redonkulus</code></a> in <a href="">yahoo/serialize-javascript#238</a></li>
</ul>
<h3>Note on method serialization</h3>
<p>Concise methods (<code>{ m() {} }</code>), including async, generator and computed-key methods, are now serialized correctly when their bodies contain a nested arrow function or function declaration. Previously these were emitted unchanged, producing invalid output that failed to deserialize (<a href="">#118</a>). Class expressions continue to be emitted as-is.</p>
<h3>Reporting security issues</h3>
<p>This repo now has a <a href="https://github.com/yahoo/serialize-javascript/blob/main/SECURITY.md">security policy</a>. Please report vulnerabilities privately through <a href="https://github.com/yahoo/serialize-javascript/security/advisories/new">GitHub's private vulnerability reporting</a> rather than public issues.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/yahoo/serialize-javascript/compare/v7.1.3...v7.1.4">https://github.com/yahoo/serialize-javascript/compare/v7.1.3...v7.1.4</a></p>
<h2>v7.1.3</h2>
<p>See: <a href="https://github.com/yahoo/serialize-javascript/security/advisories/GHSA-m5mm-p8h7-m29v">https://github.com/yahoo/serialize-javascript/security/advisories/GHSA-m5mm-p8h7-m29v</a></p>
<h2>What's Changed</h2>
<ul>
<li>fix: escape <code>&lt;/script</code> at the end of a serialized function body by <a href="https://github.com/redonkulus"><code>@​redonkulus</code></a> in <a href="">yahoo/serialize-javascript#235</a></li>
<li>Fix serialization of Dates with expanded ISO years by <a href="https://github.com/Shubham-Padkonde"><code>@​Shubham-Padkonde</code></a> in <a href="">yahoo/serialize-javascript#232</a></li>
<li>fix: ignore functions without mutating input objects by <a href="https://github.com/Shubham-Padkonde"><code>@​Shubham-Padkonde</code></a> in <a href="">yahoo/serialize-javascript#233</a></li>
<li>release: v7.1.3 by <a href="https://github.com/redonkulus"><code>@​redonkulus</code></a> in <a href="">yahoo/serialize-javascript#236</a></li>
</ul>
<h3>Note on <code>ignoreFunction</code></h3>
<p>With <code>ignoreFunction: true</code>, function values are now omitted the same way <code>JSON.stringify</code> omits them, without deleting them from the input object. Functions inside arrays are emitted as <code>null</code> (previously this produced <code>Array.prototype.slice.call(...)</code> output).</p>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/Shubham-Padkonde"><code>@​Shubham-Padkonde</code></a> made their first contribution in <a href="">yahoo/serialize-javascript#232</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/yahoo/serialize-javascript/compare/v7.1.2...v7.1.3">https://github.com/yahoo/serialize-javascript/compare/v7.1.2...v7.1.3</a></p>
<h2>v7.1.2</h2>
<p>See: <a href="https://github.com/yahoo/serialize-javascript/security/advisories/GHSA-gfhx-hw2g-v5hg">https://github.com/yahoo/serialize-javascript/security/advisories/GHSA-gfhx-hw2g-v5hg</a></p>
<h2>v7.1.1</h2>
<h2>What's Changed</h2>
<ul>
<li>fix: fix XSS bypass via split <code>&lt;/script</code> payload across function bodies by <a href="https://github.com/okuryu"><code>@​okuryu</code></a> in <a href="">yahoo/serialize-javascript#226</a></li>
<li>release: v7.1.1 by <a href="https://github.com/okuryu"><code>@​okuryu</code></a> in <a href="">yahoo/serialize-javascript#227</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/yahoo/serialize-javascript/compare/v7.1.0...v7.1.1">https://github.com/yahoo/serialize-javascript/compare/v7.1.0...v7.1.1</a></p>
<h2>v7.1.0</h2>
<h2>What's Changed</h2>
<ul>
<li>feat: add Node.js 26 to test matrix by <a href="https://github.com/okuryu"><code>@​okuryu</code></a> in <a href="">yahoo/serialize-javascript#224</a></li>
<li>release: v7.1.0 by <a href="https://github.com/okuryu"><code>@​okuryu</code></a> in <a href="">yahoo/serialize-javascript#225</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>05c5ceb</code></a> release: v7.1.4 (<a href="">#238</a>)</li>
<li><a href=""><code>fdb853d</code></a> Fix methods containing nested functions and arrows (<a href="">#231</a>)</li>
<li><a href=""><code>f7dfeae</code></a> docs: add SECURITY.md pointing to private vulnerability reporting (<a href="">#237</a>)</li>
<li><a href=""><code>4d36b82</code></a> release: v7.1.3 (<a href="">#236</a>)</li>
<li><a href=""><code>45e5397</code></a> fix: ignore functions without mutating input objects (<a href="">#233</a>)</li>
<li><a href=""><code>e978a1b</code></a> fix: serialize Dates with expanded ISO years (<a href="">#232</a>)</li>
<li><a href=""><code>2864b3c</code></a> fix: escape <code>&lt;/script</code> at the end of a serialized function body (<a href="">#235</a>)</li>
<li><a href=""><code>6a73fa1</code></a> release: v7.1.2</li>
<li><a href=""><code>2bdbaaf</code></a> Merge commit from fork</li>
<li><a href=""><code>8c8caa7</code></a> release: v7.1.1</li>
<li>Additional commits viewable in <a href="https://github.com/yahoo/serialize-javascript/compare/v7.0.5...v7.1.4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=serialize-javascript&package-manager=npm_and_yarn&previous-version=7.0.5&new-version=7.1.4)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/aces/Loris/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2b0257eaf66f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.