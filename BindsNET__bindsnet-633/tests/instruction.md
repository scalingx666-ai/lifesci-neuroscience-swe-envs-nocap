# Issue

**Title:** Bump requests from 2.30.0 to 2.31.0

## Description

Bumps [requests](https://github.com/psf/requests) from 2.30.0 to 2.31.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/releases">requests's releases</a>.</em></p>
<blockquote>
<h2>v2.31.0</h2>
<h2>2.31.0 (2023-05-22)</h2>
<p><strong>Security</strong></p>
<ul>
<li>
<p>Versions of Requests between v2.3.0 and v2.30.0 are vulnerable to potential
forwarding of <code>Proxy-Authorization</code> headers to destination servers when
following HTTPS redirects.</p>
<p>When proxies are defined with user info (<a href="https://user:pass@proxy:8080">https://user:pass@proxy:8080</a>), Requests
will construct a <code>Proxy-Authorization</code> header that is attached to the request to
authenticate with the proxy.</p>
<p>In cases where Requests receives a redirect response, it previously reattached
the <code>Proxy-Authorization</code> header incorrectly, resulting in the value being
sent through the tunneled connection to the destination server. Users who rely on
defining their proxy credentials in the URL are <em>strongly</em> encouraged to upgrade
to Requests 2.31.0+ to prevent unintentional leakage and rotate their proxy
credentials once the change has been fully deployed.</p>
<p>Users who do not use a proxy or do not supply their proxy credentials through
the user information portion of their proxy URL are not subject to this
vulnerability.</p>
<p>Full details can be read in our <a href="https://github.com/psf/requests/security/advisories/GHSA-j8r2-6x86-q33q">Github Security Advisory</a>
and <a href="https://nvd.nist.gov/vuln/detail/CVE-2023-32681">CVE-2023-32681</a>.</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/blob/main/HISTORY.md">requests's changelog</a>.</em></p>
<blockquote>
<h2>2.31.0 (2023-05-22)</h2>
<p><strong>Security</strong></p>
<ul>
<li>
<p>Versions of Requests between v2.3.0 and v2.30.0 are vulnerable to potential
forwarding of <code>Proxy-Authorization</code> headers to destination servers when
following HTTPS redirects.</p>
<p>When proxies are defined with user info (<a href="https://user:pass@proxy:8080">https://user:pass@proxy:8080</a>), Requests
will construct a <code>Proxy-Authorization</code> header that is attached to the request to
authenticate with the proxy.</p>
<p>In cases where Requests receives a redirect response, it previously reattached
the <code>Proxy-Authorization</code> header incorrectly, resulting in the value being
sent through the tunneled connection to the destination server. Users who rely on
defining their proxy credentials in the URL are <em>strongly</em> encouraged to upgrade
to Requests 2.31.0+ to prevent unintentional leakage and rotate their proxy
credentials once the change has been fully deployed.</p>
<p>Users who do not use a proxy or do not supply their proxy credentials through
the user information portion of their proxy URL are not subject to this
vulnerability.</p>
<p>Full details can be read in our <a href="https://github.com/psf/requests/security/advisories/GHSA-j8r2-6x86-q33q">Github Security Advisory</a>
and <a href="https://nvd.nist.gov/vuln/detail/CVE-2023-32681">CVE-2023-32681</a>.</p>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>147c851</code></a> v2.31.0</li>
<li><a href=""><code>74ea7cf</code></a> Merge pull request from GHSA-j8r2-6x86-q33q</li>
<li><a href=""><code>3022253</code></a> test on pypy 3.8 and pypy 3.9 on windows and macos (<a href="">#6424</a>)</li>
<li><a href=""><code>b639e66</code></a> test on py3.12 (<a href="">#6448</a>)</li>
<li><a href=""><code>d3d5044</code></a> Fixed a small typo (<a href="">#6452</a>)</li>
<li>See full diff in <a href="https://github.com/psf/requests/compare/v2.30.0...v2.31.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=requests&package-manager=pip&previous-version=2.30.0&new-version=2.31.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c48f9dd16aa`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.