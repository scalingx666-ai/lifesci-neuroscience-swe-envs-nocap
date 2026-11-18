# Issue

**Title:** Bump golang.org/x/crypto from 0.21.0 to 0.31.0

## Description

Bumps [golang.org/x/crypto](https://github.com/golang/crypto) from 0.21.0 to 0.31.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b4f1988</code></a> ssh: make the public key cache a 1-entry FIFO cache</li>
<li><a href=""><code>7042ebc</code></a> openpgp/clearsign: just use rand.Reader in tests</li>
<li><a href=""><code>3e90321</code></a> go.mod: update golang.org/x dependencies</li>
<li><a href=""><code>8c4e668</code></a> x509roots/fallback: update bundle</li>
<li><a href=""><code>6018723</code></a> go.mod: update golang.org/x dependencies</li>
<li><a href=""><code>71ed71b</code></a> README: don't recommend go get</li>
<li><a href=""><code>750a45f</code></a> sha3: add MarshalBinary, AppendBinary, and UnmarshalBinary</li>
<li><a href=""><code>36b1725</code></a> sha3: avoid trailing permutation</li>
<li><a href=""><code>80ea76e</code></a> sha3: fix padding for long cSHAKE parameters</li>
<li><a href=""><code>c17aa50</code></a> sha3: avoid buffer copy</li>
<li>Additional commits viewable in <a href="https://github.com/golang/crypto/compare/v0.21.0...v0.31.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=golang.org/x/crypto&package-manager=go_modules&previous-version=0.21.0&new-version=0.31.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
This change is [<img src="https://reviewable.io/review_button.svg" height="34" align="absmiddle" alt="Reviewable"/>](https://reviewable.io/reviews/janelia-flyem/dvid/398)
<!-- Reviewable:end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ee1b9747f2c1`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.