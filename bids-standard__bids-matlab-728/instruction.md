# Issue

**Title:** Bump peter-evans/create-pull-request from 6 to 7

## Description

Bumps [peter-evans/create-pull-request](https://github.com/peter-evans/create-pull-request) from 6 to 7.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/peter-evans/create-pull-request/releases">peter-evans/create-pull-request's releases</a>.</em></p>
<blockquote>
<h2>Create Pull Request v7.0.0</h2>
<p>:sparkles: Now supports commit signing with bot-generated tokens! See &quot;What's new&quot; below. :writing_hand::robot:</p>
<h3>Behaviour changes</h3>
<ul>
<li>Action input <code>git-token</code> has been renamed <code>branch-token</code>, to be more clear about its purpose. The <code>branch-token</code> is the token that the action will use to create and update the branch.</li>
<li>The action now handles requests that have been rate-limited by GitHub. Requests hitting a primary rate limit will retry twice, for a total of three attempts. Requests hitting a secondary rate limit will not be retried.</li>
<li>The <code>pull-request-operation</code> output now returns <code>none</code> when no operation was executed.</li>
<li>Removed deprecated output environment variable <code>PULL_REQUEST_NUMBER</code>. Please use the <code>pull-request-number</code> action output instead.</li>
</ul>
<h3>What's new</h3>
<ul>
<li>The action can now sign commits as <code>github-actions[bot]</code> when using <code>GITHUB_TOKEN</code>, or your own bot when using <a href="https://github.com/peter-evans/create-pull-request/blob/HEAD/docs/concepts-guidelines.md#authenticating-with-github-app-generated-tokens">GitHub App tokens</a>. See <a href="https://github.com/peter-evans/create-pull-request/blob/HEAD/docs/concepts-guidelines.md#commit-signature-verification-for-bots">commit signing</a> for details.</li>
<li>Action input <code>draft</code> now accepts a new value <code>always-true</code>. This will set the pull request to draft status when the pull request is updated, as well as on creation.</li>
<li>A new action input <code>maintainer-can-modify</code> indicates whether <a href="https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/allowing-changes-to-a-pull-request-branch-created-from-a-fork">maintainers can modify</a> the pull request. The default is <code>true</code>, which retains the existing behaviour of the action.</li>
<li>A new output <code>pull-request-commits-verified</code> returns <code>true</code> or <code>false</code>, indicating whether GitHub considers the signature of the branch's commits to be verified.</li>
</ul>
<h2>What's Changed</h2>
<ul>
<li>build(deps-dev): bump <code>@​types/node</code> from 18.19.36 to 18.19.39 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3000</a></li>
<li>build(deps-dev): bump ts-jest from 29.1.5 to 29.2.0 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3008</a></li>
<li>build(deps-dev): bump prettier from 3.3.2 to 3.3.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3018</a></li>
<li>build(deps-dev): bump ts-jest from 29.2.0 to 29.2.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3019</a></li>
<li>build(deps-dev): bump eslint-plugin-prettier from 5.1.3 to 5.2.1 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3035</a></li>
<li>build(deps-dev): bump <code>@​types/node</code> from 18.19.39 to 18.19.41 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3037</a></li>
<li>build(deps): bump undici from 6.19.2 to 6.19.4 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3036</a></li>
<li>build(deps-dev): bump ts-jest from 29.2.2 to 29.2.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3038</a></li>
<li>build(deps-dev): bump <code>@​types/node</code> from 18.19.41 to 18.19.42 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3070</a></li>
<li>build(deps): bump undici from 6.19.4 to 6.19.5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3086</a></li>
<li>build(deps-dev): bump <code>@​types/node</code> from 18.19.42 to 18.19.43 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3087</a></li>
<li>build(deps-dev): bump ts-jest from 29.2.3 to 29.2.4 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3088</a></li>
<li>build(deps): bump undici from 6.19.5 to 6.19.7 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3145</a></li>
<li>build(deps-dev): bump <code>@​types/node</code> from 18.19.43 to 18.19.44 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3144</a></li>
<li>Update distribution by <a href="https://github.com/actions-bot"><code>@​actions-bot</code></a> in <a href="">peter-evans/create-pull-request#3154</a></li>
<li>build(deps): bump undici from 6.19.7 to 6.19.8 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3213</a></li>
<li>build(deps-dev): bump <code>@​types/node</code> from 18.19.44 to 18.19.45 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3214</a></li>
<li>Update distribution by <a href="https://github.com/actions-bot"><code>@​actions-bot</code></a> in <a href="">peter-evans/create-pull-request#3221</a></li>
<li>build(deps-dev): bump eslint-import-resolver-typescript from 3.6.1 to 3.6.3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3255</a></li>
<li>build(deps-dev): bump <code>@​types/node</code> from 18.19.45 to 18.19.46 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3254</a></li>
<li>build(deps-dev): bump ts-jest from 29.2.4 to 29.2.5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">peter-evans/create-pull-request#3256</a></li>
<li>v7 - signed commits by <a href="https://github.com/peter-evans"><code>@​peter-evans</code></a> in <a href="">peter-evans/create-pull-request#3057</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/rustycl0ck"><code>@​rustycl0ck</code></a> made their first contribution in <a href="">peter-evans/create-pull-request#3057</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/peter-evans/create-pull-request/compare/v6.1.0...v7.0.0">https://github.com/peter-evans/create-pull-request/compare/v6.1.0...v7.0.0</a></p>
<h2>Create Pull Request v6.1.0</h2>
<p>✨ Adds <code>pull-request-branch</code> as an action output.</p>
<h2>What's Changed</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5e91468</code></a> fix: support symlinks when commit signing (<a href="">#3359</a>)</li>
<li><a href=""><code>2f38cd2</code></a> fix: support submodules when commit signing (<a href="">#3354</a>)</li>
<li><a href=""><code>7a8aeac</code></a> build(deps-dev): bump eslint from 8.57.0 to 8.57.1 (<a href="">#3344</a>)</li>
<li><a href=""><code>d39d596</code></a> build(deps-dev): bump <code>@​types/jest</code> from 29.5.12 to 29.5.13 (<a href="">#3343</a>)</li>
<li><a href=""><code>f6f978f</code></a> docs: correct suggestion for bot setup (<a href="">#3342</a>)</li>
<li><a href=""><code>6cd32fd</code></a> fix: disable abbreviated commit shas in diff (<a href="">#3337</a>)</li>
<li><a href=""><code>d121e62</code></a> fix: disable diff detection for renames and copies (<a href="">#3330</a>)</li>
<li><a href=""><code>f4d66f4</code></a> build(deps-dev): bump typescript from 5.5.4 to 5.6.2 (<a href="">#3319</a>)</li>
<li><a href=""><code>488c869</code></a> build(deps-dev): bump <code>@​types/node</code> from 18.19.48 to 18.19.50 (<a href="">#3320</a>)</li>
<li><a href=""><code>5354f85</code></a> docs: update readme</li>
<li>Additional commits viewable in <a href="https://github.com/peter-evans/create-pull-request/compare/v6...v7">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=peter-evans/create-pull-request&package-manager=github_actions&previous-version=6&new-version=7)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3b4ffcb638a8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.