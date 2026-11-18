# Issue

**Title:** Bump golang.org/x/net from 0.36.0 to 0.38.0

## Description

Bumps [golang.org/x/net](https://github.com/golang/net) from 0.36.0 to 0.38.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e1fcd82</code></a> html: properly handle trailing solidus in unquoted attribute value in foreign...</li>
<li><a href=""><code>ebed060</code></a> internal/http3: fix build of tests with GOEXPERIMENT=nosynctest</li>
<li><a href=""><code>1f1fa29</code></a> publicsuffix: regenerate table</li>
<li><a href=""><code>1215081</code></a> http2: improve error when server sends HTTP/1</li>
<li><a href=""><code>312450e</code></a> html: ensure &lt;search&gt; tag closes &lt;p&gt; and update tests</li>
<li><a href=""><code>09731f9</code></a> http2: improve handling of lost PING in Server</li>
<li><a href=""><code>55989e2</code></a> http2/h2c: use ResponseController for hijacking connections</li>
<li><a href=""><code>2914f46</code></a> websocket: re-recommend gorilla/websocket</li>
<li><a href=""><code>99b3ae0</code></a> go.mod: update golang.org/x dependencies</li>
<li>See full diff in <a href="https://github.com/golang/net/compare/v0.36.0...v0.38.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=golang.org/x/net&package-manager=go_modules&previous-version=0.36.0&new-version=0.38.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b19c580afd5b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.