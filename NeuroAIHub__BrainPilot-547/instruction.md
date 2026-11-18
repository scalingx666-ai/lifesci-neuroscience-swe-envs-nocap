# Issue

**Title:** chore(deps): bump fast-uri from 3.1.5 to 3.1.7

## Description

Bumps [fast-uri](https://github.com/fastify/fast-uri) from 3.1.5 to 3.1.7.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/fastify/fast-uri/releases">fast-uri's releases</a>.</em></p>
<blockquote>
<h2>v3.1.7</h2>
<h2>⚠️ Security Warning</h2>
<p>This is a security release that fixes the following high-severity security advisories:</p>
<ul>
<li><a href="https://github.com/fastify/fast-uri/security/advisories/GHSA-qw65-cvwx-89v3">GHSA-qw65-cvwx-89v3</a> — authority injection via an unvalidated port in <code>serialize()</code></li>
<li><a href="https://github.com/fastify/fast-uri/security/advisories/GHSA-58mr-gqgx-xq4g">GHSA-58mr-gqgx-xq4g</a> — host confusion via unbalanced or misplaced IP-literal brackets</li>
</ul>
<p>Users of the v3.x release line should upgrade to v3.1.7.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/fastify/fast-uri/compare/v3.1.6...v3.1.7">https://github.com/fastify/fast-uri/compare/v3.1.6...v3.1.7</a></p>
<h2>v3.1.6</h2>
<h2>⚠️ Security Warning</h2>
<p>This release addresses the following high-severity security advisories:</p>
<ul>
<li><a href="https://github.com/fastify/fast-uri/security/advisories/GHSA-5jgf-p345-68v8">GHSA-5jgf-p345-68v8</a> — host confusion via skipped IDN canonicalization on scheme-relative references</li>
<li><a href="https://github.com/fastify/fast-uri/security/advisories/GHSA-fph4-wmhf-6fwf">GHSA-fph4-wmhf-6fwf</a> — server-side request forgery via repeated hostname percent-decoding</li>
<li><a href="https://github.com/fastify/fast-uri/security/advisories/GHSA-f65p-4m7j-42xc">GHSA-f65p-4m7j-42xc</a> — server-side request forgery via malformed IPv6 normalization</li>
<li><a href="https://github.com/fastify/fast-uri/security/advisories/GHSA-jqff-g426-hqxp">GHSA-jqff-g426-hqxp</a> — host confusion via percent-encoded scheme normalization</li>
</ul>
<p>Users of the v3.x release line should upgrade to v3.1.6.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/fastify/fast-uri/compare/v3.1.5...v3.1.6">https://github.com/fastify/fast-uri/compare/v3.1.5...v3.1.6</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>412e40a</code></a> Bumped v3.1.7</li>
<li><a href=""><code>9f4c943</code></a> fix: backport port and IP-literal validation to v3.x (<a href="">#216</a>)</li>
<li><a href=""><code>1eb3ce4</code></a> fix: treat unterminated bracket hosts as reg-names again (<a href="">#214</a>)</li>
<li><a href=""><code>6f970b2</code></a> Bumped v3.1.6</li>
<li><a href=""><code>d941579</code></a> fix: never run IDN canonicalization on bracketed IP literals</li>
<li><a href=""><code>c0f0279</code></a> test: adapt decoded-scheme handler assertion to 3.x (no mailto scheme)</li>
<li><a href=""><code>37f3417</code></a> Merge commit from fork</li>
<li><a href=""><code>607bfbe</code></a> Merge commit from fork</li>
<li><a href=""><code>ae92a4c</code></a> Merge commit from fork</li>
<li><a href=""><code>444ecda</code></a> Merge commit from fork</li>
<li>Additional commits viewable in <a href="https://github.com/fastify/fast-uri/compare/v3.1.5...v3.1.7">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c0dd63cb11cb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.