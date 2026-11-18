# Issue

**Title:** Bump golang.org/x/net from 0.23.0 to 0.33.0

## Description

Bumps [golang.org/x/net](https://github.com/golang/net) from 0.23.0 to 0.33.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dfc720d</code></a> go.mod: update golang.org/x dependencies</li>
<li><a href=""><code>8e66b04</code></a> html: use strings.EqualFold instead of lowering ourselves</li>
<li><a href=""><code>b935f7b</code></a> html: avoid endless loop on error token</li>
<li><a href=""><code>9af49ef</code></a> route: remove unused sizeof* consts</li>
<li><a href=""><code>6705db9</code></a> quic: clean up crypto streams when dropping packet protection keys</li>
<li><a href=""><code>4ef7588</code></a> quic: handle ACK frame in packet which drops number space</li>
<li><a href=""><code>552d8ac</code></a> Revert &quot;route: change from syscall to x/sys/unix&quot;</li>
<li><a href=""><code>13a7c01</code></a> Revert &quot;route: remove unused sizeof* consts on freebsd&quot;</li>
<li><a href=""><code>285e1cf</code></a> go.mod: update golang.org/x dependencies</li>
<li><a href=""><code>d0a1049</code></a> route: remove unused sizeof* consts on freebsd</li>
<li>Additional commits viewable in <a href="https://github.com/golang/net/compare/v0.23.0...v0.33.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=golang.org/x/net&package-manager=go_modules&previous-version=0.23.0&new-version=0.33.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/399)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `47888791b43b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.