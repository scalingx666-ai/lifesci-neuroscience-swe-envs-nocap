# Issue

**Title:** Bump urllib3 from 2.2.2 to 2.5.0

## Description

Bumps [urllib3](https://github.com/urllib3/urllib3) from 2.2.2 to 2.5.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/urllib3/urllib3/releases">urllib3's releases</a>.</em></p>
<blockquote>
<h2>2.5.0</h2>
<h2>🚀 urllib3 is fundraising for HTTP/2 support</h2>
<p><a href="https://sethmlarson.dev/urllib3-is-fundraising-for-http2-support">urllib3 is raising ~$40,000 USD</a> to release HTTP/2 support and ensure long-term sustainable maintenance of the project after a sharp decline in financial support. If your company or organization uses Python and would benefit from HTTP/2 support in Requests, pip, cloud SDKs, and thousands of other projects <a href="https://opencollective.com/urllib3">please consider contributing financially</a> to ensure HTTP/2 support is developed sustainably and maintained for the long-haul.</p>
<p>Thank you for your support.</p>
<h1>Security issues</h1>
<p>urllib3 2.5.0 fixes two moderate security issues:</p>
<ul>
<li>Pool managers now properly control redirects when <code>retries</code> is passed — CVE-2025-50181 reported by <a href="https://github.com/sandumjacob"><code>@​sandumjacob</code></a> (5.3 Medium, GHSA-pq67-6m6q-mj2v)</li>
<li>Redirects are now controlled by urllib3 in the Node.js runtime — CVE-2025-50182 (5.3 Medium, GHSA-48p4-8xcf-vxj5)</li>
</ul>
<h1>Features</h1>
<ul>
<li>Added support for the <code>compression.zstd</code> module that is new in Python 3.14. See <a href="https://peps.python.org/pep-0784/">PEP 784</a> for more information. (<a href="">#3610</a>)</li>
<li>Added support for version 0.5 of <code>hatch-vcs</code> (<a href="">#3612</a>)</li>
</ul>
<h1>Bugfixes</h1>
<ul>
<li>Raised exception for <code>HTTPResponse.shutdown</code> on a connection already released to the pool. (<a href="">#3581</a>)</li>
<li>Fixed incorrect <code>CONNECT</code> statement when using an IPv6 proxy with <code>connection_from_host</code>. Previously would not be wrapped in <code>[]</code>. (<a href="">#3615</a>)</li>
</ul>
<h2>2.4.0</h2>
<h2>🚀 urllib3 is fundraising for HTTP/2 support</h2>
<p><a href="https://sethmlarson.dev/urllib3-is-fundraising-for-http2-support">urllib3 is raising ~$40,000 USD</a> to release HTTP/2 support and ensure long-term sustainable maintenance of the project after a sharp decline in financial support. If your company or organization uses Python and would benefit from HTTP/2 support in Requests, pip, cloud SDKs, and thousands of other projects <a href="https://opencollective.com/urllib3">please consider contributing financially</a> to ensure HTTP/2 support is developed sustainably and maintained for the long-haul.</p>
<p>Thank you for your support.</p>
<h1>Features</h1>
<ul>
<li>Applied PEP 639 by specifying the license fields in pyproject.toml. (<a href="">#3522</a>)</li>
<li>Updated exceptions to save and restore more properties during the pickle/serialization process. (<a href="">#3567</a>)</li>
<li>Added <code>verify_flags</code> option to <code>create_urllib3_context</code> with a default of <code>VERIFY_X509_PARTIAL_CHAIN</code> and <code>VERIFY_X509_STRICT</code> for Python 3.13+. (<a href="">#3571</a>)</li>
</ul>
<h1>Bugfixes</h1>
<ul>
<li>Fixed a bug with partial reads of streaming data in Emscripten. (<a href="">#3555</a>)</li>
</ul>
<h1>Misc</h1>
<ul>
<li>Switched to uv for installing development dependecies. (<a href="">#3550</a>)</li>
<li>Removed the <code>multiple.intoto.jsonl</code> asset from GitHub releases. Attestation of release files since v2.3.0 can be found on PyPI. (<a href="">#3566</a>)</li>
</ul>
<h2>2.3.0</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/urllib3/urllib3/blob/main/CHANGES.rst">urllib3's changelog</a>.</em></p>
<blockquote>
<h1>2.5.0 (2025-06-18)</h1>
<h2>Features</h2>
<ul>
<li>Added support for the <code>compression.zstd</code> module that is new in Python 3.14.
See <code>PEP 784 &lt;https://peps.python.org/pep-0784/&gt;</code>_ for more information. (<code> &lt;</code>__)</li>
<li>Added support for version 0.5 of <code>hatch-vcs</code> (<code> &lt;</code>__)</li>
</ul>
<h2>Bugfixes</h2>
<ul>
<li>Fixed a security issue where restricting the maximum number of followed
redirects at the <code>urllib3.PoolManager</code> level via the <code>retries</code> parameter
did not work.</li>
<li>Made the Node.js runtime respect redirect parameters such as <code>retries</code>
and <code>redirects</code>.</li>
<li>Raised exception for <code>HTTPResponse.shutdown</code> on a connection already released to the pool. (<code> &lt;</code>__)</li>
<li>Fixed incorrect <code>CONNECT</code> statement when using an IPv6 proxy with <code>connection_from_host</code>. Previously would not be wrapped in <code>[]</code>. (<code> &lt;</code>__)</li>
</ul>
<h1>2.4.0 (2025-04-10)</h1>
<h2>Features</h2>
<ul>
<li>Applied PEP 639 by specifying the license fields in pyproject.toml. (<code> &lt;</code>__)</li>
<li>Updated exceptions to save and restore more properties during the pickle/serialization process. (<code> &lt;</code>__)</li>
<li>Added <code>verify_flags</code> option to <code>create_urllib3_context</code> with a default of <code>VERIFY_X509_PARTIAL_CHAIN</code> and <code>VERIFY_X509_STRICT</code> for Python 3.13+. (<code> &lt;</code>__)</li>
</ul>
<h2>Bugfixes</h2>
<ul>
<li>Fixed a bug with partial reads of streaming data in Emscripten. (<code> &lt;</code>__)</li>
</ul>
<h2>Misc</h2>
<ul>
<li>Switched to uv for installing development dependecies. (<code> &lt;</code>__)</li>
<li>Removed the <code>multiple.intoto.jsonl</code> asset from GitHub releases. Attestation of release files since v2.3.0 can be found on PyPI. (<code> &lt;</code>__)</li>
</ul>
<h1>2.3.0 (2024-12-22)</h1>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>aaab4ec</code></a> Release 2.5.0</li>
<li><a href=""><code>7eb4a2a</code></a> Merge commit from fork</li>
<li><a href=""><code>f05b132</code></a> Merge commit from fork</li>
<li><a href=""><code>d03fe32</code></a> Fix HTTP tunneling with IPv6 in older Python versions</li>
<li><a href=""><code>11661e9</code></a> Bump github/codeql-action from 3.28.0 to 3.29.0 (<a href="">#3624</a>)</li>
<li><a href=""><code>6a0ecc6</code></a> Update v2 migration guide to 2.4.0 (<a href="">#3621</a>)</li>
<li><a href=""><code>8e32e60</code></a> Raise exception for shutdown on a connection already released to the pool (<a href="">#3</a>...</li>
<li><a href=""><code>9996e0f</code></a> Fix emscripten CI for Chrome 137+ (<a href="">#3599</a>)</li>
<li><a href=""><code>4fd1a99</code></a> Bump RECENT_DATE (<a href="">#3617</a>)</li>
<li><a href=""><code>c4b5917</code></a> Add support for the new <code>compression.zstd</code> module in Python 3.14 (<a href="">#3611</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/urllib3/urllib3/compare/2.2.2...2.5.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=urllib3&package-manager=pip&previous-version=2.2.2&new-version=2.5.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/aplbrain/dotmotif/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8835bbc543f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.