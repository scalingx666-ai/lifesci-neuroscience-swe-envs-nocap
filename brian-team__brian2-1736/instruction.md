# Issue

**Title:** Bump coverallsapp/github-action from 2.3.6 to 2.3.7

## Description

Bumps [coverallsapp/github-action](https://github.com/coverallsapp/github-action) from 2.3.6 to 2.3.7.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/coverallsapp/github-action/releases">coverallsapp/github-action's releases</a>.</em></p>
<blockquote>
<h2>v2.3.7</h2>
<h2>What's Changed</h2>
<ul>
<li>README.md: Use current actions/setup-node and LTS version of Node.js by <a href="https://github.com/cclauss"><code>@​cclauss</code></a> in <a href="">coverallsapp/github-action#247</a></li>
<li>Update workflow to update and verify release branch by <a href="https://github.com/afinetooth"><code>@​afinetooth</code></a> in <a href="">coverallsapp/github-action#249</a></li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li>Fixed <code>fail-on-error</code> behavior when download fails (<a href="">#253</a>), PR <a href="">#254</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/cclauss"><code>@​cclauss</code></a> made their first contribution in <a href="">coverallsapp/github-action#247</a></li>
<li><a href="https://github.com/Copilot"><code>@​Copilot</code></a> made their first contribution in <a href="">coverallsapp/github-action#254</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/coverallsapp/github-action/compare/v2...v2.3.7">https://github.com/coverallsapp/github-action/compare/v2...v2.3.7</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5cbfd81</code></a> Fix fail-on-error to handle all installation and execution failures (<a href="">#254</a>)</li>
<li><a href=""><code>e988b39</code></a> Update workflow to sync and verify release branch (<a href="">#249</a>)</li>
<li><a href=""><code>e7f4f97</code></a> README.md: Use current actions/setup-node and LTS version of Node.js (<a href="">#247</a>)</li>
<li>See full diff in <a href="https://github.com/coverallsapp/github-action/compare/648a8eb78e6d50909eff900e4ec85cab4524a45b...5cbfd81b66ca5d10c19b062c04de0199c215fb6e">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=coverallsapp/github-action&package-manager=github_actions&previous-version=2.3.6&new-version=2.3.7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `01315468b17c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.