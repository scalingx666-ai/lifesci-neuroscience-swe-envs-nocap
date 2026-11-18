# Issue

**Title:** Bump golang.org/x/net from 0.33.0 to 0.36.0

## Description

Bumps [golang.org/x/net](https://github.com/golang/net) from 0.33.0 to 0.36.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>85d1d54</code></a> go.mod: update golang.org/x dependencies</li>
<li><a href=""><code>cde1dda</code></a> proxy, http/httpproxy: do not mismatch IPv6 zone ids against hosts</li>
<li><a href=""><code>fe7f039</code></a> publicsuffix: spruce up code gen and speed up PublicSuffix</li>
<li><a href=""><code>459513d</code></a> internal/http3: move more common stream processing to genericConn</li>
<li><a href=""><code>aad0180</code></a> http2: fix flakiness from t.Log when GOOS=js</li>
<li><a href=""><code>b73e574</code></a> http2: don't log expected errors from writing invalid trailers</li>
<li><a href=""><code>5f45c77</code></a> internal/http3: make read-data tests usable for server handlers</li>
<li><a href=""><code>43c2540</code></a> http2, internal/httpcommon: reject userinfo in :authority</li>
<li><a href=""><code>1d78a08</code></a> http2, internal/httpcommon: factor out server header logic for h2/h3</li>
<li><a href=""><code>0d7dc54</code></a> quic: add Conn.ConnectionState</li>
<li>Additional commits viewable in <a href="https://github.com/golang/net/compare/v0.33.0...v0.36.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=golang.org/x/net&package-manager=go_modules&previous-version=0.33.0&new-version=0.36.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/janelia-flyem/dvid/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `24b3b9ca4585`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.