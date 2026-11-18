# Issue

**Title:** [dependabot]: Bump mistune from 3.2.1 to 3.3.0

## Description

Bumps [mistune](https://github.com/lepture/mistune) from 3.2.1 to 3.3.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/lepture/mistune/releases">mistune's releases</a>.</em></p>
<blockquote>
<h2>v3.3.0</h2>
<h3>   🐞 Bug Fixes</h3>
<ul>
<li>Resolve O(n^2) DoS in parse_link_text (CWE-400)  -  by <strong>bhanugoudm041</strong> <a href=""><!-- raw HTML omitted -->(b6b49)<!-- raw HTML omitted --></a></li>
<li>Resolve O(n^2) DoS in parse_link_text (CWE-400)-Type handling/testing done  -  by <strong>bhanugoudm041</strong> <a href=""><!-- raw HTML omitted -->(b3af8)<!-- raw HTML omitted --></a></li>
<li><strong>block</strong>: Avoid quadratic ref link scans  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(2b04d)<!-- raw HTML omitted --></a></li>
<li><strong>cli</strong>: Add entrypoint and utf-8 output  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(2f244)<!-- raw HTML omitted --></a></li>
<li><strong>directives</strong>: Constrain include targets  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(1bef3)<!-- raw HTML omitted --></a></li>
<li><strong>formatting</strong>: Avoid quadratic marker scans  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(96d0f)<!-- raw HTML omitted --></a></li>
<li><strong>image</strong>: Validate figure width option  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(e3e51)<!-- raw HTML omitted --></a></li>
<li><strong>inline</strong>: Avoid bracket parsing DoS  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(25f25)<!-- raw HTML omitted --></a></li>
<li><strong>math</strong>: Reject currency patterns and cross-line matches in inline math  -  by <a href="https://github.com/geopanther"><code>@​geopanther</code></a> <a href=""><!-- raw HTML omitted -->(566e1)<!-- raw HTML omitted --></a></li>
<li><strong>math</strong>: Support display and backtick math  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(1141e)<!-- raw HTML omitted --></a></li>
<li><strong>renderer</strong>: Render plugin list and table nodes  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(614b0)<!-- raw HTML omitted --></a></li>
<li><strong>renderer</strong>: Block encoded unsafe URL schemes  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(c7101)<!-- raw HTML omitted --></a></li>
<li><strong>toc</strong>: Avoid generated id collisions  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(c4093)<!-- raw HTML omitted --></a></li>
</ul>
<h3>   🏎 Performance</h3>
<ul>
<li>Improve performance  -  by <a href="https://github.com/lepture"><code>@​lepture</code></a> <a href=""><!-- raw HTML omitted -->(bf95c)<!-- raw HTML omitted --></a></li>
</ul>
<h5>    <a href="https://github.com/lepture/mistune/compare/v3.2.1...v3.3.0">View changes on GitHub</a></h5>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/lepture/mistune/blob/main/docs/changes.rst">mistune's changelog</a>.</em></p>
<blockquote>
<h2>Version 3.3.0</h2>
<p><strong>Released on Jun 21, 2026</strong></p>
<ul>
<li>Improve CommonMark compatibility and parser performance.</li>
<li>Add command line entrypoint with UTF-8 output.</li>
<li>Support display and backtick math.</li>
<li>Render plugin list and table nodes in Markdown renderer.</li>
<li>Escape leading block markers in Markdown renderer.</li>
<li>Fix RST renderer for block quotes nested in lists.</li>
<li>Avoid generated heading ID collisions in TOC.</li>
<li>Harden URL, image, figure, and include directive handling.</li>
<li>Fix quadratic scans in inline links, reference links, and formatting markers.</li>
<li>Fix math escaping, currency pattern matching, and cross-line matching.</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>15c3b79</code></a> chore: release 3.3.0</li>
<li><a href=""><code>bdc01ad</code></a> tests: increase run time on pypy</li>
<li><a href=""><code>7cf1814</code></a> tests: increase run time for pypy</li>
<li><a href=""><code>6dfdc3d</code></a> tests: add more tests</li>
<li><a href=""><code>17c50f6</code></a> chore: fix mypy issues</li>
<li><a href=""><code>63abe4b</code></a> chore: use ruff check and format</li>
<li><a href=""><code>e6c1b18</code></a> chore: resolve mypy issues</li>
<li><a href=""><code>dcf8902</code></a> test(math): cover escaped math output</li>
<li><a href=""><code>c4093c4</code></a> fix(toc): avoid generated id collisions</li>
<li><a href=""><code>e3e51de</code></a> fix(image): validate figure width option</li>
<li>Additional commits viewable in <a href="https://github.com/lepture/mistune/compare/v3.2.1...v3.3.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=mistune&package-manager=uv&previous-version=3.2.1&new-version=3.3.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f0782cdc0a40`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.