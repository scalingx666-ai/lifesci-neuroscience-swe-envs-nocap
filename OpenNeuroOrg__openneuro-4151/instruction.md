# Issue

**Title:** chore(deps): Bump dnspython from 2.8.0 to 2.9.0 in /services/datalad

## Description

Bumps [dnspython](https://github.com/rthalley/dnspython) from 2.8.0 to 2.9.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/rthalley/dnspython/releases">dnspython's releases</a>.</em></p>
<blockquote>
<h2>dnspython 2.9.0</h2>
<p>This release fixes a potential <a href="https://github.com/rthalley/dnspython/security/advisories/GHSA-45c3-73f7-pv4m">excessive CPU consumption</a> issue.   Thanks to Evgenios Gkritsis, Constantinos Patsakis, and George Stergiopoulos, for discovering and reporting this issue.</p>
<p>See <a href="https://dnspython.readthedocs.io/en/stable/whatsnew.html">What's New</a> for details.</p>
<p>The minimum supported version of Python is 3.11.</p>
<p>My thanks to the many people who have contributed to this release. Also thanks to my co-maintainers: Nicki Křížek, Petr Špaček, and Brian Wellington.</p>
<p>This release was published to PyPI using Trusted Publishing.</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/rthalley/dnspython/blob/main/doc/whatsnew.rst">dnspython's changelog</a>.</em></p>
<blockquote>
<h2>2.9.0</h2>
<ul>
<li>
<p>Decompression chain length is limited to 16.  Prior to this change,
a maliciously crafted DNS message could cause
dns.name.from_wire_parser() to use excessive CPU for DNS name
decompression. Applications which processed untrusted DNS wire form
messages with dnspython could be degraded or DoS'd by the extra CPU
use required.</p>
<p>Thanks to Evgenios Gkritsis, Constantinos Patsakis, and George Stergiopoulos
for finding and reporting this issue.</p>
<p>See <a href="https://github.com/rthalley/dnspython/security/advisories/GHSA-45c3-73f7-pv4m">https://github.com/rthalley/dnspython/security/advisories/GHSA-45c3-73f7-pv4m</a></p>
</li>
<li>
<p>Httpx2 has replaced httpx for HTTPS TCP connections.</p>
</li>
<li>
<p>The minimum supported Python version is now 3.11.</p>
</li>
<li>
<p>DNSSEC now supports ML-DSA-44, a post-quantum signature algorithm.</p>
</li>
<li>
<p>The NSEC3 Next Hashed Owner Name in presentation format is now decoded as
base32hex (RFC 5155 Section 1.3, RFC 4648 Extended Hex Alphabet).  The letters
W, X, Y, and Z are not in that alphabet; they used to be accepted and silently
decoded to a different owner name, so <code>to_text</code> of the result did not match
the input.  They are now rejected.</p>
</li>
<li>
<p>The NID and L64 node/locator ids in presentation format are now rejected when
a group contains anything other than hex digits. A sign or underscore, which
<code>int()</code> silently accepts, produced a record whose text form did not parse
back the same way (RFC 6742).</p>
</li>
<li>
<p>Rdata of a known type in the generic <code>\#</code> syntax, such as an NS record in a
zone file, no longer fails to parse when it contains a name under the origin.
Its names are relativized as in the type's own text form.</p>
</li>
<li>
<p>The SVCB and HTTPS <code>ech</code> parameter value must now be an ECHConfigList with a
correct length prefix and at least 4 octets of content (RFC 9848, RFC 9849).
The individual ECHConfig structures are not checked.</p>
</li>
<li>
<p>SVCB and HTTPS SvcParamKeys in presentation format, including those listed in
<code>mandatory</code>, must now be spelled as RFC 9460 requires: 1-63 lowercase
letters, digits, or hyphens.  Uppercase keys such as <code>ALPN</code> and keys with
underscores such as <code>no_default_alpn</code> are rejected.</p>
</li>
<li>
<p>SVCB and HTTPS presentation format parsing now follows the escaping rules of
RFC 9460.  SvcParamKeys may not contain escapes (e.g. <code>\097lpn=h2</code>), and in
comma-separated values (<code>alpn</code>, <code>docpath</code>) only <code>\,</code> and <code>\\</code> are
valid escapes after character-string decoding (e.g. <code>alpn=&quot;h2\\x&quot;</code> is
rejected).</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e790c8f</code></a> add missing test file</li>
<li><a href=""><code>b72af67</code></a> CI release branch update</li>
<li><a href=""><code>bdd62fe</code></a> release prep</li>
<li><a href=""><code>bafc963</code></a> Merge branch 'decompression-limit'</li>
<li><a href=""><code>c5fecf5</code></a> release tidying</li>
<li><a href=""><code>c7686f3</code></a> update dependencies</li>
<li><a href=""><code>3c855c8</code></a> more type lint</li>
<li><a href=""><code>52815c9</code></a> type lint</li>
<li><a href=""><code>f563427</code></a> lint</li>
<li><a href=""><code>b485e46</code></a> Limit decompression to a chain length of at most 16 pointers.</li>
<li>Additional commits viewable in <a href="https://github.com/rthalley/dnspython/compare/v2.8.0...v2.9.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=dnspython&package-manager=uv&previous-version=2.8.0&new-version=2.9.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b6f58c26682`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.