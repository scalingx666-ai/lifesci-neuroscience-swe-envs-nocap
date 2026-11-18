# Issue

**Title:** Bump actions/stale from 5 to 8

## Description

Bumps [actions/stale](https://github.com/actions/stale) from 5 to 8.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/stale/releases">actions/stale's releases</a>.</em></p>
<blockquote>
<h2>v8.0.0</h2>
<p>:warning: This version contains breaking changes :warning:</p>
<h2>What's Changed</h2>
<ul>
<li>New option labels-to-remove-when-stale enables users to specify list of comma delimited labels that will be removed when the issue or PR becomes stale by <a href="https://github.com/panticmilos"><code>@​panticmilos</code></a> <a href="">actions/stale#770</a></li>
<li>Skip deleting the branch in the upstream of a forked repo by <a href="https://github.com/dsame"><code>@​dsame</code></a> <a href="">actions/stale#913</a></li>
<li>abort the build on the error by <a href="https://github.com/dsame"><code>@​dsame</code></a> in <a href="">actions/stale#935</a></li>
</ul>
<h2>Breaking Changes</h2>
<ul>
<li>In this release we prevent scenarios when the build is not interrupted on some exceptions, which led to successful builds when they are supposed to fail</li>
</ul>
<h2>Example</h2>
<pre lang="yaml"><code>name: 'Remove labels when the issue or PR becomes stale'
on:
  schedule:
    - cron: '30 1 * * *'
<p>permissions:
pull-requests: write</p>
<p>jobs:
stale:
runs-on: ubuntu-latest
steps:
- uses: actions/stale@v8
with:
labels-to-remove-when-stale: 'label1,label2'
</code></pre></p>
<h2>v7.0.0</h2>
<p>⚠️ This version contains breaking changes ⚠️</p>
<h2>What's Changed</h2>
<ul>
<li>Allow daysBeforeStale options to be float by <a href="https://github.com/irega"><code>@​irega</code></a> in <a href="">actions/stale#841</a></li>
<li>Use cache in check-dist.yml by <a href="https://github.com/jongwooo"><code>@​jongwooo</code></a> in <a href="">actions/stale#876</a></li>
<li>fix print outputs step in existing workflows by <a href="https://github.com/irega"><code>@​irega</code></a> in <a href="">actions/stale#859</a></li>
<li>Update issue and PR templates, add/delete workflow files by <a href="https://github.com/IvanZosimov"><code>@​IvanZosimov</code></a> in <a href="">actions/stale#880</a></li>
<li>Update how stale handles exempt items by <a href="https://github.com/johnsudol"><code>@​johnsudol</code></a> in <a href="">actions/stale#874</a></li>
</ul>
<h2>Breaking Changes</h2>
<ul>
<li>In this release we prevent this action from managing the <code>stale</code> label on items included in <code>exempt-issue-labels</code> and <code>exempt-pr-labels</code></li>
<li>We decided that this is outside of the scope of this action, and to be left up to the maintainer</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/irega"><code>@​irega</code></a> made their first contribution in <a href="">actions/stale#841</a></li>
<li><a href="https://github.com/jongwooo"><code>@​jongwooo</code></a> made their first contribution in <a href="">actions/stale#876</a></li>
<li><a href="https://github.com/IvanZosimov"><code>@​IvanZosimov</code></a> made their first contribution in <a href="">actions/stale#880</a></li>
<li><a href="https://github.com/johnsudol"><code>@​johnsudol</code></a> made their first contribution in <a href="">actions/stale#874</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/stale/blob/main/CHANGELOG.md">actions/stale's changelog</a>.</em></p>
<blockquote>
<h1>Changelog</h1>
<h1>[7.0.0]</h1>
<p>:warning: Breaking change :warning:</p>
<ul>
<li>Allow daysBeforeStale options to be float by <a href="https://github.com/irega"><code>@​irega</code></a> in <a href="">actions/stale#841</a></li>
<li>Use cache in check-dist.yml by <a href="https://github.com/jongwooo"><code>@​jongwooo</code></a> in <a href="">actions/stale#876</a></li>
<li>fix print outputs step in existing workflows by <a href="https://github.com/irega"><code>@​irega</code></a> in <a href="">actions/stale#859</a></li>
<li>Update issue and PR templates, add/delete workflow files by <a href="https://github.com/IvanZosimov"><code>@​IvanZosimov</code></a> in <a href="">actions/stale#880</a></li>
<li>Update how stale handles exempt items by <a href="https://github.com/johnsudol"><code>@​johnsudol</code></a> in <a href="">actions/stale#874</a></li>
</ul>
<h1>[6.0.1]</h1>
<p>Update <code>@​actions/core</code> to v1.10.0 (<a href="">#839</a>)</p>
<h1>[6.0.0]</h1>
<p>:warning: Breaking change :warning:</p>
<p>Issues/PRs default <code>close-issue-reason</code> is now <code>not_planned</code>(<a href="">#789</a>)</p>
<h1>[5.1.0]</h1>
<p><a href="">Don't process stale issues right after they're marked stale</a>
[Add close-issue-reason option]<a href="">#764</a><a href="">#772</a>
Various dependabot/dependency updates</p>
<h2><a href="https://github.com/actions/stale/compare/v3.0.19...v4.1.0">4.1.0</a> (2021-07-14)</h2>
<h2>Features</h2>
<ul>
<li><a href="">Ability to exempt draft PRs</a></li>
</ul>
<h2><a href="https://github.com/actions/stale/compare/v3.0.19...v4.0.0">4.0.0</a> (2021-07-14)</h2>
<h3>Features</h3>
<ul>
<li><strong>options:</strong> simplify config by removing skip stale message options (<a href="">#457</a>) (<a href="">6ec637d</a>), closes <a href="">#405</a> <a href="">#455</a></li>
<li><strong>output:</strong> print output parameters (<a href="">#458</a>) (<a href="">3e6d35b</a>)</li>
</ul>
<h3>Bug Fixes</h3>
<ul>
<li><strong>dry-run:</strong> forbid mutations in dry-run (<a href="">#500</a>) (<a href="">f1017f3</a>), closes <a href="">#499</a></li>
<li><strong>logs:</strong> coloured logs (<a href="">#465</a>) (<a href="">5fbbfba</a>)</li>
<li><strong>operations:</strong> fail fast the current batch to respect the operations limit (<a href="">#474</a>) (<a href="">5f6f311</a>), closes <a href="">#466</a></li>
<li><strong>label comparison</strong>: make label comparison case insensitive <a href="">#517</a>, closes <a href="">#516</a></li>
<li><strong>filtering comments by actor could have strange behavior</strong>: &quot;stale&quot; comments are now detected based on if the message is the stale message not <em>who</em> made the comment(<a href="">#519</a>), fixes <a href="">#441</a>, <a href="">#509</a>, <a href="">#518</a></li>
</ul>
<h3>Breaking Changes</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1160a22</code></a> Merge pull request <a href="">#965</a> from actions/dependabot/npm_and_yarn/prettier-2.8.6</li>
<li><a href=""><code>5f7b396</code></a> build(deps-dev): bump prettier from 2.8.4 to 2.8.6</li>
<li><a href=""><code>b002e7e</code></a> Merge pull request <a href="">#941</a> from panticmilos/vmpantic/rebuild-dist-vercel-bump</li>
<li><a href=""><code>5290373</code></a> Rebuild dist after rebase</li>
<li><a href=""><code>b006677</code></a> Merge pull request <a href="">#962</a> from actions/dependabot/npm_and_yarn/jest-and-types/j...</li>
<li><a href=""><code>4f29769</code></a> Merge pull request <a href="">#961</a> from actions/dependabot/npm_and_yarn/typescript-5.0.2</li>
<li><a href=""><code>83453dd</code></a> build(deps-dev): bump jest and <code>@​types/jest</code></li>
<li><a href=""><code>79e8c04</code></a> Merge pull request <a href="">#960</a> from actions/dependabot/npm_and_yarn/types/node-18.15.3</li>
<li><a href=""><code>75d4d95</code></a> Remove labels on stale (<a href="">#959</a>)</li>
<li><a href=""><code>fac2d41</code></a> build(deps-dev): bump typescript from 4.9.4 to 5.0.2</li>
<li>Additional commits viewable in <a href="https://github.com/actions/stale/compare/v5...v8">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/stale&package-manager=github_actions&previous-version=5&new-version=8)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `b26115f061bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.