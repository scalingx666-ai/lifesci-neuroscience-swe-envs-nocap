# Issue

**Title:** Bump JamesIves/github-pages-deploy-action from 4.6.0 to 4.6.1

## Description

Bumps [JamesIves/github-pages-deploy-action](https://github.com/jamesives/github-pages-deploy-action) from 4.6.0 to 4.6.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/jamesives/github-pages-deploy-action/releases">JamesIves/github-pages-deploy-action's releases</a>.</em></p>
<blockquote>
<h2>v4.6.1</h2>
<h2>What's Changed</h2>
<h3>Fixes</h3>
<ul>
<li>Resolved an issue where workflows were suddenly failing due to a worktree in use error. The action will now attempt to create a temp branch name if the existing branch name is already checked out by a prior to step to ensure it can occur. This issue was only occurring in a handful of workflows, and likely stemmed from a git version change on the official GitHub runners. The actual root cause is still somewhat unknown.</li>
</ul>
<h3>Dependencies</h3>
<ul>
<li>build(deps-dev): bump eslint-plugin-jest from 28.2.0 to 28.5.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1577</a></li>
<li>build(deps): bump <code>@​eslint/js</code> from 9.0.0 to 9.2.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1576</a></li>
<li>build(deps-dev): bump eslint from 9.0.0 to 9.2.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1575</a></li>
<li>build(deps): bump typescript-eslint from 7.7.0 to 7.8.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1569</a></li>
<li>build(deps-dev): bump <code>@​types/node</code> from 20.12.7 to 20.12.9 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1578</a></li>
<li>build(deps-dev): bump <code>@​types/node</code> from 20.12.9 to 20.12.10 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1579</a></li>
<li>build(deps-dev): bump rimraf from 5.0.5 to 5.0.7 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1583</a></li>
<li>build(deps): bump codecov/codecov-action from 4.3.0 to 4.4.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1588</a></li>
<li>build(deps): bump typescript-eslint from 7.8.0 to 7.9.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1586</a></li>
<li>build(deps): bump the eslint group with 3 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1592</a></li>
<li>build(deps-dev): bump the misc group with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">JamesIves/github-pages-deploy-action#1593</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/JamesIves/github-pages-deploy-action/compare/v4...v4.6.1">https://github.com/JamesIves/github-pages-deploy-action/compare/v4...v4.6.1</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5c6e9e9</code></a> Deploy Production Code for Commit e9abb9ce6e35175032a1e82dd997ac600ad10c9b 🚀</li>
<li><a href=""><code>e9abb9c</code></a> Merge branch 'dev' into releases/v4</li>
<li><a href=""><code>079c29c</code></a> build(deps-dev): bump the misc group with 2 updates (<a href="">#1593</a>)</li>
<li><a href=""><code>e0e9b96</code></a> build(deps): bump the eslint group with 3 updates (<a href="">#1592</a>)</li>
<li><a href=""><code>dfda814</code></a> Merge branch 'dev' of <a href="https://github.com/JamesIves/github-pages-deploy-action">https://github.com/JamesIves/github-pages-deploy-action</a>...</li>
<li><a href=""><code>c282185</code></a> chore: update dependabot groups</li>
<li><a href=""><code>91fd6ee</code></a> fix: :bug: Use commish to make branch unique (<a href="">#1591</a>)</li>
<li><a href=""><code>5bb052c</code></a> build(deps): bump typescript-eslint from 7.8.0 to 7.9.0 (<a href="">#1586</a>)</li>
<li><a href=""><code>ef33bcd</code></a> build(deps): bump codecov/codecov-action from 4.3.0 to 4.4.0 (<a href="">#1588</a>)</li>
<li><a href=""><code>1a64cb8</code></a> build(deps-dev): bump rimraf from 5.0.5 to 5.0.7 (<a href="">#1583</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/jamesives/github-pages-deploy-action/compare/v4.6.0...v4.6.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=JamesIves/github-pages-deploy-action&package-manager=github_actions&previous-version=4.6.0&new-version=4.6.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aebe236170bb`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.