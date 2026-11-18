# Issue

**Title:** Bump peter-evans/create-pull-request from 7 to 8

## Description

Bumps [peter-evans/create-pull-request](https://github.com/peter-evans/create-pull-request) from 7 to 8.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/peter-evans/create-pull-request/releases">peter-evans/create-pull-request's releases</a>.</em></p>
<blockquote>
<h2>Create Pull Request v8.0.0</h2>
<h2>What's new in v8</h2>
<ul>
<li>Requires <a href="https://github.com/actions/runner/releases/tag/v2.327.1">Actions Runner v2.327.1</a> or later if you are using a self-hosted runner for Node 24 support.</li>
</ul>
<h2>What's Changed</h2>
<ul>
<li>chore: Update checkout action version to v6 by <a href="https://github.com/yonas"><code>@​yonas</code></a> in <a href="">peter-evans/create-pull-request#4258</a></li>
<li>Update actions/checkout references to <a href="https://github.com/v6"><code>@​v6</code></a> in docs by <a href="https://github.com/Copilot"><code>@​Copilot</code></a> in <a href="">peter-evans/create-pull-request#4259</a></li>
<li>feat: v8 by <a href="https://github.com/peter-evans"><code>@​peter-evans</code></a> in <a href="">peter-evans/create-pull-request#4260</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/yonas"><code>@​yonas</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#4258</a></li>
<li><a href="https://github.com/Copilot"><code>@​Copilot</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#4259</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/peter-evans/create-pull-request/compare/v7.0.11...v8.0.0">https://github.com/peter-evans/create-pull-request/compare/v7.0.11...v8.0.0</a></p>
<h2>Create Pull Request v7.0.11</h2>
<h2>What's Changed</h2>
<ul>
<li>fix: restrict remote prune to self-hosted runners by <a href="https://github.com/peter-evans"><code>@​peter-evans</code></a> in <a href="">peter-evans/create-pull-request#4250</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/peter-evans/create-pull-request/compare/v7.0.10...v7.0.11">https://github.com/peter-evans/create-pull-request/compare/v7.0.10...v7.0.11</a></p>
<h2>Create Pull Request v7.0.10</h2>
<p>⚙️ Fixes an issue where updating a pull request failed when targeting a forked repository with the same owner as its parent.</p>
<h2>What's Changed</h2>
<ul>
<li>build(deps): bump the github-actions group with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">peter-evans/create-pull-request#4235</a></li>
<li>build(deps-dev): bump prettier from 3.6.2 to 3.7.3 in the npm group by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">peter-evans/create-pull-request#4240</a></li>
<li>fix: provider list pulls fallback for multi fork same owner by <a href="https://github.com/peter-evans"><code>@​peter-evans</code></a> in <a href="">peter-evans/create-pull-request#4245</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/obnyis"><code>@​obnyis</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#4064</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/peter-evans/create-pull-request/compare/v7.0.9...v7.0.10">https://github.com/peter-evans/create-pull-request/compare/v7.0.9...v7.0.10</a></p>
<h2>Create Pull Request v7.0.9</h2>
<p>⚙️ Fixes an <a href="">incompatibility</a> with the recently released <code>actions/checkout@v6</code>.</p>
<h2>What's Changed</h2>
<ul>
<li>~70 dependency updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a></li>
<li>docs: fix workaround description about <code>ready_for_review</code> by <a href="https://github.com/ybiquitous"><code>@​ybiquitous</code></a> in <a href="">peter-evans/create-pull-request#3939</a></li>
<li>Docs: <code>add-paths</code> default behavior by <a href="https://github.com/joeflack4"><code>@​joeflack4</code></a> in <a href="">peter-evans/create-pull-request#3928</a></li>
<li>docs: update to create-github-app-token v2 by <a href="https://github.com/Goooler"><code>@​Goooler</code></a> in <a href="">peter-evans/create-pull-request#4063</a></li>
<li>Fix compatibility with actions/checkout@v6 by <a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> in <a href="">peter-evans/create-pull-request#4230</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/joeflack4"><code>@​joeflack4</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#3928</a></li>
<li><a href="https://github.com/Goooler"><code>@​Goooler</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#4063</a></li>
<li><a href="https://github.com/ericsciple"><code>@​ericsciple</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#4230</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>98357b1</code></a> feat: v8 (<a href="">#4260</a>)</li>
<li><a href=""><code>41c0e4b</code></a> Update actions/checkout references to <a href="https://github.com/v6"><code>@​v6</code></a> in docs (<a href="">#4259</a>)</li>
<li><a href=""><code>994332d</code></a> chore: Update checkout action version to v6 (<a href="">#4258</a>)</li>
<li>See full diff in <a href="https://github.com/peter-evans/create-pull-request/compare/v7...v8">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=peter-evans/create-pull-request&package-manager=github_actions&previous-version=7&new-version=8)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

You can trigger a rebase of this PR by commenting `@dependabot rebase`.

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

> **Note**
> Automatic rebases have been disabled on this pull request as it has been open for over 30 days.

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ec45fd18bb76`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.