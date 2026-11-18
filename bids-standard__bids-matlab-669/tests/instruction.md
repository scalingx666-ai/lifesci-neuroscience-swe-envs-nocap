# Issue

**Title:** Bump peter-evans/create-pull-request from 5 to 6

## Description

Bumps [peter-evans/create-pull-request](https://github.com/peter-evans/create-pull-request) from 5 to 6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/peter-evans/create-pull-request/releases">peter-evans/create-pull-request's releases</a>.</em></p>
<blockquote>
<h2>Create Pull Request v6.0.0</h2>
<h2>Behaviour changes</h2>
<ul>
<li>The default values for <code>author</code> and <code>committer</code> have changed. See &quot;What's new&quot; below for details. If you are overriding the default values you will not be affected by this change.</li>
<li>On completion, the action now removes the temporary git remote configuration it adds when using <code>push-to-fork</code>. This should not affect you unless you were using the temporary configuration for some other purpose after the action completes.</li>
</ul>
<h2>What's new</h2>
<ul>
<li>Updated runtime to Node.js 20
<ul>
<li>The action now requires a minimum version of <a href="https://github.com/actions/runner/releases/tag/v2.308.0">v2.308.0</a> for the Actions runner. Update self-hosted runners to v2.308.0 or later to ensure compatibility.</li>
</ul>
</li>
<li>The default value for <code>author</code> has been changed to <code>${{ github.actor }} &lt;${{ github.actor_id }}+${{ github.actor }}@users.noreply.github.com&gt;</code>. The change adds the <code>${{ github.actor_id }}+</code> prefix to the email address to align with GitHub's standard format for the author email address.</li>
<li>The default value for <code>committer</code> has been changed to <code>github-actions[bot] &lt;41898282+github-actions[bot]@users.noreply.github.com&gt;</code>. This is to align with the default GitHub Actions bot user account.</li>
<li>Adds input <code>git-token</code>, the <a href="https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token">Personal Access Token (PAT)</a> that the action will use for git operations. This input defaults to the value of <code>token</code>. Use this input if you would like the action to use a different token for git operations than the one used for the GitHub API.</li>
<li><code>push-to-fork</code> now supports pushing to sibling repositories in the same network.</li>
<li>Previously, when using <code>push-to-fork</code>, the action did not remove temporary git remote configuration it adds during execution. This has been fixed and the configuration is now removed when the action completes.</li>
<li>If the pull request body is truncated due to exceeding the maximum length, the action will now suffix the body with the message &quot;...<em>[Pull request body truncated]</em>&quot; to indicate that the body has been truncated.</li>
<li>The action now uses <code>--unshallow</code> only when necessary, rather than as a default argument of <code>git fetch</code>. This should improve performance, particularly for large git repositories with extensive commit history.</li>
<li>The action can now be executed on one GitHub server and create pull requests on a <em>different</em> GitHub server. Server products include GitHub hosted (github.com), GitHub Enterprise Server (GHES), and GitHub Enterprise Cloud (GHEC). For example, the action can be executed on GitHub hosted and create pull requests on a GHES or GHEC instance.</li>
</ul>
<h2>What's Changed</h2>
<ul>
<li>Update distribution by <a href="https://github.com/actions-bot"><code>@​actions-bot</code></a> in <a href="">peter-evans/create-pull-request#2086</a></li>
<li>fix crazy-max/ghaction-import-gp parameters by <a href="https://github.com/fharper"><code>@​fharper</code></a> in <a href="">peter-evans/create-pull-request#2177</a></li>
<li>Update distribution by <a href="https://github.com/actions-bot"><code>@​actions-bot</code></a> in <a href="">peter-evans/create-pull-request#2364</a></li>
<li>Use checkout v4 by <a href="https://github.com/okuramasafumi"><code>@​okuramasafumi</code></a> in <a href="">peter-evans/create-pull-request#2521</a></li>
<li>Note about <code>delete-branch</code> by <a href="https://github.com/dezren39"><code>@​dezren39</code></a> in <a href="">peter-evans/create-pull-request#2631</a></li>
<li>98 dependency updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/fharper"><code>@​fharper</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#2177</a></li>
<li><a href="https://github.com/okuramasafumi"><code>@​okuramasafumi</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#2521</a></li>
<li><a href="https://github.com/dezren39"><code>@​dezren39</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#2631</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/peter-evans/create-pull-request/compare/v5.0.2...v6.0.0">https://github.com/peter-evans/create-pull-request/compare/v5.0.2...v6.0.0</a></p>
<h2>Create Pull Request v5.0.2</h2>
<p>⚙️ Fixes an issue that occurs when using <code>push-to-fork</code> and both base and head repositories are in the same org/user account.</p>
<h2>What's Changed</h2>
<ul>
<li>fix: specify head repo by <a href="https://github.com/peter-evans"><code>@​peter-evans</code></a> in <a href="">peter-evans/create-pull-request#2044</a></li>
<li>20 dependency updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/peter-evans/create-pull-request/compare/v5.0.1...v5.0.2">https://github.com/peter-evans/create-pull-request/compare/v5.0.1...v5.0.2</a></p>
<h2>Create Pull Request v5.0.1</h2>
<h2>What's Changed</h2>
<ul>
<li>fix: truncate body if exceeds max length by <a href="https://github.com/peter-evans"><code>@​peter-evans</code></a> in <a href="">peter-evans/create-pull-request#1915</a></li>
<li>12 dependency updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/peter-evans/create-pull-request/compare/v5.0.0...v5.0.1">https://github.com/peter-evans/create-pull-request/compare/v5.0.0...v5.0.1</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b1ddad2</code></a> feat: v6 (<a href="">#2717</a>)</li>
<li><a href=""><code>bb80902</code></a> build(deps-dev): bump <code>@​types/node</code> from 18.19.8 to 18.19.10 (<a href="">#2712</a>)</li>
<li><a href=""><code>e0037d4</code></a> build(deps): bump peter-evans/create-or-update-comment from 3 to 4 (<a href="">#2702</a>)</li>
<li><a href=""><code>94b1f99</code></a> build(deps): bump peter-evans/find-comment from 2 to 3 (<a href="">#2703</a>)</li>
<li><a href=""><code>69c27ea</code></a> build(deps-dev): bump ts-jest from 29.1.1 to 29.1.2 (<a href="">#2685</a>)</li>
<li><a href=""><code>7ea722a</code></a> build(deps-dev): bump prettier from 3.2.2 to 3.2.4 (<a href="">#2684</a>)</li>
<li><a href=""><code>5ee839a</code></a> build(deps-dev): bump <code>@​types/node</code> from 18.19.7 to 18.19.8 (<a href="">#2683</a>)</li>
<li><a href=""><code>60fc256</code></a> build(deps-dev): bump eslint-plugin-prettier from 5.1.2 to 5.1.3 (<a href="">#2660</a>)</li>
<li><a href=""><code>0c67723</code></a> build(deps-dev): bump <code>@​types/node</code> from 18.19.5 to 18.19.7 (<a href="">#2661</a>)</li>
<li><a href=""><code>4e288e8</code></a> build(deps-dev): bump prettier from 3.1.1 to 3.2.2 (<a href="">#2659</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/peter-evans/create-pull-request/compare/v5...v6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=peter-evans/create-pull-request&package-manager=github_actions&previous-version=5&new-version=6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `d7a227de2bbc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.