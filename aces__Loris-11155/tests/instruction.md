# Issue

**Title:** Bump guzzlehttp/guzzle from 7.15.1 to 7.15.3

## Description

Bumps [guzzlehttp/guzzle](https://github.com/guzzle/guzzle) from 7.15.1 to 7.15.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/guzzle/guzzle/releases">guzzlehttp/guzzle's releases</a>.</em></p>
<blockquote>
<h2>7.15.3</h2>
<h3>Changed</h3>
<ul>
<li>Adjusted <code>guzzlehttp/promises</code> version constraint to <code>^2.5.2</code></li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Fail a cURL multi handler wait with an attributable error when the transfer is no longer tracked</li>
<li>Fix <code>StreamHandler</code> resolving numeric IPv4 hosts differently from cURL handlers on macOS and Windows</li>
<li>Fix <code>StreamHandler</code> TLS peer names and proxy authorities for numeric IPv4 hosts on all platforms</li>
<li>Settle a cURL multi handler transfer displaced by a request reusing its native handle ID</li>
</ul>
<h2>7.15.2</h2>
<h3>Security</h3>
<ul>
<li>Reject non-printable-ASCII and percent-escaped URI hosts and <code>Host</code> headers (GHSA-v5mv-p594-2x33)</li>
<li>Reject request URI hosts that contain a URI authority delimiter (GHSA-v5mv-p594-2x33)</li>
<li>Reject numeric-looking URI hosts with trailing dots, read as IPv4 addresses (GHSA-v5mv-p594-2x33)</li>
<li>Treat numeric-in-any-base and percent-escaped cookie domains as exact-match-only (GHSA-f7vp-7xgx-4w4r)</li>
<li>Regenerate a derived <code>Host</code> header after client URI rewrites (GHSA-v5mv-p594-2x33)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Preserve <code>RequestException</code> when the stream handler rejects a request before opening a stream</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/guzzle/guzzle/blob/7.15.3/CHANGELOG.md">guzzlehttp/guzzle's changelog</a>.</em></p>
<blockquote>
<h2>7.15.3 - 2026-08-05</h2>
<h3>Changed</h3>
<ul>
<li>Adjusted <code>guzzlehttp/promises</code> version constraint to <code>^2.5.2</code></li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Fail a cURL multi handler wait with an attributable error when the transfer is no longer tracked</li>
<li>Fix <code>StreamHandler</code> resolving numeric IPv4 hosts differently from cURL handlers on macOS and Windows</li>
<li>Fix <code>StreamHandler</code> TLS peer names and proxy authorities for numeric IPv4 hosts on all platforms</li>
<li>Settle a cURL multi handler transfer displaced by a request reusing its native handle ID</li>
</ul>
<h2>7.15.2 - 2026-07-26</h2>
<h3>Security</h3>
<ul>
<li>Reject non-printable-ASCII and percent-escaped URI hosts and <code>Host</code> headers (GHSA-v5mv-p594-2x33)</li>
<li>Reject request URI hosts that contain a URI authority delimiter (GHSA-v5mv-p594-2x33)</li>
<li>Reject numeric-looking URI hosts with trailing dots, read as IPv4 addresses (GHSA-v5mv-p594-2x33)</li>
<li>Treat numeric-in-any-base and percent-escaped cookie domains as exact-match-only (GHSA-f7vp-7xgx-4w4r)</li>
<li>Regenerate a derived <code>Host</code> header after client URI rewrites (GHSA-v5mv-p594-2x33)</li>
</ul>
<h3>Fixed</h3>
<ul>
<li>Preserve <code>RequestException</code> when the stream handler rejects a request before opening a stream</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ae311b8</code></a> Release 7.15.3</li>
<li><a href=""><code>e3d8b4b</code></a> Adjust the guzzlehttp/promises version constraint to ^2.5.2 (<a href="">#3920</a>)</li>
<li><a href=""><code>c55971f</code></a> Settle cURL multi transfers displaced by native handle ID reuse (<a href="">#3917</a>)</li>
<li><a href=""><code>04a8319</code></a> Fold numeric IPv4 hosts in the stream handler (<a href="">#3909</a>)</li>
<li><a href=""><code>ae0facb</code></a> Reject untracked cURL multi handler waits with an attributable error (<a href="">#3911</a>)</li>
<li><a href=""><code>7441019</code></a> Security fixes 7.15 (<a href="">#3907</a>)</li>
<li>See full diff in <a href="https://github.com/guzzle/guzzle/compare/7.15.1...7.15.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=guzzlehttp/guzzle&package-manager=composer&previous-version=7.15.1&new-version=7.15.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46d9a2cb33c8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.