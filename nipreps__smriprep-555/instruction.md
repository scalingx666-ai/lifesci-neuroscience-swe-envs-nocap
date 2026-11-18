# Issue

**Title:** build(deps): bump docker/build-push-action from 6.18.0 to 6.19.2

## Description

Bumps [docker/build-push-action](https://github.com/docker/build-push-action) from 6.18.0 to 6.19.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/build-push-action/releases">docker/build-push-action's releases</a>.</em></p>
<blockquote>
<h2>v6.19.2</h2>
<ul>
<li>Preserve port in <code>GIT_AUTH_TOKEN</code> host by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1458</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.19.1...v6.19.2">https://github.com/docker/build-push-action/compare/v6.19.1...v6.19.2</a></p>
<h2>v6.19.1</h2>
<ul>
<li>Derive <code>GIT_AUTH_TOKEN</code> host from GitHub server URL by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1456</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.19.0...v6.19.1">https://github.com/docker/build-push-action/compare/v6.19.0...v6.19.1</a></p>
<h2>v6.19.0</h2>
<ul>
<li>Scope default git auth token to <code>github.com</code> by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#1451</a></li>
<li>Bump brace-expansion from 1.1.11 to 1.1.12 in <a href="">docker/build-push-action#1396</a></li>
<li>Bump form-data from 2.5.1 to 2.5.5 in <a href="">docker/build-push-action#1391</a></li>
<li>Bump js-yaml from 3.14.1 to 3.14.2 in <a href="">docker/build-push-action#1429</a></li>
<li>Bump lodash from 4.17.21 to 4.17.23 in <a href="">docker/build-push-action#1446</a></li>
<li>Bump tmp from 0.2.3 to 0.2.4 in <a href="">docker/build-push-action#1398</a></li>
<li>Bump undici from 5.28.4 to 5.29.0 in <a href="">docker/build-push-action#1397</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v6.18.0...v6.19.0">https://github.com/docker/build-push-action/compare/v6.18.0...v6.19.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>10e90e3</code></a> Merge pull request <a href="">#1458</a> from crazy-max/git-auth-port</li>
<li><a href=""><code>5262538</code></a> chore: update generated content</li>
<li><a href=""><code>cd130e4</code></a> preserve port in GIT_AUTH_TOKEN host</li>
<li><a href=""><code>806c751</code></a> Merge pull request <a href="">#1452</a> from crazy-max/update-yarn</li>
<li><a href=""><code>601a80b</code></a> Merge pull request <a href="">#1456</a> from crazy-max/auth-token-dyn-host</li>
<li><a href=""><code>8f7fd7c</code></a> chore: update generated content</li>
<li><a href=""><code>710e335</code></a> derive GIT_AUTH_TOKEN host from GitHub server URL</li>
<li><a href=""><code>c4ca848</code></a> update yarn to 4.9.2</li>
<li><a href=""><code>ee4ca42</code></a> Merge pull request <a href="">#1398</a> from docker/dependabot/npm_and_yarn/tmp-0.2.4</li>
<li><a href=""><code>f1b3bb5</code></a> chore: update generated content</li>
<li>Additional commits viewable in <a href="https://github.com/docker/build-push-action/compare/263435318d21b8e681c14492fe198d362a7d2c83...10e90e3645eae34f1e60eeb005ba3a3d33f178e8">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/build-push-action&package-manager=github_actions&previous-version=6.18.0&new-version=6.19.2)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `e8c2180d0779`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.