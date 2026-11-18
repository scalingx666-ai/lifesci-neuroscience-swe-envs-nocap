# Issue

**Title:** Bump golang.org/x/net from 0.9.0 to 0.17.0

## Description

Bumps [golang.org/x/net](https://github.com/golang/net) from 0.9.0 to 0.17.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b225e7c</code></a> http2: limit maximum handler goroutines to MaxConcurrentStreams</li>
<li><a href=""><code>88194ad</code></a> go.mod: update golang.org/x dependencies</li>
<li><a href=""><code>2b60a61</code></a> quic: fix several bugs in flow control accounting</li>
<li><a href=""><code>73d82ef</code></a> quic: handle DATA_BLOCKED frames</li>
<li><a href=""><code>5d5a036</code></a> quic: handle streams moving from the data queue to the meta queue</li>
<li><a href=""><code>350aad2</code></a> quic: correctly extend peer's flow control window after MAX_DATA</li>
<li><a href=""><code>21814e7</code></a> quic: validate connection id transport parameters</li>
<li><a href=""><code>a600b35</code></a> quic: avoid redundant MAX_DATA updates</li>
<li><a href=""><code>ea63359</code></a> http2: check stream body is present on read timeout</li>
<li><a href=""><code>ddd8598</code></a> quic: version negotiation</li>
<li>Additional commits viewable in <a href="https://github.com/golang/net/compare/v0.9.0...v0.17.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=golang.org/x/net&package-manager=go_modules&previous-version=0.9.0&new-version=0.17.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

<!-- Reviewable:start -->
- - -
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/390)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `152c0228e2b3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.