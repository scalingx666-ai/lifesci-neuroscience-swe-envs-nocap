# Issue

**Title:** chore(deps): Bump ip-address from 10.4.0 to 10.7.2

## Description

Bumps [ip-address](https://github.com/beaugunderson/ip-address) from 10.4.0 to 10.7.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/beaugunderson/ip-address/releases">ip-address's releases</a>.</em></p>
<blockquote>
<h2>v10.7.2</h2>
<h2>What's Changed</h2>
<ul>
<li>Accept an arpa suffix in any case and without the root dot in fromArpa by <a href="https://github.com/beaugunderson"><code>@​beaugunderson</code></a> in <a href="">beaugunderson/ip-address#227</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.7.1...v10.7.2">https://github.com/beaugunderson/ip-address/compare/v10.7.1...v10.7.2</a></p>
<h2>v10.7.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Bump js-yaml and brace-expansion in the lockfile by <a href="https://github.com/beaugunderson"><code>@​beaugunderson</code></a> in <a href="">beaugunderson/ip-address#226</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.7.0...v10.7.1">https://github.com/beaugunderson/ip-address/compare/v10.7.0...v10.7.1</a></p>
<h2>v10.7.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Add offset() and nextNetwork(), accept prefix-length ip6.arpa names, correct the IPv6 end-address docs by <a href="https://github.com/beaugunderson"><code>@​beaugunderson</code></a> in <a href="">beaugunderson/ip-address#225</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.6.0...v10.7.0">https://github.com/beaugunderson/ip-address/compare/v10.6.0...v10.7.0</a></p>
<h2>v10.6.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Add isGlobal() and pin the classifiers to the IANA special-purpose registries by <a href="https://github.com/beaugunderson"><code>@​beaugunderson</code></a> in <a href="">beaugunderson/ip-address#224</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.5.1...v10.6.0">https://github.com/beaugunderson/ip-address/compare/v10.5.1...v10.6.0</a></p>
<h2>v10.5.1</h2>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.5.0...v10.5.1">https://github.com/beaugunderson/ip-address/compare/v10.5.0...v10.5.1</a></p>
<h2>v10.5.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Honor the fromURL graceful-failure contract for non-IPv6 hosts by <a href="https://github.com/beaugunderson"><code>@​beaugunderson</code></a> in <a href="">beaugunderson/ip-address#218</a></li>
<li>Correct the documentation where it disagreed with the library by <a href="https://github.com/beaugunderson"><code>@​beaugunderson</code></a> in <a href="">beaugunderson/ip-address#219</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/beaugunderson/ip-address/compare/v10.4.0...v10.5.0">https://github.com/beaugunderson/ip-address/compare/v10.4.0...v10.5.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>974b48d</code></a> 10.7.2</li>
<li><a href=""><code>4dfe8e5</code></a> Accept an arpa suffix in any case and without the root dot in fromArpa (<a href="">#227</a>)</li>
<li><a href=""><code>f0c25df</code></a> 10.7.1</li>
<li><a href=""><code>8b34a21</code></a> Merge commit from fork</li>
<li><a href=""><code>13b6155</code></a> Merge commit from fork</li>
<li><a href=""><code>469ead1</code></a> Reject an address longer than the family allows before parsing it</li>
<li><a href=""><code>1343629</code></a> Report an address of the other family as not contained</li>
<li><a href=""><code>4c2184a</code></a> Bump js-yaml and brace-expansion in the lockfile (<a href="">#226</a>)</li>
<li><a href=""><code>2b7cab5</code></a> 10.7.0</li>
<li><a href=""><code>87fae23</code></a> Add offset() and nextNetwork(), accept prefix-length ip6.arpa names, correct ...</li>
<li>Additional commits viewable in <a href="https://github.com/beaugunderson/ip-address/compare/v10.4.0...v10.7.2">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=ip-address&package-manager=npm_and_yarn&previous-version=10.4.0&new-version=10.7.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d607179a211f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.