# Issue

**Title:** Bump mistune from 3.2.0 to 3.2.1

## Description

Bumps [mistune](https://github.com/lepture/mistune) from 3.2.0 to 3.2.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/lepture/mistune/releases">mistune's releases</a>.</em></p>
<blockquote>
<h2>v3.2.1</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li>Resolve Windows compatibility issues in file inclusion and tests  -  by <a href="https://github.com/Yuki9814"><code>@​Yuki9814</code></a> <a href=""><!-- raw HTML omitted -->(25471)<!-- raw HTML omitted --></a></li>
<li>Escape html text  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(a3cb6)<!-- raw HTML omitted --></a></li>
<li>Update link reference  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(85eb5)<!-- raw HTML omitted --></a></li>
<li>Handle escaped dollar signs in inline math  -  by <a href="https://github.com/saschabuehrle"><code>@​saschabuehrle</code></a> in <a href="">lepture/mistune#370</a> <a href=""><!-- raw HTML omitted -->(7bd57)<!-- raw HTML omitted --></a></li>
<li>Escape id of toc  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(04880)<!-- raw HTML omitted --></a></li>
<li>Escape id of headings  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(28556)<!-- raw HTML omitted --></a></li>
<li>Remove double-encoding of image alt text  -  by <a href="https://github.com/lawrence3699"><code>@​lawrence3699</code></a> <a href=""><!-- raw HTML omitted -->(0d6f3)<!-- raw HTML omitted --></a></li>
<li>Escape xml for math plugin  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(5fa09)<!-- raw HTML omitted --></a></li>
<li>Use strict regex for image's height and width  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(8d0cb)<!-- raw HTML omitted --></a></li>
</ul>
<h5>    <a href="https://github.com/lepture/mistune/compare/v3.2.0...v3.2.1">View changes on GitHub</a></h5>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/lepture/mistune/blob/main/docs/changes.rst">mistune's changelog</a>.</em></p>
<blockquote>
<h2>Version 3.2.1</h2>
<p><strong>Released on May 3, 2026</strong></p>
<ul>
<li>Escape link in <code>render_toc_ul</code>.</li>
<li>Escape text in math plugin.</li>
<li>Fix regex for math plugin.</li>
<li>Escape heading's ID attribute.</li>
<li>Fix <code>LINK_TITLE_RE</code> to prevent DoS.</li>
<li>Escape class attribute for admonition directive.</li>
<li>Remove double-encoding of image alt text.</li>
<li>Escape class attribute for image directive.</li>
<li>Fix width/height attribute for image directive.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>067f908</code></a> chore: release 3.2.1</li>
<li><a href=""><code>bf55030</code></a> Merge pull request <a href="">#438</a> from saschabuehrle/fix/issue-370</li>
<li><a href=""><code>8d0cb75</code></a> fix: use strict regex for image's height and width</li>
<li><a href=""><code>5fa092e</code></a> fix: escape xml for math plugin</li>
<li><a href=""><code>71ec947</code></a> Merge pull request <a href="">#440</a> from lawrence3699/fix/image-alt-double-encoding</li>
<li><a href=""><code>0d6f3d8</code></a> fix: remove double-encoding of image alt text</li>
<li><a href=""><code>2855622</code></a> fix: escape id of headings</li>
<li><a href=""><code>04880a0</code></a> fix: escape id of toc</li>
<li><a href=""><code>7bd5709</code></a> fix: handle escaped dollar signs in inline math (fixes <a href="">#370</a>)</li>
<li><a href=""><code>85eb54f</code></a> fix: update link reference</li>
<li>Additional commits viewable in <a href="https://github.com/lepture/mistune/compare/v3.2.0...v3.2.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=mistune&package-manager=uv&previous-version=3.2.0&new-version=3.2.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/waltsims/k-wave-python/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76a79816681e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.