# Issue

**Title:** Bump jsonwebtoken from 8.5.1 to 9.0.0

## Description

Bumps [jsonwebtoken](https://github.com/auth0/node-jsonwebtoken) from 8.5.1 to 9.0.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/auth0/node-jsonwebtoken/blob/master/CHANGELOG.md">jsonwebtoken's changelog</a>.</em></p>
<blockquote>
<h2>9.0.0 - 2022-12-21</h2>
<p><strong>Breaking changes: See <a href="https://github.com/auth0/node-jsonwebtoken/wiki/Migration-Notes:-v8-to-v9">Migration from v8 to v9</a></strong></p>
<h3>Breaking changes</h3>
<ul>
<li>Removed support for Node versions 11 and below.</li>
<li>The verify() function no longer accepts unsigned tokens by default. ([834503079514b72264fd13023a3b8d648afd6a16]<a href=""></a>)</li>
<li>RSA key size must be 2048 bits or greater. ([ecdf6cc6073ea13a7e71df5fad043550f08d0fa6]<a href=""></a>)</li>
<li>Key types must be valid for the signing / verification algorithm</li>
</ul>
<h3>Security fixes</h3>
<ul>
<li>security: fixes <code>Arbitrary File Write via verify function</code> - CVE-2022-23529</li>
<li>security: fixes <code>Insecure default algorithm in jwt.verify() could lead to signature validation bypass</code> - CVE-2022-23540</li>
<li>security: fixes <code>Insecure implementation of key retrieval function could lead to Forgeable Public/Private Tokens from RSA to HMAC</code> - CVE-2022-23541</li>
<li>security: fixes <code>Unrestricted key type could lead to legacy keys usage</code> - CVE-2022-23539</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e1fa9dc</code></a> Merge pull request from GHSA-8cf7-32gw-wr33</li>
<li><a href=""><code>5eaedbf</code></a> chore(ci): remove github test actions job (<a href="https://github-redirect.dependabot.com/auth0/node-jsonwebtoken/issues/861">#861</a>)</li>
<li><a href=""><code>cd4163e</code></a> chore(ci): configure Github Actions jobs for Tests &amp; Security Scanning (<a href="https://github-redirect.dependabot.com/auth0/node-jsonwebtoken/issues/856">#856</a>)</li>
<li><a href=""><code>ecdf6cc</code></a> fix!: Prevent accidental use of insecure key sizes &amp; misconfiguration of secr...</li>
<li><a href=""><code>8345030</code></a> fix(sign&amp;verify)!: Remove default <code>none</code> support from <code>sign</code> and <code>verify</code> met...</li>
<li><a href=""><code>7e6a86b</code></a> Upload OpsLevel YAML (<a href="https://github-redirect.dependabot.com/auth0/node-jsonwebtoken/issues/849">#849</a>)</li>
<li><a href=""><code>74d5719</code></a> docs: update references vercel/ms references (<a href="https://github-redirect.dependabot.com/auth0/node-jsonwebtoken/issues/770">#770</a>)</li>
<li><a href=""><code>d71e383</code></a> docs: document &quot;invalid token&quot; error</li>
<li><a href=""><code>3765003</code></a> docs: fix spelling in README.md: Peak -&gt; Peek (<a href="https://github-redirect.dependabot.com/auth0/node-jsonwebtoken/issues/754">#754</a>)</li>
<li><a href=""><code>a46097e</code></a> docs: make decode impossible to discover before verify</li>
<li>Additional commits viewable in <a href="https://github.com/auth0/node-jsonwebtoken/compare/v8.5.1...v9.0.0">compare view</a></li>
</ul>
</details>
<details>
<summary>Maintainer changes</summary>
<p>This version was pushed to npm by <a href="https://www.npmjs.com/~julien.wollscheid">julien.wollscheid</a>, a new releaser for jsonwebtoken since your current version.</p>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=jsonwebtoken&package-manager=npm_and_yarn&previous-version=8.5.1&new-version=9.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/patrickjquinn/P-Brain.ai/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b07bca8f6931`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.