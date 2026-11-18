# Issue

**Title:** Bump docker/build-push-action from 6.15.0 to 6.18.0

## Description

Bumps [docker/build-push-action](https://github.com/docker/build-push-action) from 6.15.0 to 6.18.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/build-push-action/releases">docker/build-push-action's releases</a>.</em></p>
<blockquote>
<h2>v6.18.0</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.61.0 to 0.62.1 in <a href="">docker/build-push-action#1381</a></li>
</ul>
<blockquote>
<p>[!NOTE]
<a href="https://docs.docker.com/build/ci/github-actions/build-summary/">Build summary</a> is now supported with <a href="https://docs.docker.com/build-cloud/">Docker Build Cloud</a>.</p>
</blockquote>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.17.0...v6.18.0">https://github.com/docker/build-push-action/compare/v6.17.0...v6.18.0</a></p>
<h2>v6.17.0</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.59.0 to 0.61.0 by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1364</a></li>
</ul>
<blockquote>
<p>[!NOTE]
Build record is now exported using the <a href="https://docs.docker.com/reference/cli/docker/buildx/history/export/"><code>buildx history export</code></a> command instead of the legacy export-build tool.</p>
</blockquote>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.16.0...v6.17.0">https://github.com/docker/build-push-action/compare/v6.16.0...v6.17.0</a></p>
<h2>v6.16.0</h2>
<ul>
<li>Handle no default attestations env var by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1343</a></li>
<li>Only print secret keys in build summary output by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1353</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.56.0 to 0.59.0 in <a href="">docker/build-push-action#1352</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.15.0...v6.16.0">https://github.com/docker/build-push-action/compare/v6.15.0...v6.16.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2634353</code></a> Merge pull request <a href="">#1381</a> from docker/dependabot/npm_and_yarn/docker/actions-t...</li>
<li><a href=""><code>c0432d2</code></a> chore: update generated content</li>
<li><a href=""><code>0bb1f27</code></a> set builder driver and endpoint attributes for dbc summary support</li>
<li><a href=""><code>5f9dbf9</code></a> chore(deps): Bump <code>@​docker/actions-toolkit</code> from 0.61.0 to 0.62.1</li>
<li><a href=""><code>0788c44</code></a> Merge pull request <a href="">#1375</a> from crazy-max/remove-gcr</li>
<li><a href=""><code>aa179ca</code></a> e2e: remove GCR</li>
<li><a href=""><code>1dc7386</code></a> Merge pull request <a href="">#1364</a> from crazy-max/history-export-cmd</li>
<li><a href=""><code>9c9803f</code></a> chore: update generated content</li>
<li><a href=""><code>db1f6c4</code></a> DOCKER_BUILD_EXPORT_LEGACY env var to opt-in for legacy export</li>
<li><a href=""><code>721e8c7</code></a> Bump <code>@​docker/actions-toolkit</code> from 0.59.0 to 0.61.0</li>
<li>Additional commits viewable in <a href="https://github.com/docker/build-push-action/compare/471d1dc4e07e5cdedd4c2171150001c434f0b7a4...263435318d21b8e681c14492fe198d362a7d2c83">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/build-push-action&package-manager=github_actions&previous-version=6.15.0&new-version=6.18.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `923d8828b735`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.