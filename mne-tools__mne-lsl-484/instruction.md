# Issue

**Title:** Bump actions/download-artifact from 5 to 6

## Description

Bumps [actions/download-artifact](https://github.com/actions/download-artifact) from 5 to 6.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/download-artifact/releases">actions/download-artifact's releases</a>.</em></p>
<blockquote>
<h2>v6.0.0</h2>
<h2>What's Changed</h2>
<p><strong>BREAKING CHANGE:</strong> this update supports Node <code>v24.x</code>. This is not a breaking change per-se but we're treating it as such.</p>
<ul>
<li>Update README for download-artifact v5 changes by <a href="https://github.com/yacaovsnc"><code>@​yacaovsnc</code></a> in <a href="">actions/download-artifact#417</a></li>
<li>Update README with artifact extraction details by <a href="https://github.com/yacaovsnc"><code>@​yacaovsnc</code></a> in <a href="">actions/download-artifact#424</a></li>
<li>Readme: spell out the first use of GHES by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#431</a></li>
<li>Bump <code>@actions/artifact</code> to <code>v4.0.0</code></li>
<li>Prepare <code>v6.0.0</code> by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#438</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> made their first contribution in <a href="">actions/download-artifact#431</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/download-artifact/compare/v5...v6.0.0">https://github.com/actions/download-artifact/compare/v5...v6.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>018cc2c</code></a> Merge pull request <a href="">#438</a> from actions/danwkennedy/prepare-6.0.0</li>
<li><a href=""><code>815651c</code></a> Revert &quot;Remove <code>github.dep.yml</code>&quot;</li>
<li><a href=""><code>bb3a066</code></a> Remove <code>github.dep.yml</code></li>
<li><a href=""><code>fa1ce46</code></a> Prepare <code>v6.0.0</code></li>
<li><a href=""><code>4a24838</code></a> Merge pull request <a href="">#431</a> from danwkennedy/patch-1</li>
<li><a href=""><code>5e3251c</code></a> Readme: spell out the first use of GHES</li>
<li><a href=""><code>abefc31</code></a> Merge pull request <a href="">#424</a> from actions/yacaovsnc/update_readme</li>
<li><a href=""><code>ac43a60</code></a> Update README with artifact extraction details</li>
<li><a href=""><code>de96f46</code></a> Merge pull request <a href="">#417</a> from actions/yacaovsnc/update_readme</li>
<li><a href=""><code>7993cb4</code></a> Remove migration guide for artifact download changes</li>
<li>Additional commits viewable in <a href="https://github.com/actions/download-artifact/compare/v5...v6">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=actions/download-artifact&package-manager=github_actions&previous-version=5&new-version=6)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `624f06530dc2`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.