# Issue

**Title:** Bump urllib3 from 2.5.0 to 2.6.0

## Description

Bumps [urllib3](https://github.com/urllib3/urllib3) from 2.5.0 to 2.6.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/urllib3/urllib3/releases">urllib3's releases</a>.</em></p>
<blockquote>
<h2>2.6.0</h2>
<h2>🚀 urllib3 is fundraising for HTTP/2 support</h2>
<p><a href="https://sethmlarson.dev/urllib3-is-fundraising-for-http2-support">urllib3 is raising ~$40,000 USD</a> to release HTTP/2 support and ensure long-term sustainable maintenance of the project after a sharp decline in financial support. If your company or organization uses Python and would benefit from HTTP/2 support in Requests, pip, cloud SDKs, and thousands of other projects <a href="https://opencollective.com/urllib3">please consider contributing financially</a> to ensure HTTP/2 support is developed sustainably and maintained for the long-haul.</p>
<p>Thank you for your support.</p>
<h2>Security</h2>
<ul>
<li>Fixed a security issue where streaming API could improperly handle highly compressed HTTP content (&quot;decompression bombs&quot;) leading to excessive resource consumption even when a small amount of data was requested. Reading small chunks of compressed data is safer and much more efficient now. (CVE-2025-66471 reported by <a href="https://github.com/Cycloctane"><code>@​Cycloctane</code></a>, 8.9 High, GHSA-2xpw-w6gg-jr37)</li>
<li>Fixed a security issue where an attacker could compose an HTTP response with virtually unlimited links in the <code>Content-Encoding</code> header, potentially leading to a denial of service (DoS) attack by exhausting system resources during decoding. The number of allowed chained encodings is now limited to 5. (CVE-2025-66418 reported by <a href="https://github.com/illia-v"><code>@​illia-v</code></a>, 8.9 High, GHSA-gm62-xv2j-4w53)</li>
</ul>
<blockquote>
<p>[!IMPORTANT]</p>
<ul>
<li>If urllib3 is not installed with the optional <code>urllib3[brotli]</code> extra, but your environment contains a Brotli/brotlicffi/brotlipy package anyway, make sure to upgrade it to at least Brotli 1.2.0 or brotlicffi 1.2.0.0 to  benefit from the security fixes and avoid warnings. Prefer using  <code>urllib3[brotli]</code> to install a compatible Brotli package automatically.</li>
<li>If you use custom decompressors, please make sure to update them to  respect the changed API of <code>urllib3.response.ContentDecoder</code>.</li>
</ul>
</blockquote>
<h2>Features</h2>
<ul>
<li>Enabled retrieval, deletion, and membership testing in <code>HTTPHeaderDict</code> using bytes keys. (<a href="">#3653</a>)</li>
<li>Added host and port information to string representations of <code>HTTPConnection</code>. (<a href="">#3666</a>)</li>
<li>Added support for Python 3.14 free-threading builds explicitly. (<a href="">#3696</a>)</li>
</ul>
<h2>Removals</h2>
<ul>
<li>Removed the <code>HTTPResponse.getheaders()</code> method in favor of <code>HTTPResponse.headers</code>. Removed the <code>HTTPResponse.getheader(name, default)</code> method in favor of <code>HTTPResponse.headers.get(name, default)</code>. (<a href="">#3622</a>)</li>
</ul>
<h2>Bugfixes</h2>
<ul>
<li>Fixed redirect handling in <code>urllib3.PoolManager</code> when an integer is passed for the retries parameter. (<a href="">#3649</a>)</li>
<li>Fixed <code>HTTPConnectionPool</code> when used in Emscripten with no explicit port. (<a href="">#3664</a>)</li>
<li>Fixed handling of <code>SSLKEYLOGFILE</code> with expandable variables. (<a href="">#3700</a>)</li>
</ul>
<h2>Misc</h2>
<ul>
<li>Changed the <code>zstd</code> extra to install <code>backports.zstd</code> instead of <code>zstandard</code> on Python 3.13 and before. (<a href="">#3693</a>)</li>
<li>Improved the performance of content decoding by optimizing <code>BytesQueueBuffer</code> class. (<a href="">#3710</a>)</li>
<li>Allowed building the urllib3 package with newer setuptools-scm v9.x. (<a href="">#3652</a>)</li>
<li>Ensured successful urllib3 builds by setting Hatchling requirement to ≥ 1.27.0. (<a href="">#3638</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/urllib3/urllib3/blob/main/CHANGES.rst">urllib3's changelog</a>.</em></p>
<blockquote>
<h1>2.6.0 (2025-12-05)</h1>
<h2>Security</h2>
<ul>
<li>Fixed a security issue where streaming API could improperly handle highly
compressed HTTP content (&quot;decompression bombs&quot;) leading to excessive resource
consumption even when a small amount of data was requested. Reading small
chunks of compressed data is safer and much more efficient now.
(<code>GHSA-2xpw-w6gg-jr37 &lt;https://github.com/urllib3/urllib3/security/advisories/GHSA-2xpw-w6gg-jr37&gt;</code>__)</li>
<li>Fixed a security issue where an attacker could compose an HTTP response with
virtually unlimited links in the <code>Content-Encoding</code> header, potentially
leading to a denial of service (DoS) attack by exhausting system resources
during decoding. The number of allowed chained encodings is now limited to 5.
(<code>GHSA-gm62-xv2j-4w53 &lt;https://github.com/urllib3/urllib3/security/advisories/GHSA-gm62-xv2j-4w53&gt;</code>__)</li>
</ul>
<p>.. caution::</p>
<ul>
<li>
<p>If urllib3 is not installed with the optional <code>urllib3[brotli]</code> extra, but
your environment contains a Brotli/brotlicffi/brotlipy package anyway, make
sure to upgrade it to at least Brotli 1.2.0 or brotlicffi 1.2.0.0 to
benefit from the security fixes and avoid warnings. Prefer using
<code>urllib3[brotli]</code> to install a compatible Brotli package automatically.</p>
</li>
<li>
<p>If you use custom decompressors, please make sure to update them to
respect the changed API of <code>urllib3.response.ContentDecoder</code>.</p>
</li>
</ul>
<h2>Features</h2>
<ul>
<li>Enabled retrieval, deletion, and membership testing in <code>HTTPHeaderDict</code> using bytes keys. (<code> &lt;</code>__)</li>
<li>Added host and port information to string representations of <code>HTTPConnection</code>. (<code> &lt;</code>__)</li>
<li>Added support for Python 3.14 free-threading builds explicitly. (<code> &lt;</code>__)</li>
</ul>
<h2>Removals</h2>
<ul>
<li>Removed the <code>HTTPResponse.getheaders()</code> method in favor of <code>HTTPResponse.headers</code>.
Removed the <code>HTTPResponse.getheader(name, default)</code> method in favor of <code>HTTPResponse.headers.get(name, default)</code>. (<code> &lt;</code>__)</li>
</ul>
<h2>Bugfixes</h2>
<ul>
<li>Fixed redirect handling in <code>urllib3.PoolManager</code> when an integer is passed
for the retries parameter. (<code> &lt;</code>__)</li>
<li>Fixed <code>HTTPConnectionPool</code> when used in Emscripten with no explicit port. (<code> &lt;</code>__)</li>
<li>Fixed handling of <code>SSLKEYLOGFILE</code> with expandable variables. (<code> &lt;</code>__)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>720f484</code></a> Release 2.6.0</li>
<li><a href=""><code>24d7b67</code></a> Merge commit from fork</li>
<li><a href=""><code>c19571d</code></a> Merge commit from fork</li>
<li><a href=""><code>816fcf0</code></a> Bump actions/setup-python from 6.0.0 to 6.1.0 (<a href="">#3725</a>)</li>
<li><a href=""><code>18af0a1</code></a> Improve speed of <code>BytesQueueBuffer.get()</code> by using memoryview (<a href="">#3711</a>)</li>
<li><a href=""><code>1f6abac</code></a> Bump versions of pre-commit hooks (<a href="">#3716</a>)</li>
<li><a href=""><code>1c8fbf7</code></a> Bump actions/checkout from 5.0.0 to 6.0.0 (<a href="">#3722</a>)</li>
<li><a href=""><code>7784b9e</code></a> Add Python 3.15 to CI (<a href="">#3717</a>)</li>
<li><a href=""><code>0241c9e</code></a> Updated docs to reflect change in optional zstd dependency from <code>zstandard</code> t...</li>
<li><a href=""><code>7afcabb</code></a> Expand environment variable of SSLKEYLOGFILE (<a href="">#3705</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/urllib3/urllib3/compare/2.5.0...2.6.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=urllib3&package-manager=pip&previous-version=2.5.0&new-version=2.6.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fd3b904d80d2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.