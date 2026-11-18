# Issue

**Title:** chore(actions): bump docker/build-push-action from 6.19.2 to 7.4.0

## Description

Bumps [docker/build-push-action](https://github.com/docker/build-push-action) from 6.19.2 to 7.4.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/build-push-action/releases">docker/build-push-action's releases</a>.</em></p>
<blockquote>
<h2>v7.4.0</h2>
<ul>
<li>Use the shared error helper for Buildx commands by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1620</a></li>
<li>Prevent workflow command injection in metadata logs by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1617</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.92.0 to 0.100.0 in <a href="">docker/build-push-action#1614</a> <a href="">docker/build-push-action#1618</a> <a href="">docker/build-push-action#1621</a></li>
<li>Bump <code>@​humanfs/node</code> from 0.16.7 to 0.16.8 in <a href="">docker/build-push-action#1609</a></li>
<li>Bump brace-expansion from 1.1.13 to 1.1.18 in <a href="">docker/build-push-action#1592</a></li>
<li>Bump csv-parse from 7.0.0 to 7.0.2 in <a href="">docker/build-push-action#1613</a></li>
<li>Bump js-yaml from 4.3.0 to 4.3.2 in <a href="">docker/build-push-action#1605</a> <a href="">docker/build-push-action#1615</a></li>
<li>Bump nanoid from 3.3.16 to 3.3.18 in <a href="">docker/build-push-action#1611</a></li>
<li>Bump postcss from 8.5.10 to 8.5.25 in <a href="">docker/build-push-action#1590</a></li>
<li>Bump postcss-selector-parser from 7.1.1 to 7.1.5 in <a href="">docker/build-push-action#1606</a></li>
<li>Bump sigstore from 4.1.0 to 4.1.1 in <a href="">docker/build-push-action#1577</a></li>
<li>Bump undici from 6.27.0 to 6.28.0 in <a href="">docker/build-push-action#1594</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v7.3.0...v7.4.0">https://github.com/docker/build-push-action/compare/v7.3.0...v7.4.0</a></p>
<h2>v7.3.0</h2>
<ul>
<li>Preserve names in esbuild bundle by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1567</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.90.0 to 0.92.0 in <a href="">docker/build-push-action#1545</a> <a href="">docker/build-push-action#1572</a></li>
<li>Bump <code>@​sigstore/core</code> from 3.1.0 to 3.2.1 in <a href="">docker/build-push-action#1568</a></li>
<li>Bump js-yaml from 4.1.1 to 4.3.0 in <a href="">docker/build-push-action#1566</a></li>
<li>Bump tmp from 0.2.5 to 0.2.7 in <a href="">docker/build-push-action#1547</a></li>
<li>Bump undici from 6.24.1 to 6.27.0 in <a href="">docker/build-push-action#1564</a></li>
<li>Bump vite from 7.3.2 to 7.3.6 in <a href="">docker/build-push-action#1563</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v7.2.0...v7.3.0">https://github.com/docker/build-push-action/compare/v7.2.0...v7.3.0</a></p>
<h2>v7.2.0</h2>
<ul>
<li>Bump <code>@​actions/core</code> from 3.0.0 to 3.0.1 in <a href="">docker/build-push-action#1525</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.87.0 to 0.90.0 in <a href="">docker/build-push-action#1517</a></li>
<li>Bump brace-expansion from 2.0.2 to 5.0.6 in <a href="">docker/build-push-action#1534</a></li>
<li>Bump fast-xml-builder from 1.1.4 to 1.2.0 in <a href="">docker/build-push-action#1529</a></li>
<li>Bump fast-xml-parser from 5.5.7 to 5.8.0 in <a href="">docker/build-push-action#1521</a></li>
<li>Bump postcss from 8.5.6 to 8.5.10 in <a href="">docker/build-push-action#1526</a></li>
<li>Bump tar from 6.2.1 to 7.5.15 in <a href="">docker/build-push-action#1533</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v7.1.0...v7.2.0">https://github.com/docker/build-push-action/compare/v7.1.0...v7.2.0</a></p>
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
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c3c9e26</code></a> Merge pull request <a href="">#1621</a> from docker/dependabot/npm_and_yarn/docker/actions-t...</li>
<li><a href=""><code>459b674</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>4dedcb2</code></a> chore(deps): Bump <code>@​docker/actions-toolkit</code> from 0.99.0 to 0.100.0</li>
<li><a href=""><code>379bf63</code></a> Merge pull request <a href="">#1620</a> from crazy-max/buildx-error-message</li>
<li><a href=""><code>9877975</code></a> chore: update generated content</li>
<li><a href=""><code>7ed0556</code></a> use the shared Buildx error summary helper</li>
<li><a href=""><code>91670ba</code></a> Merge pull request <a href="">#1618</a> from docker/dependabot/npm_and_yarn/docker/actions-t...</li>
<li><a href=""><code>80dbc86</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>50cac3a</code></a> chore(deps): Bump <code>@​docker/actions-toolkit</code> from 0.98.0 to 0.99.0</li>
<li><a href=""><code>03b4d6c</code></a> Merge pull request <a href="">#1617</a> from crazy-max/fix-metadata-workflow-commands</li>
<li>Additional commits viewable in <a href="https://github.com/docker/build-push-action/compare/10e90e3645eae34f1e60eeb005ba3a3d33f178e8...c3c9e263c25d99ce0380d002d59b67737d91b0dc">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/build-push-action&package-manager=github_actions&previous-version=6.19.2&new-version=7.4.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4a0630baeb83`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.