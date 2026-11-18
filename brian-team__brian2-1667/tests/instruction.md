# Issue

**Title:** chore(deps): bump docker/metadata-action from 5.7.0 to 5.8.0

## Description

Bumps [docker/metadata-action](https://github.com/docker/metadata-action) from 5.7.0 to 5.8.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/metadata-action/releases">docker/metadata-action's releases</a>.</em></p>
<blockquote>
<h2>v5.8.0</h2>
<ul>
<li>New <code>is_not_default_branch</code> global expression by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/metadata-action#535</a></li>
<li>Allow to match part of the git tag or value for semver/pep440 types by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/metadata-action#536</a> <a href="">docker/metadata-action#537</a></li>
<li>Bump <code>@​actions/github</code> from 6.0.0 to 6.0.1 in <a href="">docker/metadata-action#523</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.56.0 to 0.62.1 in <a href="">docker/metadata-action#526</a></li>
<li>Bump form-data from 2.5.1 to 2.5.5 in <a href="">docker/metadata-action#533</a></li>
<li>Bump moment-timezone from 0.5.47 to 0.6.0 in <a href="">docker/metadata-action#525</a></li>
<li>Bump semver from 7.7.1 to 7.7.2 in <a href="">docker/metadata-action#524</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v5.7.0...v5.8.0">https://github.com/docker/metadata-action/compare/v5.7.0...v5.8.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c1e5197</code></a> Merge pull request <a href="">#537</a> from crazy-max/pep440-match</li>
<li><a href=""><code>89dd65a</code></a> chore: update generated content</li>
<li><a href=""><code>699ee45</code></a> allow to match part of the git tag or value for pep440 type</li>
<li><a href=""><code>e0542a6</code></a> Merge pull request <a href="">#536</a> from crazy-max/semver-match</li>
<li><a href=""><code>b7facdf</code></a> chore: update generated content</li>
<li><a href=""><code>81c60df</code></a> allow to match part of the git tag or value for semver type</li>
<li><a href=""><code>de11195</code></a> Merge pull request <a href="">#535</a> from crazy-max/not_def_branch</li>
<li><a href=""><code>2f9c64b</code></a> Merge pull request <a href="">#533</a> from docker/dependabot/npm_and_yarn/form-data-2.5.5</li>
<li><a href=""><code>510f746</code></a> chore: update generated content</li>
<li><a href=""><code>2bc3f4e</code></a> is_not_default_branch global expression</li>
<li>Additional commits viewable in <a href="https://github.com/docker/metadata-action/compare/902fa8ec7d6ecbf8d84d538b9b233a880e428804...c1e51972afc2121e065aed6d45c65596fe445f3f">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/metadata-action&package-manager=github_actions&previous-version=5.7.0&new-version=5.8.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `aca83f0b7794`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.