# Issue

**Title:** Bump the npm group with 5 updates

## Description

[//]: # (dependabot-start)
⚠️  **Dependabot is rebasing this PR** ⚠️

Rebasing might not happen immediately, so don't worry if this takes some time.

Note: if you make any changes to this PR yourself, they will take precedence over the rebase.

---

[//]: # (dependabot-end)

Bumps the npm group with 5 updates:

| Package | From | To |
| --- | --- | --- |
| [remark-cli](https://github.com/remarkjs/remark) | `9.0.0` | `12.0.1` |
| [remark-gfm](https://github.com/remarkjs/remark-gfm) | `1.0.0` | `4.0.1` |
| [remark-lint-no-trailing-spaces](https://github.com/Trott/remark-lint-no-trailing-spaces) | `2.0.1` | `3.0.2` |
| [remark-preset-lint-markdown-style-guide](https://github.com/remarkjs/remark-lint) | `4.0.0` | `6.0.1` |
| [remark-preset-lint-recommended](https://github.com/remarkjs/remark-lint) | `5.0.0` | `7.0.1` |

Updates `remark-cli` from 9.0.0 to 12.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/remarkjs/remark/releases">remark-cli's releases</a>.</em></p>
<blockquote>
<h2>remark-cli@12.0.1</h2>
<ul>
<li>a185821b Update internal <code>import-meta-resolve</code></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/remarkjs/remark/compare/remark-cli@12.0.0...remark-cli@12.0.1">https://github.com/remarkjs/remark/compare/remark-cli@12.0.0...remark-cli@12.0.1</a></p>
<h2>remark-cli@12.0.0</h2>
<p>(see <a href="https://github.com/remarkjs/remark/releases/tag/15.0.0"><code>15.0.0</code></a>)</p>
<h2>remark-cli@11.0.0</h2>
<ul>
<li>145019c4 Update <code>unified-args</code>
<strong>breaking</strong>: remove support for Node 12
tiny chance of breaking: this adheres properly to YAML 1.2
tiny chance of breaking: this matches modern node in how to resolve plugins
by <a href="https://github.com/remcohaszing"><code>@​remcohaszing</code></a> in <a href="">remarkjs/remark#1008</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/remarkjs/remark/compare/14.0.2...remark-cli@11.0.0">https://github.com/remarkjs/remark/compare/14.0.2...remark-cli@11.0.0</a></p>
<h2>remark-cli@10.0.1</h2>
<p>See <a href="https://github.com/remarkjs/remark/releases/tag/14.0.2"><code>remark@14.0.2</code></a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>84a2c41</code></a> remark-cli: 12.0.1</li>
<li><a href=""><code>884e14d</code></a> Fix build by downgrading Node</li>
<li><a href=""><code>f9c1a41</code></a> Update Actions</li>
<li><a href=""><code>1d706ed</code></a> Add <code>remark-custom-header-id</code> to list of plugins</li>
<li><a href=""><code>a185821</code></a> cli: update <code>import-meta-resolve</code></li>
<li><a href=""><code>95a6156</code></a> Update dev-dependencies</li>
<li><a href=""><code>6e0a70b</code></a> Add <code>remark-github-blockquote-alert</code> to list of plugins</li>
<li><a href=""><code>d0886dc</code></a> Add <code>remark-github-admonitions-to-directives</code> to list of plugins</li>
<li><a href=""><code>618a9ad</code></a> Add <code>remark-hexo</code> to list of plugins</li>
<li><a href=""><code>5017a27</code></a> 15.0.1</li>
<li>Additional commits viewable in <a href="https://github.com/remarkjs/remark/compare/remark-cli@9.0.0...remark-cli@12.0.1">compare view</a></li>
</ul>
</details>
<br />

Updates `remark-gfm` from 1.0.0 to 4.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/remarkjs/remark-gfm/releases">remark-gfm's releases</a>.</em></p>
<blockquote>
<h2>4.0.1</h2>
<h4>Types</h4>
<ul>
<li>4af823a Refactor to use <code>interface</code> for exposed types</li>
<li>3a57a5b Add declaration maps</li>
<li>76559f9 Refactor to use <code>@import</code>s</li>
</ul>
<h4>Docs</h4>
<ul>
<li>173394d Add docs on footnote option</li>
<li>21cae6a Fix typo
by <a href="https://github.com/leafac"><code>@​leafac</code></a> in <a href="">remarkjs/remark-gfm#73</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/remarkjs/remark-gfm/compare/4.0.0...4.0.1">https://github.com/remarkjs/remark-gfm/compare/4.0.0...4.0.1</a></p>
<h2>4.0.0</h2>
<h4>Change</h4>
<ul>
<li>b8cc334 Update <code>@types/mdast</code>, <code>unified</code>, utilities
<strong>migrate</strong>: update too</li>
<li>9eb0f54 Change to use <code>exports</code>
<strong>migrate</strong>: don’t use private APIs</li>
<li>5715c93 Change to require Node.js 16
<strong>migrate</strong>: update too</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/remarkjs/remark-gfm/compare/3.0.1...4.0.0">https://github.com/remarkjs/remark-gfm/compare/3.0.1...4.0.0</a></p>
<h2>3.0.1</h2>
<ul>
<li>97437dc Add improved docs
by <a href="https://github.com/wooorm"><code>@​wooorm</code></a> in <a href="">remarkjs/remark-gfm#25</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/remarkjs/remark-gfm/compare/3.0.0...3.0.1">https://github.com/remarkjs/remark-gfm/compare/3.0.0...3.0.1</a></p>
<h2>3.0.0</h2>
<ul>
<li>890005e Add support for <a href="https://github.blog/changelog/2021-09-30-footnotes-now-supported-in-markdown-fields/">GFM footnotes</a> ✨
(if you were using <code>remark-footnotes</code> before, you should remove it!)
(how footnotes are turned to HTML is done in <code>remark-rehype</code>, please update that too)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/remarkjs/remark-gfm/compare/2.0.0...3.0.0">https://github.com/remarkjs/remark-gfm/compare/2.0.0...3.0.0</a></p>
<h2>2.0.0</h2>
<ul>
<li>6c518d8 Use ESM
<pre lang="js"><code>// From CommonJS
var remarkGfm = require('remark-gfm')
<p>// To ESM<br />
import remarkGfm from 'remark-gfm'<br />
</code></pre><br />
Learn <a href="https://gist.github.com/sindresorhus/a39789f98801d908bbc7ff3ecc99d99c">more about ESM in this guide</a></li></p>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>109972e</code></a> 4.0.1</li>
<li><a href=""><code>173394d</code></a> Add docs on footnote option</li>
<li><a href=""><code>030dd8d</code></a> Update dev-dependencies</li>
<li><a href=""><code>21cae6a</code></a> Fix typo</li>
<li><a href=""><code>4af823a</code></a> Refactor to use <code>interface</code> for exposed types</li>
<li><a href=""><code>3a57a5b</code></a> Add declaration maps</li>
<li><a href=""><code>76559f9</code></a> Refactor to use <code>@import</code>s</li>
<li><a href=""><code>da38235</code></a> Refactor <code>package.json</code></li>
<li><a href=""><code>a5e8993</code></a> Remove license year</li>
<li><a href=""><code>4e1d55f</code></a> Refactor <code>.editorconfig</code></li>
<li>Additional commits viewable in <a href="https://github.com/remarkjs/remark-gfm/compare/1.0.0...4.0.1">compare view</a></li>
</ul>
</details>
<br />

Updates `remark-lint-no-trailing-spaces` from 2.0.1 to 3.0.2
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7ac5bdb</code></a> 3.0.2</li>
<li><a href=""><code>aac561c</code></a> fix: use vfile-location to make line/column reporting more robust (<a href="">#14</a>)</li>
<li><a href=""><code>714a8cf</code></a> 3.0.1</li>
<li><a href=""><code>d3a04ba</code></a> fix: add line/column reporting for real this time (<a href="">#13</a>)</li>
<li><a href=""><code>3f07af2</code></a> fix: specify line and column for trailing spaces (<a href="">#12</a>)</li>
<li><a href=""><code>1edc1b1</code></a> 3.0.0</li>
<li><a href=""><code>c8bf8a5</code></a> Bump unified-lint-rule from 1.0.6 to 3.0.0 (<a href="">#7</a>)</li>
<li><a href=""><code>bb8c1e3</code></a> Bump remark-cli from 7.0.1 to 12.0.1 (<a href="">#6</a>)</li>
<li><a href=""><code>be806e1</code></a> chore: update remark tools (<a href="">#11</a>)</li>
<li><a href=""><code>e41fa37</code></a> chore: update remark-cli 7.0.1 to 9.0.0 (<a href="">#10</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/Trott/remark-lint-no-trailing-spaces/compare/v2.0.1...v3.0.2">compare view</a></li>
</ul>
</details>
<br />

Updates `remark-preset-lint-markdown-style-guide` from 4.0.0 to 6.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/remarkjs/remark-lint/releases">remark-preset-lint-markdown-style-guide's releases</a>.</em></p>
<blockquote>
<h2>remark-preset-lint-markdown-style-guide@5.1.1</h2>
<ul>
<li>c5c3832 Mark <code>no-auto-link-without-protocol</code> as deprecated</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/remarkjs/remark-lint/commits">compare view</a></li>
</ul>
</details>
<br />

Updates `remark-preset-lint-recommended` from 5.0.0 to 7.0.1
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/remarkjs/remark-lint/releases">remark-preset-lint-recommended's releases</a>.</em></p>
<blockquote>
<h2>remark-preset-lint-recommended@6.1.1</h2>
<ul>
<li>c5c3832 Mark <code>no-auto-link-without-protocol</code> as deprecated</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>750541e</code></a> Publish a patch version for all packages</li>
<li><a href=""><code>b40fe0f</code></a> Change <code>master</code> in links</li>
<li><a href=""><code>48a5393</code></a> maximum-line-length: 2.0.1</li>
<li><a href=""><code>2e3683a</code></a> Update dev-dependencies</li>
<li><a href=""><code>048f1db</code></a> maximum-line-length: fix <code>whitelist</code></li>
<li><a href=""><code>1e314a8</code></a> no-shell-dollars: 2.0.1</li>
<li><a href=""><code>cffce16</code></a> remark-lint-unordered-list-marker-style: fix typos (<a href="">#235</a>)</li>
<li><a href=""><code>dc4f092</code></a> Ignore whitespace only lines too</li>
<li><a href=""><code>3c896b3</code></a> Update dev-dependencies</li>
<li><a href=""><code>7c04e5d</code></a> Fix missing check on one-line code-blocks</li>
<li>Additional commits viewable in <a href="https://github.com/remarkjs/remark-lint/compare/remark-preset-lint-recommended@5.0.0...7.0.1">compare view</a></li>
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
- `@dependabot merge` will merge this PR after your CI passes on it
- `@dependabot squash and merge` will squash and merge this PR after your CI passes on it
- `@dependabot cancel merge` will cancel a previously requested merge and block automerging
- `@dependabot reopen` will reopen this PR if it is closed
- `@dependabot close` will close this PR and stop Dependabot recreating it. You can achieve the same result by closing it manually
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore <dependency name> major version` will close this group update PR and stop Dependabot creating any more for the specific dependency's major version (unless you unignore this specific dependency's major version or upgrade to it yourself)
- `@dependabot ignore <dependency name> minor version` will close this group update PR and stop Dependabot creating any more for the specific dependency's minor version (unless you unignore this specific dependency's minor version or upgrade to it yourself)
- `@dependabot ignore <dependency name>` will close this group update PR and stop Dependabot creating any more for the specific dependency (unless you unignore this specific dependency or upgrade to it yourself)
- `@dependabot unignore <dependency name>` will remove all of the ignore conditions of the specified dependency
- `@dependabot unignore <dependency name> <ignore condition>` will remove the ignore condition of the specified dependency and ignore conditions

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ce67f5fe60c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.