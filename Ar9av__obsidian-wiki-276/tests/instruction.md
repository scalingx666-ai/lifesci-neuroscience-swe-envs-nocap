# Issue

**Title:** chore(actions): bump docker/metadata-action from 5.10.0 to 6.2.0

## Description

Bumps [docker/metadata-action](https://github.com/docker/metadata-action) from 5.10.0 to 6.2.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/metadata-action/releases">docker/metadata-action's releases</a>.</em></p>
<blockquote>
<h2>v6.2.0</h2>
<ul>
<li>Preserve names in esbuild bundle by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/metadata-action#689</a></li>
<li>Bump <code>@​actions/core</code> from 3.0.0 to 3.0.1 in <a href="">docker/metadata-action#663</a></li>
<li>Bump <code>@​actions/github</code> from 9.0.0 to 9.1.1 in <a href="">docker/metadata-action#666</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.90.0 to 0.92.0 in <a href="">docker/metadata-action#672</a> <a href="">docker/metadata-action#696</a></li>
<li>Bump <code>@​sigstore/core</code> from 3.1.0 to 3.2.1 in <a href="">docker/metadata-action#690</a></li>
<li>Bump <code>@​sigstore/verify</code> from 3.1.0 to 3.1.1 in <a href="">docker/metadata-action#693</a></li>
<li>Bump csv-parse from 6.2.1 to 7.0.0 in <a href="">docker/metadata-action#683</a></li>
<li>Bump js-yaml from 4.1.1 to 4.3.0 in <a href="">docker/metadata-action#688</a></li>
<li>Bump moment-timezone from 0.6.1 to 0.6.2 in <a href="">docker/metadata-action#664</a></li>
<li>Bump semver from 7.7.4 to 7.8.5 in <a href="">docker/metadata-action#665</a> <a href="">docker/metadata-action#695</a></li>
<li>Bump sigstore from 4.1.0 to 4.1.1 in <a href="">docker/metadata-action#694</a></li>
<li>Bump tmp from 0.2.5 to 0.2.7 in <a href="">docker/metadata-action#673</a></li>
<li>Bump undici from 6.25.0 to 6.27.0 in <a href="">docker/metadata-action#686</a></li>
<li>Bump vite from 7.3.2 to 7.3.6 in <a href="">docker/metadata-action#685</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v6.1.0...v6.2.0">https://github.com/docker/metadata-action/compare/v6.1.0...v6.2.0</a></p>
<h2>v6.1.0</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.79.0 to 0.90.0 in <a href="">docker/metadata-action#613</a></li>
<li>Bump brace-expansion from 1.1.12 to 5.0.6 in <a href="">docker/metadata-action#658</a> <a href="">docker/metadata-action#630</a></li>
<li>Bump csv-parse from 6.1.0 to 6.2.1 in <a href="">docker/metadata-action#617</a></li>
<li>Bump fast-xml-parser from 5.4.2 to 5.8.0 in <a href="">docker/metadata-action#620</a></li>
<li>Bump flatted from 3.3.3 to 3.4.2 in <a href="">docker/metadata-action#623</a></li>
<li>Bump glob from 10.3.15 to 10.5.0 in <a href="">docker/metadata-action#621</a></li>
<li>Bump handlebars from 4.7.8 to 4.7.9 in <a href="">docker/metadata-action#629</a></li>
<li>Bump lodash from 4.17.23 to 4.18.1 in <a href="">docker/metadata-action#639</a></li>
<li>Bump moment-timezone from 0.6.0 to 0.6.1 in <a href="">docker/metadata-action#619</a></li>
<li>Bump picomatch from 4.0.3 to 4.0.4 in <a href="">docker/metadata-action#626</a></li>
<li>Bump postcss from 8.5.6 to 8.5.10 in <a href="">docker/metadata-action#649</a></li>
<li>Bump tar from 6.2.1 to 7.5.15 in <a href="">docker/metadata-action#657</a></li>
<li>Bump undici from 6.23.0 to 6.25.0 in <a href="">docker/metadata-action#614</a></li>
<li>Bump vite from 7.3.1 to 7.3.2 in <a href="">docker/metadata-action#637</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v6.0.0...v6.1.0">https://github.com/docker/metadata-action/compare/v6.0.0...v6.1.0</a></p>
<h2>v6.0.0</h2>
<ul>
<li>Node 24 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.327.1">Actions Runner v2.327.1</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/metadata-action#605</a></li>
<li>List inputs now preserve <code>#</code> inside values while still supporting full-line <code>#</code> comments by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/metadata-action#607</a></li>
<li>Switch to ESM and update config/test wiring by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/metadata-action#602</a></li>
<li>Bump lodash from 4.17.21 to 4.17.23 in <a href="">docker/metadata-action#588</a></li>
<li>Bump <code>@​actions/core</code> from 1.11.1 to 3.0.0 in <a href="">docker/metadata-action#599</a></li>
<li>Bump <code>@​actions/github</code> from 6.0.1 to 9.0.0 in <a href="">docker/metadata-action#597</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.68.0 to 0.79.0 in <a href="">docker/metadata-action#604</a></li>
<li>Bump <code>@​isaacs/brace-expansion</code> from 5.0.0 to 5.0.1 in <a href="">docker/metadata-action#600</a></li>
<li>Bump semver from 7.7.3 to 7.7.4 in <a href="">docker/metadata-action#603</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/metadata-action/compare/v5.10.0...v6.0.0">https://github.com/docker/metadata-action/compare/v5.10.0...v6.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>dc80280</code></a> Merge pull request <a href="">#696</a> from docker/dependabot/npm_and_yarn/docker/actions-to...</li>
<li><a href=""><code>2b9fe83</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>8128ce3</code></a> chore(deps): Bump <code>@​docker/actions-toolkit</code> from 0.91.0 to 0.92.0</li>
<li><a href=""><code>1d1c895</code></a> Merge pull request <a href="">#695</a> from docker/dependabot/npm_and_yarn/semver-7.8.5</li>
<li><a href=""><code>7f0c2dd</code></a> Merge pull request <a href="">#694</a> from docker/dependabot/npm_and_yarn/sigstore-4.1.1</li>
<li><a href=""><code>025f8c5</code></a> [dependabot skip] chore: update generated content</li>
<li><a href=""><code>e98d63c</code></a> chore(deps): Bump semver from 7.8.1 to 7.8.5</li>
<li><a href=""><code>37d9379</code></a> chore(deps): Bump sigstore from 4.1.0 to 4.1.1</li>
<li><a href=""><code>a1b8072</code></a> Merge pull request <a href="">#690</a> from docker/dependabot/npm_and_yarn/sigstore/core-3.2.1</li>
<li><a href=""><code>e0e3381</code></a> [dependabot skip] chore: update generated content</li>
<li>Additional commits viewable in <a href="https://github.com/docker/metadata-action/compare/c299e40c65443455700f0fdfc63efafe5b349051...dc802804100637a589fabce1cb79ff13a1411302">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/metadata-action&package-manager=github_actions&previous-version=5.10.0&new-version=6.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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