# Issue

**Title:** Bump docker/setup-qemu-action from 2 to 3

## Description

Bumps [docker/setup-qemu-action](https://github.com/docker/setup-qemu-action) from 2 to 3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/setup-qemu-action/releases">docker/setup-qemu-action's releases</a>.</em></p>
<blockquote>
<h2>v3.0.0</h2>
<ul>
<li>Node 20 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.308.0">Actions Runner v2.308.0</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-qemu-action#102</a></li>
<li>Bump <code>@​actions/core</code> from 1.10.0 to 1.10.1 in <a href="">docker/setup-qemu-action#103</a></li>
<li>Bump semver from 6.3.0 to 6.3.1 in <a href="">docker/setup-qemu-action#89</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-qemu-action/compare/v2.2.0...v3.0.0">https://github.com/docker/setup-qemu-action/compare/v2.2.0...v3.0.0</a></p>
<h2>v2.2.0</h2>
<ul>
<li>Trim off spaces in <code>platforms</code> input by <a href="https://github.com/Chocobo1"><code>@​Chocobo1</code></a> in <a href="">docker/setup-qemu-action#64</a></li>
<li>Switch to actions-toolkit implementation by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/setup-qemu-action#70</a> <a href="">docker/setup-qemu-action#80</a> <a href="">docker/setup-qemu-action#83</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-qemu-action/compare/v2.1.0...v2.2.0">https://github.com/docker/setup-qemu-action/compare/v2.1.0...v2.2.0</a></p>
<h2>v2.1.0</h2>
<ul>
<li>Use context for inputs by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="">#62</a>)</li>
<li>Use built-in <code>getExecOutput</code> by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="">#61</a>)</li>
<li>Remove workaround for <code>setOutput</code> by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> (<a href="">#63</a>)</li>
<li>Bump <code>@​actions/core</code> from 1.6.0 to 1.10.0 (<a href="">#54</a> <a href="">#58</a> <a href="">#59</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/setup-qemu-action/compare/v2.0.0...v2.1.0">https://github.com/docker/setup-qemu-action/compare/v2.0.0...v2.1.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6882732</code></a> Merge pull request <a href="">#103</a> from docker/dependabot/npm_and_yarn/actions/core-1.10.1</li>
<li><a href=""><code>183f4af</code></a> chore: update generated content</li>
<li><a href=""><code>f174935</code></a> build(deps): bump <code>@​actions/core</code> from 1.10.0 to 1.10.1</li>
<li><a href=""><code>2e423eb</code></a> Merge pull request <a href="">#89</a> from docker/dependabot/npm_and_yarn/semver-6.3.1</li>
<li><a href=""><code>ecc406a</code></a> Bump semver from 6.3.0 to 6.3.1</li>
<li><a href=""><code>12dec5e</code></a> Merge pull request <a href="">#102</a> from crazy-max/update-node20</li>
<li><a href=""><code>c29b312</code></a> chore: node 20 as default runtime</li>
<li><a href=""><code>34ae628</code></a> chore: update generated content</li>
<li><a href=""><code>1f3d2e1</code></a> chore: fix author in package.json</li>
<li><a href=""><code>277dbe8</code></a> vendor: bump <code>@​docker/actions-toolkit</code> from 0.3.0 to 0.12.0</li>
<li>Additional commits viewable in <a href="https://github.com/docker/setup-qemu-action/compare/v2...v3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/setup-qemu-action&package-manager=github_actions&previous-version=2&new-version=3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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