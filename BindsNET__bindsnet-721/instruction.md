# Issue

**Title:** Bump pillow from 11.2.1 to 11.3.0

## Description

Bumps [pillow](https://github.com/python-pillow/Pillow) from 11.2.1 to 11.3.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/python-pillow/Pillow/releases">pillow's releases</a>.</em></p>
<blockquote>
<h2>11.3.0</h2>
<p><a href="https://pillow.readthedocs.io/en/stable/releasenotes/11.3.0.html">https://pillow.readthedocs.io/en/stable/releasenotes/11.3.0.html</a></p>
<h2>Deprecations</h2>
<ul>
<li>Deprecate fromarray mode argument <a href="">#9018</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Deprecate saving I mode images as PNG <a href="">#9023</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Documentation</h2>
<ul>
<li>Added release notes for <a href="">#9041</a> <a href="">#9042</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Add release notes for <a href="">#8912</a> and <a href="">#8969</a> <a href="">#9019</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>ImageFont does not handle multiline text <a href="">#9000</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated Ubuntu CI targets <a href="">#8988</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update MinGW package names <a href="">#8987</a> [<a href="https://github.com/H4M5TER"><code>@​H4M5TER</code></a>]</li>
<li>Updated docstring <a href="">#8943</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Mention that tobytes() with the raw encoder uses Pack.c <a href="">#8878</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Refactor docs <code>Makefile</code> <a href="">#8933</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Add template for quarterly release issue <a href="">#8932</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Add list of third party plugins <a href="">#8910</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update redirected URL <a href="">#8919</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Docs: use sentence case for headers <a href="">#8914</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Docs: remove unused Makefile targets <a href="">#8917</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Remove indentation from lists <a href="">#8915</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Python 3.13 is tested on Arch <a href="">#8894</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Move XV Thumbnails to read only section <a href="">#8893</a> [<a href="https://github.com/aclark4life"><code>@​aclark4life</code></a>]</li>
<li>Updated macOS tested Pillow versions <a href="">#8890</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Dependencies</h2>
<ul>
<li>Add AVIF to wheels using only aomenc and dav1d AVIF codecs for reduced size <a href="">#8858</a> [<a href="https://github.com/fdintino"><code>@​fdintino</code></a>]</li>
<li>Use same AVIF URL when fetching dependency <a href="">#8871</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update dependency mypy to v1.16.1 <a href="">#9026</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Update libpng to 1.6.49 <a href="">#9014</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update dependency cibuildwheel to v3 <a href="">#9010</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Updated libjpeg-turbo to 3.1.1 <a href="">#9009</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update dependency mypy to v1.16.0 <a href="">#8991</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Updated libpng to 1.6.48 <a href="">#8940</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated Ghostscript to 10.5.1 <a href="">#8939</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated harfbuzz to 11.2.1 <a href="">#8937</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Updated libavif to 1.3.0 <a href="">#8949</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update dependency cibuildwheel to v2.23.3 <a href="">#8931</a> [@<a href="https://github.com/apps/renovate">renovate[bot]</a>]</li>
<li>Updated harfbuzz to 11.1.0 <a href="">#8904</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<h2>Testing</h2>
<ul>
<li>Add <code>match</code> parameter to <code>pytest.warns()</code> <a href="">#9038</a> [<a href="https://github.com/hugovk"><code>@​hugovk</code></a>]</li>
<li>Increase pytest verbosity <a href="">#9040</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Improve SgiImagePlugin test coverage <a href="">#8896</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
<li>Update ruff pre-commit ID <a href="">#8994</a> [<a href="https://github.com/radarhere"><code>@​radarhere</code></a>]</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>89f1f46</code></a> 11.3.0 version bump</li>
<li><a href=""><code>f2de251</code></a> Updated check script paths (<a href="">#9052</a>)</li>
<li><a href=""><code>84855d1</code></a> Raise FileNotFoundError when opening an empty path (<a href="">#9048</a>)</li>
<li><a href=""><code>204d11d</code></a> Raise FileNotFoundError when opening an empty path</li>
<li><a href=""><code>2b39f75</code></a> Handle IPTC TIFF tags with incorrect type (<a href="">#8925</a>)</li>
<li><a href=""><code>e7a53ba</code></a> Do not update palette for L mode GIF frame (<a href="">#8924</a>)</li>
<li><a href=""><code>c22230b</code></a> Use save parameters as encoderinfo defaults (<a href="">#9001</a>)</li>
<li><a href=""><code>da10ed1</code></a> Add support for iOS (<a href="">#9030</a>)</li>
<li><a href=""><code>be2b4e7</code></a> Fix qtables and quality scaling (<a href="">#8879</a>)</li>
<li><a href=""><code>d4162f8</code></a> Updated return type</li>
<li>Additional commits viewable in <a href="https://github.com/python-pillow/Pillow/compare/11.2.1...11.3.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=pillow&package-manager=pip&previous-version=11.2.1&new-version=11.3.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1c8cb829c662`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.