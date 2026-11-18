# Issue

**Title:** chore(deps): Bump @sigstore/core from 3.1.0 to 3.2.1

## Description

Bumps [@sigstore/core](https://github.com/sigstore/sigstore-js) from 3.1.0 to 3.2.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/sigstore/sigstore-js/releases">@​sigstore/core's releases</a>.</em></p>
<blockquote>
<h2><code>@​sigstore/core</code><a href="https://github.com/3"><code>@​3</code></a>.2.1</h2>
<h3>Patch Changes</h3>
<ul>
<li>b5aa4f1: Apply UTF-8 encoding to payload type during PAE calculation</li>
</ul>
<h2><code>@​sigstore/core</code><a href="https://github.com/3"><code>@​3</code></a>.2.0</h2>
<h3>Minor Changes</h3>
<ul>
<li>8f736ef: Update the <code>createPublicKey</code> function to support base64-encoded keys</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c1dc7d4</code></a> Version Packages (<a href="">#1607</a>)</li>
<li><a href=""><code>f074710</code></a> reject integratedTime w/o inclusionPromise (<a href="">#1659</a>)</li>
<li><a href=""><code>7845532</code></a> OID certificate extension verification (<a href="">#1658</a>)</li>
<li><a href=""><code>b5aa4f1</code></a> proper utf-8 encoding in DSSE PAE (<a href="">#1657</a>)</li>
<li><a href=""><code>c7a34e0</code></a> clarify cert ID matching (<a href="">#1656</a>)</li>
<li><a href=""><code>9858bd7</code></a> Upgrade TypeScript to 6.x (<a href="">#1655</a>)</li>
<li><a href=""><code>8cef20d</code></a> bump qs from 6.15.1 to 6.15.2 (<a href="">#1654</a>)</li>
<li><a href=""><code>aca341b</code></a> bump <code>@​sigstore/mock</code> deps (<a href="">#1653</a>)</li>
<li><a href=""><code>0855aca</code></a> Pin all <code>@​swc/core</code> platform binaries as optionalDependencies (<a href="">#1652</a>)</li>
<li><a href=""><code>44a374d</code></a> Pin all <code>@​swc/core</code> platform binaries as optionalDependencies (<a href="">#1650</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/sigstore/sigstore-js/compare/sigstore@3.1.0...@sigstore/core@3.2.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=@sigstore/core&package-manager=npm_and_yarn&previous-version=3.1.0&new-version=3.2.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/OpenNeuroOrg/openneuro/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b53a15269a3`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.