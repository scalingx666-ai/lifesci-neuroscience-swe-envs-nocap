# Issue

**Title:** Bump actions/checkout from 3.5.2 to 3.5.3

## Description

Bumps [actions/checkout](https://github.com/actions/checkout) from 3.5.2 to 3.5.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/releases">actions/checkout's releases</a>.</em></p>
<blockquote>
<h2>v3.5.3</h2>
<h2>What's Changed</h2>
<ul>
<li>Fix: Checkout Issue in self hosted runner due to faulty submodule check-ins by <a href="https://github.com/megamanics"><code>@​megamanics</code></a> in <a href="">actions/checkout#1196</a></li>
<li>Fix typos found by codespell by <a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> in <a href="">actions/checkout#1287</a></li>
<li>Add support for sparse checkouts by <a href="https://github.com/dscho"><code>@​dscho</code></a> in <a href="">actions/checkout#1369</a></li>
<li>Release v3.5.3 by <a href="https://github.com/TingluoHuang"><code>@​TingluoHuang</code></a> in <a href="">actions/checkout#1376</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/megamanics"><code>@​megamanics</code></a> made their first contribution in <a href="">actions/checkout#1196</a></li>
<li><a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> made their first contribution in <a href="">actions/checkout#1287</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v3...v3.5.3">https://github.com/actions/checkout/compare/v3...v3.5.3</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/blob/main/CHANGELOG.md">actions/checkout's changelog</a>.</em></p>
<blockquote>
<h2>v3.5.3</h2>
<ul>
<li><a href="">Fix: Checkout fail in self-hosted runners when faulty submodule are checked-in</a></li>
<li><a href="">Fix typos found by codespell</a></li>
<li><a href="">Add support for sparse checkouts</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c85c95e</code></a> Release v3.5.3 (<a href="">#1376</a>)</li>
<li><a href=""><code>d106d46</code></a> Add support for sparse checkouts (<a href="">#1369</a>)</li>
<li><a href=""><code>f095bcc</code></a> Fix typos found by codespell (<a href="">#1287</a>)</li>
<li><a href=""><code>47fbe2d</code></a> Fix: Checkout fail in self-hosted runners when faulty submodule are checked-i...</li>
<li>See full diff in <a href="https://github.com/actions/checkout/compare/v3.5.2...v3.5.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/checkout&package-manager=github_actions&previous-version=3.5.2&new-version=3.5.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e6100d0fed96`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.