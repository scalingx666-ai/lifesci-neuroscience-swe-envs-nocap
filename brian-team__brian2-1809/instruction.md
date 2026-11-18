# Issue

**Title:** Bump docker/setup-qemu-action from 3.7.0 to 4.0.0

## Description

Bumps [docker/setup-qemu-action](https://github.com/docker/setup-qemu-action) from 3.7.0 to 4.0.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/setup-qemu-action/releases">docker/setup-qemu-action's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<ul>
<li>Node 24 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.327.1">Actions Runner v2.327.1</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-qemu-action#245</a></li>
<li>Switch to ESM and update config/test wiring by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-qemu-action#241</a></li>
<li>Bump <code>@​actions/core</code> from 1.11.1 to 3.0.0 in <a href="">docker/setup-qemu-action#244</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.67.0 to 0.77.0 in <a href="">docker/setup-qemu-action#243</a></li>
<li>Bump <code>@​isaacs/brace-expansion</code> from 5.0.0 to 5.0.1 in <a href="">docker/setup-qemu-action#240</a></li>
<li>Bump js-yaml from 3.14.1 to 3.14.2 in <a href="">docker/setup-qemu-action#231</a></li>
<li>Bump lodash from 4.17.21 to 4.17.23 in <a href="">docker/setup-qemu-action#238</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-qemu-action/compare/v3.7.0...v4.0.0">https://github.com/docker/setup-qemu-action/compare/v3.7.0...v4.0.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ce36039</code></a> Merge pull request <a href="">#245</a> from crazy-max/node24</li>
<li><a href=""><code>6386344</code></a> node 24 as default runtime</li>
<li><a href=""><code>1ea3db7</code></a> Merge pull request <a href="">#243</a> from docker/dependabot/npm_and_yarn/docker/actions-to...</li>
<li><a href=""><code>b56a002</code></a> chore: update generated content</li>
<li><a href=""><code>c43f02d</code></a> build(deps): bump <code>@​docker/actions-toolkit</code> from 0.67.0 to 0.77.0</li>
<li><a href=""><code>ce10c58</code></a> Merge pull request <a href="">#244</a> from docker/dependabot/npm_and_yarn/actions/core-3.0.0</li>
<li><a href=""><code>429fc9d</code></a> chore: update generated content</li>
<li><a href=""><code>060e5f8</code></a> build(deps): bump <code>@​actions/core</code> from 1.11.1 to 3.0.0</li>
<li><a href=""><code>44be13e</code></a> Merge pull request <a href="">#231</a> from docker/dependabot/npm_and_yarn/js-yaml-3.14.2</li>
<li><a href=""><code>1897438</code></a> chore: update generated content</li>
<li>Additional commits viewable in <a href="https://github.com/docker/setup-qemu-action/compare/c7c53464625b32c7a7e944ae62b3e17d2b600130...ce360397dd3f832beb865e1373c09c0e9f86d70a">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/setup-qemu-action&package-manager=github_actions&previous-version=3.7.0&new-version=4.0.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a5eccc280cdc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.