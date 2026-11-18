# Issue

**Title:** Bump yaml from 2.8.1 to 2.8.3

## Description

Bumps [yaml](https://github.com/eemeli/yaml) from 2.8.1 to 2.8.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/eemeli/yaml/releases">yaml's releases</a>.</em></p>
<blockquote>
<h2>v2.8.3</h2>
<ul>
<li>Add <code>trailingComma</code> ToString option for multiline flow formatting (<a href="">#670</a>)</li>
<li>Catch stack overflow during node composition (1e84ebb)</li>
</ul>
<h2>v2.8.2</h2>
<ul>
<li>Serialize -0 as -0 (<a href="">#638</a>)</li>
<li>Do not double newlines for empty map values (<a href="">#642</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ce14587</code></a> 2.8.3</li>
<li><a href=""><code>1e84ebb</code></a> fix: Catch stack overflow during node composition</li>
<li><a href=""><code>6b24090</code></a> ci: Include Prettier check in lint action</li>
<li><a href=""><code>9424dee</code></a> chore: Refresh lockfile</li>
<li><a href=""><code>d1aca82</code></a> Add trailingComma ToString option for multiline flow formatting (<a href="">#670</a>)</li>
<li><a href=""><code>4321509</code></a> ci: Drop the branch filter from GitHub PR actions</li>
<li><a href=""><code>47207d0</code></a> chore: Update docs-slate</li>
<li><a href=""><code>5212fae</code></a> chore: Update docs-slate</li>
<li><a href=""><code>086fa6b</code></a> 2.8.2</li>
<li><a href=""><code>95f01e9</code></a> chore: Add funding to package.json</li>
<li>Additional commits viewable in <a href="https://github.com/eemeli/yaml/compare/v2.8.1...v2.8.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=yaml&package-manager=npm_and_yarn&previous-version=2.8.1&new-version=2.8.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bids-standard/bids-website/network/alerts).

</details>

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--818.org.readthedocs.build/en/818/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ef444e128b03`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.