# Issue

**Title:** Bump docker/setup-buildx-action from 2 to 3

## Description

[//]: # (dependabot-start)
⚠️  **Dependabot is rebasing this PR** ⚠️

Rebasing might not happen immediately, so don't worry if this takes some time.

Note: if you make any changes to this PR yourself, they will take precedence over the rebase.

---

[//]: # (dependabot-end)

Bumps [docker/setup-buildx-action](https://github.com/docker/setup-buildx-action) from 2 to 3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/setup-buildx-action/releases">docker/setup-buildx-action's releases</a>.</em></p>
<blockquote>
<h2>v3.0.0</h2>
<ul>
<li>Node 20 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.308.0">Actions Runner v2.308.0</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#264</a></li>
<li>Bump <code>@​actions/core</code> from 1.10.0 to 1.10.1 in <a href="">docker/setup-buildx-action#267</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v2.10.0...v3.0.0">https://github.com/docker/setup-buildx-action/compare/v2.10.0...v3.0.0</a></p>
<h2>v2.10.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.7.1 to 0.10.0 by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#258</a></li>
<li>Bump word-wrap from 1.2.3 to 1.2.5 in <a href="">docker/setup-buildx-action#253</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v2.9.1...v2.10.0">https://github.com/docker/setup-buildx-action/compare/v2.9.1...v2.10.0</a></p>
<h2>v2.9.1</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.7.0 to 0.7.1 in <a href="">docker/setup-buildx-action#248</a>
<ul>
<li>Fixes an issue where building Buildx does not match the local platform (<a href="">docker/actions-toolkit#135</a>)</li>
</ul>
</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v2.9.0...v2.9.1">https://github.com/docker/setup-buildx-action/compare/v2.9.0...v2.9.1</a></p>
<h2>v2.9.0</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.6.0 to 0.7.0 in <a href="">docker/setup-buildx-action#246</a>
<ul>
<li>Adds support to cache Buildx binary to hosted tool cache and GHA cache backend</li>
</ul>
</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v2.8.0...v2.9.0">https://github.com/docker/setup-buildx-action/compare/v2.8.0...v2.9.0</a></p>
<h2>v2.8.0</h2>
<ul>
<li>Only set specific flags for drivers supporting them by <a href="https://github.com/nicks"><code>@​nicks</code></a> in <a href="">docker/setup-buildx-action#241</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.5.0 to 0.6.0 in <a href="">docker/setup-buildx-action#242</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v2.7.0...v2.8.0">https://github.com/docker/setup-buildx-action/compare/v2.7.0...v2.8.0</a></p>
<h2>v2.7.0</h2>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.3.0 to 0.5.0 in <a href="">docker/setup-buildx-action#237</a> <a href="">docker/setup-buildx-action#238</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v2.6.0...v2.7.0">https://github.com/docker/setup-buildx-action/compare/v2.6.0...v2.7.0</a></p>
<h2>v2.6.0</h2>
<ul>
<li>Set node name for k8s driver when appending nodes by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#219</a></li>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.1.0-beta.18 to 0.3.0 in <a href="">docker/setup-buildx-action#220</a> <a href="">docker/setup-buildx-action#229</a> <a href="">docker/setup-buildx-action#231</a> <a href="">docker/setup-buildx-action#236</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v2.5.0...v2.6.0">https://github.com/docker/setup-buildx-action/compare/v2.5.0...v2.6.0</a></p>
<h2>v2.5.0</h2>
<ul>
<li><code>cleanup</code> input to remove builder and temp files by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#213</a></li>
<li>do not remove builder using the <code>docker</code> driver by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#218</a></li>
<li>fix current context as builder name for <code>docker</code> driver by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-buildx-action#209</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-buildx-action/compare/v2.4.1...v2.5.0">https://github.com/docker/setup-buildx-action/compare/v2.4.1...v2.5.0</a></p>
<h2>v2.4.1</h2>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f95db51</code></a> Merge pull request <a href="">#267</a> from docker/dependabot/npm_and_yarn/actions/core-1.10.1</li>
<li><a href=""><code>998a87c</code></a> chore: update generated content</li>
<li><a href=""><code>28bae59</code></a> build(deps): bump <code>@​actions/core</code> from 1.10.0 to 1.10.1</li>
<li><a href=""><code>c215341</code></a> Merge pull request <a href="">#264</a> from crazy-max/update-node20</li>
<li><a href=""><code>02e9319</code></a> chore: node 20 as default runtime</li>
<li><a href=""><code>5c9160e</code></a> chore: update generated content</li>
<li><a href=""><code>1283140</code></a> chore: fix author in package.json</li>
<li><a href=""><code>c6afe06</code></a> vendor: bump <code>@​docker/actions-toolkit</code> from 0.10.0 to 0.12.0</li>
<li><a href=""><code>f35e0d5</code></a> chore: update dev dependencies</li>
<li><a href=""><code>baeb468</code></a> dev: remove unneeded binaries</li>
<li>Additional commits viewable in <a href="https://github.com/docker/setup-buildx-action/compare/v2...v3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/setup-buildx-action&package-manager=github_actions&previous-version=2&new-version=3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a35b4e56fcb8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.