# Issue

**Title:** Bump actions/stale from 8 to 9

## Description

Bumps [actions/stale](https://github.com/actions/stale) from 8 to 9.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/stale/releases">actions/stale's releases</a>.</em></p>
<blockquote>
<h2>v9.0.0</h2>
<h2>Breaking Changes</h2>
<ol>
<li>Action is now stateful: If the action ends because of <a href="https://github.com/actions/stale#operations-per-run">operations-per-run</a> then the next run will start from the first unprocessed issue skipping the issues processed during the previous run(s). The state is reset when all the issues are processed. This should be considered for scheduling workflow runs.</li>
<li>Version 9 of this action updated the runtime to Node.js 20. All scripts are now run with Node.js 20 instead of Node.js 16 and are affected by any breaking changes between Node.js 16 and 20.</li>
</ol>
<h2>What Else Changed</h2>
<ol>
<li>Performance optimization that removes unnecessary API calls by <a href="https://github.com/dsame"><code>@​dsame</code></a> <a href="">#1033</a> fixes <a href="">#792</a></li>
<li>Logs displaying current github API rate limit by <a href="https://github.com/dsame"><code>@​dsame</code></a> <a href="">#1032</a> addresses <a href="">#1029</a></li>
</ol>
<p>For more information, please read the <a href="https://github.com/actions/stale#readme">action documentation</a> and its <a href="https://github.com/actions/stale#statefulness">section about statefulness</a></p>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/jmeridth"><code>@​jmeridth</code></a> made their first contribution in <a href="">actions/stale#984</a></li>
<li><a href="https://github.com/nikolai-laevskii"><code>@​nikolai-laevskii</code></a> made their first contribution in <a href="">actions/stale#1020</a></li>
<li><a href="https://github.com/dusan-trickovic"><code>@​dusan-trickovic</code></a> made their first contribution in <a href="">actions/stale#1056</a></li>
<li><a href="https://github.com/aparnajyothi-y"><code>@​aparnajyothi-y</code></a> made their first contribution in <a href="">actions/stale#1110</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/stale/compare/v8...v9.0.0">https://github.com/actions/stale/compare/v8...v9.0.0</a></p>
</blockquote>
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
<li><a href=""><code>28ca103</code></a> Upgrade Node to v20 (<a href="">#1110</a>)</li>
<li><a href=""><code>b69b346</code></a> build(deps-dev): bump <code>@​types/node</code> from 18.16.18 to 20.5.1 (<a href="">#1079</a>)</li>
<li><a href=""><code>88a6f4f</code></a> build(deps-dev): bump typescript from 5.1.3 to 5.2.2 (<a href="">#1083</a>)</li>
<li><a href=""><code>796531a</code></a> Merge pull request <a href="">#1080</a> from akv-platform/fix-delete-cache</li>
<li><a href=""><code>8986f62</code></a> Don not try to delete cache if it does not exists</li>
<li><a href=""><code>cab99b3</code></a> fix typo proceeded/processed</li>
<li><a href=""><code>184e7af</code></a> Merge pull request <a href="">#1064</a> from actions/dependabot/npm_and_yarn/typescript-esli...</li>
<li><a href=""><code>523885c</code></a> chore: update eslint-plugin, parser and eslint-plugin-jest</li>
<li><a href=""><code>2487a1d</code></a> build(deps-dev): bump <code>@​typescript-eslint/eslint-plugin</code></li>
<li><a href=""><code>60c722e</code></a> Merge pull request <a href="">#1063</a> from actions/dependabot/npm_and_yarn/jest-29.6.2</li>
<li>Additional commits viewable in <a href="https://github.com/actions/stale/compare/v8...v9">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/stale&package-manager=github_actions&previous-version=8&new-version=9)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e9879f6a5784`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.