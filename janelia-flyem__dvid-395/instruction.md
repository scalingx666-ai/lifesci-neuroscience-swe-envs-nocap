# Issue

**Title:** Bump golang.org/x/net from 0.17.0 to 0.23.0

## Description

Bumps [golang.org/x/net](https://github.com/golang/net) from 0.17.0 to 0.23.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c48da13</code></a> http2: fix TestServerContinuationFlood flakes</li>
<li><a href=""><code>762b58d</code></a> http2: fix tipos in comment</li>
<li><a href=""><code>ba87210</code></a> http2: close connections when receiving too many headers</li>
<li><a href=""><code>ebc8168</code></a> all: fix some typos</li>
<li><a href=""><code>3678185</code></a> http2: make TestCanonicalHeaderCacheGrowth faster</li>
<li><a href=""><code>448c44f</code></a> http2: remove clientTester</li>
<li><a href=""><code>c7877ac</code></a> http2: convert the remaining clientTester tests to testClientConn</li>
<li><a href=""><code>d8870b0</code></a> http2: use synthetic time in TestIdleConnTimeout</li>
<li><a href=""><code>d73acff</code></a> http2: only set up deadline when Server.IdleTimeout is positive</li>
<li><a href=""><code>89f602b</code></a> http2: validate client/outgoing trailers</li>
<li>Additional commits viewable in <a href="https://github.com/golang/net/compare/v0.17.0...v0.23.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=golang.org/x/net&package-manager=go_modules&previous-version=0.17.0&new-version=0.23.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

You can trigger a rebase of this PR by commenting `@dependabot rebase`.

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

<!-- Reviewable:start -->
- - -
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/395)
<!-- Reviewable:end -->

> **Note**
> Automatic rebases have been disabled on this pull request as it has been open for over 30 days.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a039fad41660`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.