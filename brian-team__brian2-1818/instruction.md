# Issue

**Title:** Bump docker/build-push-action from 6.19.2 to 7.1.0

## Description

Bumps [docker/build-push-action](https://github.com/docker/build-push-action) from 6.19.2 to 7.1.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/build-push-action/releases">docker/build-push-action's releases</a>.</em></p>
<blockquote>
<h2>v7.1.0</h2>
<ul>
<li>Git context <a href="https://docs.docker.com/build/concepts/context/#url-queries">query format</a> support by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1505</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.79.0 to 0.87.0 by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1505</a></li>
<li>Bump brace-expansion from 1.1.12 to 1.1.13 in <a href="">docker/build-push-action#1500</a></li>
<li>Bump fast-xml-parser from 5.4.2 to 5.5.7 in <a href="">docker/build-push-action#1489</a></li>
<li>Bump flatted from 3.3.3 to 3.4.2 in <a href="">docker/build-push-action#1491</a></li>
<li>Bump glob from 10.3.12 to 10.5.0 in <a href="">docker/build-push-action#1490</a></li>
<li>Bump handlebars from 4.7.8 to 4.7.9 in <a href="">docker/build-push-action#1497</a></li>
<li>Bump lodash from 4.17.23 to 4.18.1 in <a href="">docker/build-push-action#1510</a></li>
<li>Bump picomatch from 4.0.3 to 4.0.4 in <a href="">docker/build-push-action#1496</a></li>
<li>Bump undici from 6.23.0 to 6.24.1 in <a href="">docker/build-push-action#1486</a></li>
<li>Bump vite from 7.3.1 to 7.3.2 in <a href="">docker/build-push-action#1509</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v7.0.0...v7.1.0">https://github.com/docker/build-push-action/compare/v7.0.0...v7.1.0</a></p>
<h2>v7.0.0</h2>
<ul>
<li>Node 24 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.327.1">Actions Runner v2.327.1</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1470</a></li>
<li>Remove deprecated <code>DOCKER_BUILD_NO_SUMMARY</code> and <code>DOCKER_BUILD_EXPORT_RETENTION_DAYS</code> envs by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1473</a></li>
<li>Remove legacy export-build tool support for build summary by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1474</a></li>
<li>Switch to ESM and update config/test wiring by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1466</a></li>
<li>Bump <code>@​actions/core</code> from 1.11.1 to 3.0.0 in <a href="">docker/build-push-action#1454</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.62.1 to 0.79.0 in <a href="">docker/build-push-action#1453</a> <a href="">docker/build-push-action#1472</a> <a href="">docker/build-push-action#1479</a></li>
<li>Bump minimatch from 3.1.2 to 3.1.5 in <a href="">docker/build-push-action#1463</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.19.2...v7.0.0">https://github.com/docker/build-push-action/compare/v6.19.2...v7.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bcafcac</code></a> Merge pull request <a href="">#1509</a> from docker/dependabot/npm_and_yarn/vite-7.3.2</li>
<li><a href=""><code>18e62f1</code></a> Merge pull request <a href="">#1510</a> from docker/dependabot/npm_and_yarn/lodash-4.18.1</li>
<li><a href=""><code>46580d2</code></a> chore: update generated content</li>
<li><a href=""><code>3f80b25</code></a> chore(deps): Bump lodash from 4.17.23 to 4.18.1</li>
<li><a href=""><code>efeec95</code></a> Merge pull request <a href="">#1505</a> from crazy-max/refactor-git-context</li>
<li><a href=""><code>ddf04b0</code></a> Merge pull request <a href="">#1511</a> from docker/dependabot/github_actions/crazy-max-dot-...</li>
<li><a href=""><code>db08d97</code></a> chore(deps): Bump the crazy-max-dot-github group with 2 updates</li>
<li><a href=""><code>ef1fb96</code></a> Merge pull request <a href="">#1508</a> from docker/dependabot/github_actions/docker/login-a...</li>
<li><a href=""><code>2d8f2a1</code></a> chore: update generated content</li>
<li><a href=""><code>919ac7b</code></a> fix test since secrets are not written to temp path anymore</li>
<li>Additional commits viewable in <a href="https://github.com/docker/build-push-action/compare/10e90e3645eae34f1e60eeb005ba3a3d33f178e8...bcafcacb16a39f128d818304e6c9c0c18556b85f">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/build-push-action&package-manager=github_actions&previous-version=6.19.2&new-version=7.1.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `65f2d1c0ea8e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.