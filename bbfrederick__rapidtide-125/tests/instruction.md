# Issue

**Title:** Bump docker/build-push-action from 4 to 5

## Description

Bumps [docker/build-push-action](https://github.com/docker/build-push-action) from 4 to 5.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/docker/build-push-action/releases">docker/build-push-action's releases</a>.</em></p>
<blockquote>
<h2>v5.0.0</h2>
<ul>
<li>Node 20 as default runtime (requires <a href="https://github.com/actions/runner/releases/tag/v2.308.0">Actions Runner v2.308.0</a> or later) by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#954</a></li>
<li>Bump <code>@​actions/core</code> from 1.10.0 to 1.10.1 in <a href="">docker/build-push-action#959</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v4.2.1...v5.0.0">https://github.com/docker/build-push-action/compare/v4.2.1...v5.0.0</a></p>
<h2>v4.2.1</h2>
<blockquote>
<p><strong>Note</strong></p>
<p>Buildx v0.10 enables support for a minimal <a href="https://slsa.dev/provenance/">SLSA Provenance</a> attestation, which requires support for <a href="https://github.com/opencontainers/image-spec">OCI-compliant</a> multi-platform images. This may introduce issues with registry and runtime support (e.g. <a href="">Google Cloud Run and AWS Lambda</a>). You can optionally disable the default provenance attestation functionality using <code>provenance: false</code>.</p>
</blockquote>
<ul>
<li>warn if docker config can't be parsed by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#957</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v4.2.0...v4.2.1">https://github.com/docker/build-push-action/compare/v4.2.0...v4.2.1</a></p>
<h2>v4.2.0</h2>
<blockquote>
<p><strong>Note</strong></p>
<p>Buildx v0.10 enables support for a minimal <a href="https://slsa.dev/provenance/">SLSA Provenance</a> attestation, which requires support for <a href="https://github.com/opencontainers/image-spec">OCI-compliant</a> multi-platform images. This may introduce issues with registry and runtime support (e.g. <a href="">Google Cloud Run and AWS Lambda</a>). You can optionally disable the default provenance attestation functionality using <code>provenance: false</code>.</p>
</blockquote>
<ul>
<li>display proxy configuration  by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#872</a></li>
<li>chore(deps): Bump <code>@​docker/actions-toolkit</code> from 0.6.0 to 0.8.0 in <a href="">docker/build-push-action#930</a></li>
<li>chore(deps): Bump word-wrap from 1.2.3 to 1.2.5 in <a href="">docker/build-push-action#925</a></li>
<li>chore(deps): Bump semver from 6.3.0 to 6.3.1 in <a href="">docker/build-push-action#902</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v4.1.1...v4.2.0">https://github.com/docker/build-push-action/compare/v4.1.1...v4.2.0</a></p>
<h2>v4.1.1</h2>
<blockquote>
<p><strong>Note</strong></p>
<p>Buildx v0.10 enables support for a minimal <a href="https://slsa.dev/provenance/">SLSA Provenance</a> attestation, which requires support for <a href="https://github.com/opencontainers/image-spec">OCI-compliant</a> multi-platform images. This may introduce issues with registry and runtime support (e.g. <a href="">Google Cloud Run and AWS Lambda</a>). You can optionally disable the default provenance attestation functionality using <code>provenance: false</code>.</p>
</blockquote>
<ul>
<li>Bump <code>@​docker/actions-toolkit</code> from 0.3.0 to 0.5.0 by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#880</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v4.1.0...v4.1.1">https://github.com/docker/build-push-action/compare/v4.1.0...v4.1.1</a></p>
<h2>v4.1.0</h2>
<blockquote>
<p><strong>Note</strong></p>
<p>Buildx v0.10 enables support for a minimal <a href="https://slsa.dev/provenance/">SLSA Provenance</a> attestation, which requires support for <a href="https://github.com/opencontainers/image-spec">OCI-compliant</a> multi-platform images. This may introduce issues with registry and runtime support (e.g. <a href="">Google Cloud Run and AWS Lambda</a>). You can optionally disable the default provenance attestation functionality using <code>provenance: false</code>.</p>
</blockquote>
<ul>
<li>Switch to actions-toolkit implementation by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#811</a>  <a href="">docker/build-push-action#838</a> <a href="">docker/build-push-action#855</a> <a href="">docker/build-push-action#860</a> <a href="">docker/build-push-action#875</a></li>
<li>e2e: quay.io by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#799</a> <a href="">docker/build-push-action#805</a></li>
<li>e2e: local harbor and nexus by <a href="https://github.com/crazy-max"><code>@​crazy-max</code></a> in <a href="">docker/build-push-action#800</a></li>
<li>e2e: add artifactory container registry to test against by <a href="https://github.com/jedevc"><code>@​jedevc</code></a> in <a href="">docker/build-push-action#804</a></li>
<li>e2e: add distribution tests by <a href="https://github.com/jedevc"><code>@​jedevc</code></a> in <a href="">docker/build-push-action#814</a> <a href="">docker/build-push-action#815</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/docker/build-push-action/compare/v4.0.0...v4.1.0">https://github.com/docker/build-push-action/compare/v4.0.0...v4.1.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0565240</code></a> Merge pull request <a href="">#959</a> from docker/dependabot/npm_and_yarn/actions/core-1.10.1</li>
<li><a href=""><code>3ab07f8</code></a> chore: update generated content</li>
<li><a href=""><code>b9e7e4d</code></a> chore(deps): Bump <code>@​actions/core</code> from 1.10.0 to 1.10.1</li>
<li><a href=""><code>04d1a3b</code></a> Merge pull request <a href="">#954</a> from crazy-max/update-node20</li>
<li><a href=""><code>1a4d1a1</code></a> chore: node 20 as default runtime</li>
<li><a href=""><code>675965c</code></a> chore: update generated content</li>
<li><a href=""><code>58ee34c</code></a> chore: fix author in package.json</li>
<li><a href=""><code>c97c406</code></a> fix ProxyConfig type when checking length</li>
<li><a href=""><code>47d5369</code></a> vendor: bump <code>@​docker/actions-toolkit</code> from 0.8.0 to 0.12.0</li>
<li><a href=""><code>8895c74</code></a> chore: update dev dependencies</li>
<li>Additional commits viewable in <a href="https://github.com/docker/build-push-action/compare/v4...v5">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=docker/build-push-action&package-manager=github_actions&previous-version=4&new-version=5)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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