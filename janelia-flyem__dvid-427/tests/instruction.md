# Issue

**Title:** Bump golang.org/x/net from 0.52.0 to 0.55.0

## Description

Bumps [golang.org/x/net](https://github.com/golang/net) from 0.52.0 to 0.55.0.
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7770ec4</code></a> go.mod: update golang.org/x dependencies</li>
<li><a href=""><code>4ece7b6</code></a> html: escape greater-than symbol in doctype identifiers</li>
<li><a href=""><code>08be507</code></a> html: improve Noah's Ark clause performance</li>
<li><a href=""><code>a8fb2fe</code></a> html: properly render fostered elements in foreign content</li>
<li><a href=""><code>0dc5b7a</code></a> html: properly check namespace in &quot;in body&quot; any other end tag</li>
<li><a href=""><code>a452f3c</code></a> html: ignore duplicate attributes during tokenization</li>
<li><a href=""><code>f865199</code></a> quic: fix appendMaxDataFrame erroneously accumulating sentLimit</li>
<li><a href=""><code>210ed3c</code></a> quic: establish a &quot;happened-before&quot; relationship between stream write and read</li>
<li><a href=""><code>ad8140e</code></a> quic: fix buffer slicing when handling overlapping stream data</li>
<li><a href=""><code>23ee2ef</code></a> http2: avoid API changes when built with go1.27</li>
<li>Additional commits viewable in <a href="https://github.com/golang/net/compare/v0.52.0...v0.55.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=golang.org/x/net&package-manager=go_modules&previous-version=0.52.0&new-version=0.55.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/janelia-flyem/dvid/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3400c2cb10f6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.