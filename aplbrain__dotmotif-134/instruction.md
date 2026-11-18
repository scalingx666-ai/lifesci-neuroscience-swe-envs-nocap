# Issue

**Title:** Bump urllib3 from 2.0.2 to 2.0.6

## Description

Bumps [urllib3](https://github.com/urllib3/urllib3) from 2.0.2 to 2.0.6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/urllib3/urllib3/releases">urllib3's releases</a>.</em></p>
<blockquote>
<h2>2.0.6</h2>
<ul>
<li>Added the <code>Cookie</code> header to the list of headers to strip from requests when redirecting to a different host. As before, different headers can be set via <code>Retry.remove_headers_on_redirect</code>. (GHSA-v845-jxx5-vc9f)</li>
</ul>
<h2>2.0.5</h2>
<ul>
<li>Allowed pyOpenSSL third-party module without any deprecation warning. <a href="">#3126</a></li>
<li>Fixed default <code>blocksize</code> of <code>HTTPConnection</code> classes to match high-level classes. Previously was 8KiB, now 16KiB. <a href="">#3066</a></li>
</ul>
<h2>2.0.4</h2>
<ul>
<li>Added support for union operators to <code>HTTPHeaderDict</code> (<a href="">#2254</a>)</li>
<li>Added <code>BaseHTTPResponse</code> to <code>urllib3.__all__</code> (<a href="">#3078</a>)</li>
<li>Fixed <code>urllib3.connection.HTTPConnection</code> to raise the <code>http.client.connect</code> audit event to have the same behavior as the standard library HTTP client (<a href="">#2757</a>)</li>
<li>Relied on the standard library for checking hostnames in supported PyPy releases (<a href="">#3087</a>)</li>
</ul>
<h2>2.0.3</h2>
<ul>
<li>Allowed alternative SSL libraries such as LibreSSL, while still issuing a warning as we cannot help users facing issues with implementations other than OpenSSL. <a href="">#3020</a></li>
<li>Deprecated URLs which don't have an explicit scheme <a href="">#2950</a></li>
<li>Fixed response decoding with Zstandard when compressed data is made of several frames. <a href="">#3008</a></li>
<li>Fixed <code>assert_hostname=False</code> to correctly skip hostname check. <a href="">#3051</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/urllib3/urllib3/blob/main/CHANGES.rst">urllib3's changelog</a>.</em></p>
<blockquote>
<h1>2.0.6 (2023-10-02)</h1>
<ul>
<li>Added the <code>Cookie</code> header to the list of headers to strip from requests when redirecting to a different host. As before, different headers can be set via <code>Retry.remove_headers_on_redirect</code>.</li>
</ul>
<h1>2.0.5 (2023-09-20)</h1>
<ul>
<li>Allowed pyOpenSSL third-party module without any deprecation warning. (<code> &lt;</code>__)</li>
<li>Fixed default <code>blocksize</code> of <code>HTTPConnection</code> classes to match high-level classes. Previously was 8KiB, now 16KiB. (<code> &lt;</code>__)</li>
</ul>
<h1>2.0.4 (2023-07-19)</h1>
<ul>
<li>Added support for union operators to <code>HTTPHeaderDict</code> (<code> &lt;</code>__)</li>
<li>Added <code>BaseHTTPResponse</code> to <code>urllib3.__all__</code> (<code> &lt;</code>__)</li>
<li>Fixed <code>urllib3.connection.HTTPConnection</code> to raise the <code>http.client.connect</code> audit event to have the same behavior as the standard library HTTP client (<code> &lt;</code>__)</li>
<li>Relied on the standard library for checking hostnames in supported PyPy releases (<code> &lt;</code>__)</li>
</ul>
<h1>2.0.3 (2023-06-07)</h1>
<ul>
<li>Allowed alternative SSL libraries such as LibreSSL, while still issuing a warning as we cannot help users facing issues with implementations other than OpenSSL. (<code> &lt;</code>__)</li>
<li>Deprecated URLs which don't have an explicit scheme (<code> &lt;</code>_)</li>
<li>Fixed response decoding with Zstandard when compressed data is made of several frames. (<code> &lt;</code>__)</li>
<li>Fixed <code>assert_hostname=False</code> to correctly skip hostname check. (<code> &lt;</code>__)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>262e3e3</code></a> Release 2.0.6</li>
<li><a href=""><code>644124e</code></a> Merge pull request from GHSA-v845-jxx5-vc9f</li>
<li><a href=""><code>740380c</code></a> Bump cryptography from 41.0.3 to 41.0.4 (<a href="">#3131</a>)</li>
<li><a href=""><code>d9f85a7</code></a> Release 2.0.5</li>
<li><a href=""><code>d41f412</code></a> Undeprecate pyOpenSSL module (<a href="">#3127</a>)</li>
<li><a href=""><code>b6c04cb</code></a> Fix a link to &quot;absolute URI&quot; definition (<a href="">#3128</a>)</li>
<li><a href=""><code>af7c78f</code></a> refactor: change double conditional to one (<a href="">#3118</a>)</li>
<li><a href=""><code>34c13c8</code></a> Refer to current internet standards in docs on proxies (<a href="">#3124</a>)</li>
<li><a href=""><code>a3e94f2</code></a> Fix a name of an attribute in docs (<a href="">#3125</a>)</li>
<li><a href=""><code>da69d4f</code></a> Fix docs build (<a href="">#3123</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/urllib3/urllib3/compare/2.0.2...2.0.6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=urllib3&package-manager=pip&previous-version=2.0.2&new-version=2.0.6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe77d4087d71`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.