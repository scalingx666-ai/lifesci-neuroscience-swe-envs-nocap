# Issue

**Title:** Bump pillow from 12.2.0 to 12.3.0

## Description

Bumps [pillow](https://github.com/python-pillow/Pillow) from 12.2.0 to 12.3.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>12.3.0</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/12.3.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/12.3.0.html</a></p>
<h2>Removals</h2>
<ul>
<li>Remove non-image ImageCms modes <a href="">#9697</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Documentation</h2>
<ul>
<li>Add release notes for SBOM and performance improvements <a href="">#9747</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Add security release notes <a href="">#9741</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Add release notes for Python 3.15 beta wheels <a href="">#9696</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>ImageFont can also be used with ImageText <a href="">#9597</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Additional guidelines for security reports <a href="">#9659</a> [<a href="https://github.com/wiredfool"><code>@​wiredfool</code></a>]</li>
<li>Fixed typo <a href="">#9636</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Added CVEs to 12.2.0 release notes <a href="">#9591</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Revise development support information in README <a href="">#9583</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Add INCIDENT_RESPONSE.md <a href="">#9555</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Add STRIDE threat model to security docs <a href="">#9562</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Add CVEs to 12.2.0 release notes <a href="">#9556</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update README with revised security policy <a href="">#9553</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update security policy <a href="">#9552</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Update macOS tested Python versions <a href="">#9534</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Dependencies</h2>
<ul>
<li>Update dependency harfbuzz to v14.2.1 <a href="">#9720</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency mypy to v2 <a href="">#9653</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency cibuildwheel to v4 <a href="">#9665</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update github-actions <a href="">#9655</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency libavif to v1.4.2 <a href="">#9652</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency lcms2 to v2.19.1 <a href="">#9651</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency check-jsonschema to v0.37.2 <a href="">#9650</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update google/oss-fuzz digest to d872252 <a href="">#9614</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency lcms2 to v2.19 <a href="">#9609</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency libpng to v1.6.58 - autoclosed <a href="">#9608</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency harfbuzz to v14 <a href="">#9610</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency mypy to v1.20.2 <a href="">#9599</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update github-actions <a href="">#9611</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update dependency cibuildwheel to v3.4.1 <a href="">#9607</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Move dependency versions to single JSON and enable Renovate <a href="">#9559</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Updated raqm to 0.10.5 <a href="">#9557</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update dependency cibuildwheel to v3.4.0 <a href="">#9532</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
</ul>
<h2>Testing</h2>
<ul>
<li>Remove matrix.os from benchmark <a href="">#9735</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Remove references to libavif patch <a href="">#9734</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Add benchmark tests <a href="">#9654</a> [<a href="https://github.com/akx"><code>@​akx</code></a>]</li>
<li>Use reshape() instead of setting NumPy array shape directly <a href="">#9728</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bb1d8e8</code></a> 12.3.0 version bump</li>
<li><a href=""><code>e63fc48</code></a> Add release notes for SBOM and performance improvements (<a href="">#9747</a>)</li>
<li><a href=""><code>13b701b</code></a> Add release notes for <a href="">#9679</a></li>
<li><a href=""><code>5564ca7</code></a> List methods</li>
<li><a href=""><code>a0920fd</code></a> Speed up ImageChops operations (<a href="">#9738</a>)</li>
<li><a href=""><code>07e9a6c</code></a> Speed up <code>Image.filter()</code> (<a href="">#9736</a>)</li>
<li><a href=""><code>a94578c</code></a> Speed up <code>Image.getchannel()</code>, <code>Image.merge()</code>, <code>Image.putalpha()</code> and `Image...</li>
<li><a href=""><code>53e02c4</code></a> Speed up <code>Image.fill()</code>, <code>Image.linear_gradient()</code> and `Image.radial_gradient...</li>
<li><a href=""><code>af03747</code></a> Speed up <code>Image.resample()</code> (<a href="">#9739</a>)</li>
<li><a href=""><code>5c9ca56</code></a> Speed up <code>alpha_composite</code>, <code>matrix</code>, <code>negative</code>, <code>quantize</code> (<a href="">#9740</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python-pillow/Pillow/compare/12.2.0...12.3.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pillow&package-manager=uv&previous-version=12.2.0&new-version=12.3.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/psychopy/psychopy/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `93776dd8ff10`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.