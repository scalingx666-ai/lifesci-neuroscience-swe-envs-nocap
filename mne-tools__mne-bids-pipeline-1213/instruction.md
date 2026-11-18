# Issue

**Title:** [dependabot]: Bump pillow from 12.1.1 to 12.2.0

## Description

Bumps [pillow](https://github.com/python-pillow/Pillow) from 12.1.1 to 12.2.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>12.2.0</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/12.2.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/12.2.0.html</a></p>
<h2>Documentation</h2>
<ul>
<li>Update 12.2.0 release notes <a href="">#9522</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Add loader plugins: AMOS abk, Atari Degas, 40+ more obscure formats via Netpbm <a href="">#9482</a> [<a href="https://github.com/bitplane"><code>@​bitplane</code></a>]</li>
<li>Update Python versions <a href="">#9515</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Jeffrey A. Clark -&gt; Jeffrey 'Alex' Clark <a href="">#9513</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Add release notes for <a href="">#9394</a>, <a href="">#9419</a> and <a href="">#9456</a> <a href="">#9467</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Add Amiga Workbench .info loader to 3rd party plugins list <a href="">#9459</a> [<a href="https://github.com/bitplane"><code>@​bitplane</code></a>]</li>
<li>Merge PFM documentation into PPM <a href="">#9434</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update macOS tested Pillow versions <a href="">#9431</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Fix CVE number <a href="">#9430</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
</ul>
<h2>Dependencies</h2>
<ul>
<li>Update xz to 5.8.3 <a href="">#9523</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update libjpeg-turbo to 3.1.4.1 <a href="">#9507</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update libpng to 1.6.56 <a href="">#9499</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update freetype to 2.14.3 <a href="">#9485</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated libavif to 1.4.1 <a href="">#9479</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated harfbuzz to 13.2.1 <a href="">#9461</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update Ghostscript to 10.7.0 <a href="">#9469</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update harfbuzz to 13.0.1 <a href="">#9453</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update libavif to 1.4.0 <a href="">#9460</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update freetype to 2.14.2 <a href="">#9449</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update actions/download-artifact action to v8 <a href="">#9451</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Updated libpng to 1.6.55 <a href="">#9425</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Testing</h2>
<ul>
<li>Cleanup .spider extension in the same test where it is added <a href="">#9517</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Run tests in parallel via tox for 3.5x speedup <a href="">#9516</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Enable colour in CI logs <a href="">#9486</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Update Ghostscript to 10.7.0 <a href="">#9469</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Simplify TGA test code <a href="">#9477</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update tests to check for ValueError when encoding an empty image <a href="">#9464</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Upgrade CI from <code>macos-15-intel</code> to <code>macos-26-intel</code> <a href="">#9454</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Add check-case-conflict hook <a href="">#9446</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Specify platform when pulling docker image <a href="">#9440</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>GHA: Cache libavif and webp builds for Ubuntu <a href="">#9437</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Update macOS tested Pillow versions <a href="">#9431</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Other changes</h2>
<ul>
<li>Check calloc return value <a href="">#9527</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Check all allocs in the Arrow tree <a href="">#9488</a> [<a href="https://github.com/wiredfool"><code>@​wiredfool</code></a>]</li>
<li>Reject non-numeric elements inside list coords <a href="">#9526</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Move variable declaration inside define <a href="">#9525</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3c41c09</code></a> 12.2.0 version bump</li>
<li><a href=""><code>cdaa29e</code></a> Check calloc return value (<a href="">#9527</a>)</li>
<li><a href=""><code>585b2f5</code></a> Check calloc return value</li>
<li><a href=""><code>ecf011e</code></a> Check all allocs in the Arrow tree (<a href="">#9488</a>)</li>
<li><a href=""><code>cf6de8c</code></a> Reject non-numeric elements inside list coords (<a href="">#9526</a>)</li>
<li><a href=""><code>ffdcede</code></a> Update 12.2.0 release notes (<a href="">#9522</a>)</li>
<li><a href=""><code>7929d77</code></a> Added security release notes (<a href="">#149</a>)</li>
<li><a href=""><code>c4f7aa5</code></a> Added security release notes</li>
<li><a href=""><code>22cdb5f</code></a> Move variable declaration inside define (<a href="">#9525</a>)</li>
<li><a href=""><code>fc15b3b</code></a> Resize tall images vertically first (<a href="">#9524</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python-pillow/Pillow/compare/12.1.1...12.2.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pillow&package-manager=uv&previous-version=12.1.1&new-version=12.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/mne-tools/mne-bids-pipeline/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3600937b5e37`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.