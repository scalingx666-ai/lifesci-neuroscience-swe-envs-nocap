# Issue

**Title:** Bump the python group with 3 updates

## Description

Bumps the python group with 3 updates: [certifi](https://github.com/certifi/python-certifi), [pyzotero](https://github.com/urschrei/pyzotero) and [rich](https://github.com/Textualize/rich).

Updates `certifi` from 2026.1.4 to 2026.2.25
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8571a4b</code></a> 2026.02.25 (<a href="">#395</a>)</li>
<li><a href=""><code>6f7de00</code></a> Bump peter-evans/create-pull-request from 8.0.0 to 8.1.0 (<a href="">#390</a>)</li>
<li><a href=""><code>a1de59b</code></a> Bump actions/checkout from 6.0.1 to 6.0.2 (<a href="">#391</a>)</li>
<li><a href=""><code>7f5ade5</code></a> Bump actions/setup-python from 6.1.0 to 6.2.0 (<a href="">#392</a>)</li>
<li>See full diff in <a href="https://github.com/certifi/python-certifi/compare/2026.01.04...2026.02.25">compare view</a></li>
</ul>
</details>
<br />

Updates `pyzotero` from 1.8.0 to 1.10.0
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>d8f3b55</code></a> Version bump</li>
<li><a href=""><code>d02ad3f</code></a> Bump h11 from 0.14.0 to 0.16.0</li>
<li><a href=""><code>8d438e9</code></a> Bump urllib3 from 2.5.0 to 2.6.3</li>
<li><a href=""><code>4f1e173</code></a> Add an MCP server</li>
<li><a href=""><code>e6e0b42</code></a> Add typing</li>
<li><a href=""><code>dff738e</code></a> Add new CLI commands: item, children, tags, subset, doiindex, fulltext</li>
<li>See full diff in <a href="https://github.com/urschrei/pyzotero/compare/v1.8.0...v1.10.0">compare view</a></li>
</ul>
</details>
<br />

Updates `rich` from 14.3.2 to 14.3.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/Textualize/rich/releases">rich's releases</a>.</em></p>
<blockquote>
<h2>The infinite Release</h2>
<p>Fixed a infinite loop in split_graphemes</p>
<h2>[14.3.3] - 2026-02-19</h2>
<h3>Fixed</h3>
<ul>
<li>Fixed infinite loop with <code>cells.split_graphemes</code> <a href="">Textualize/rich#4006</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/Textualize/rich/blob/master/CHANGELOG.md">rich's changelog</a>.</em></p>
<blockquote>
<h2>[14.3.3] - 2026-02-19</h2>
<h3>Fixed</h3>
<ul>
<li>Fixed infinite loop with <code>cells.split_graphemes</code> <a href="">Textualize/rich#4006</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ce01188</code></a> Merge pull request <a href="">#4008</a> from Textualize/bump1433</li>
<li><a href=""><code>14a47c9</code></a> bump</li>
<li><a href=""><code>f54bfe0</code></a> Merge pull request <a href="">#4007</a> from Textualize/copilot/sub-pr-4006</li>
<li><a href=""><code>7338cb9</code></a> Merge pull request <a href="">#4006</a> from Textualize/fix-grapheme-stuck</li>
<li><a href=""><code>905b397</code></a> Update tests/test_cells.py</li>
<li><a href=""><code>b031dca</code></a> Update tests/test_cells.py</li>
<li><a href=""><code>f07a3fc</code></a> Add regression tests for VS16 after zero-width chars in split_graphemes</li>
<li><a href=""><code>b618ccc</code></a> spelling</li>
<li><a href=""><code>378c34b</code></a> Initial plan</li>
<li><a href=""><code>87e7ca2</code></a> refinements, and tests</li>
<li>Additional commits viewable in <a href="https://github.com/Textualize/rich/compare/v14.3.2...v14.3.3">compare view</a></li>
</ul>
</details>
<br />

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
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--808.org.readthedocs.build/en/808/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `2b8ee34d179b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.