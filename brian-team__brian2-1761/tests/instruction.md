# Issue

**Title:** Bump peter-evans/create-pull-request from 8.0.0 to 8.1.0

## Description

Bumps [peter-evans/create-pull-request](https://github.com/peter-evans/create-pull-request) from 8.0.0 to 8.1.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/peter-evans/create-pull-request/releases">peter-evans/create-pull-request's releases</a>.</em></p>
<blockquote>
<h2>Create Pull Request v8.1.0</h2>
<h2>What's Changed</h2>
<ul>
<li>README.md: bump given GitHub actions to their latest versions by <a href="https://github.com/deining"><code>@​deining</code></a> in <a href="">peter-evans/create-pull-request#4265</a></li>
<li>build(deps): bump the github-actions group with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">peter-evans/create-pull-request#4273</a></li>
<li>build(deps-dev): bump the npm group with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">peter-evans/create-pull-request#4274</a></li>
<li>build(deps-dev): bump undici from 6.22.0 to 6.23.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">peter-evans/create-pull-request#4284</a></li>
<li>Update distribution by <a href="https://github.com/actions-bot"><code>@​actions-bot</code></a> in <a href="">peter-evans/create-pull-request#4289</a></li>
<li>fix: Handle remote prune failures gracefully on self-hosted runners by <a href="https://github.com/peter-evans"><code>@​peter-evans</code></a> in <a href="">peter-evans/create-pull-request#4295</a></li>
<li>feat: add <code>@​octokit/plugin-retry</code> to handle retriable server errors by <a href="https://github.com/peter-evans"><code>@​peter-evans</code></a> in <a href="">peter-evans/create-pull-request#4298</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/deining"><code>@​deining</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#4265</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/peter-evans/create-pull-request/compare/v8.0.0...v8.1.0">https://github.com/peter-evans/create-pull-request/compare/v8.0.0...v8.1.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c0f553f</code></a> feat: add <code>@​octokit/plugin-retry</code> to handle retriable server errors (<a href="">#4298</a>)</li>
<li><a href=""><code>7000124</code></a> fix: Handle remote prune failures gracefully (<a href="">#4295</a>)</li>
<li><a href=""><code>34aa40e</code></a> build: update distribution (<a href="">#4289</a>)</li>
<li><a href=""><code>641099d</code></a> build(deps-dev): bump undici from 6.22.0 to 6.23.0 (<a href="">#4284</a>)</li>
<li><a href=""><code>2271f1d</code></a> build(deps-dev): bump the npm group with 2 updates (<a href="">#4274</a>)</li>
<li><a href=""><code>437c31a</code></a> build(deps): bump the github-actions group with 2 updates (<a href="">#4273</a>)</li>
<li><a href=""><code>0979079</code></a> docs: update readme</li>
<li><a href=""><code>5b751cd</code></a> README.md: bump given GitHub actions to their latest versions (<a href="">#4265</a>)</li>
<li>See full diff in <a href="https://github.com/peter-evans/create-pull-request/compare/98357b18bf14b5342f975ff684046ec3b2a07725...c0f553fe549906ede9cf27b5156039d195d2ece0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=peter-evans/create-pull-request&package-manager=github_actions&previous-version=8.0.0&new-version=8.1.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7a32e728d4d9`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.