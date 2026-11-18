# Issue

**Title:** chore(deps-dev): bump the python group with 2 updates

## Description

Bumps the python group with 2 updates: [tox](https://github.com/tox-dev/tox) and [tox-uv](https://github.com/tox-dev/tox-uv).

Updates `tox` from 4.48.1 to 4.50.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/tox/releases">tox's releases</a>.</em></p>
<blockquote>
<h2>v4.50.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>document {env:TOX_PACKAGE} for referencing built packages in commands by <a href="https://github.com/rahuldevikar"><code>@​rahuldevikar</code></a> in <a href="">tox-dev/tox#3873</a></li>
<li>🧪 test(docs): validate doc config examples to prevent regressions by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3875</a></li>
<li>✨ feat(run): add interrupt_post_commands for cleanup after Ctrl-C by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3882</a></li>
<li>✨ feat(config): support subscript syntax and env_name in conditionals by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3884</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox/compare/4.49.1...4.50.0">https://github.com/tox-dev/tox/compare/4.49.1...4.50.0</a></p>
<h2>v4.49.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Update maintainers by <a href="https://github.com/rahuldevikar"><code>@​rahuldevikar</code></a> in <a href="">tox-dev/tox#3868</a></li>
<li>🐛 fix(run): break deadlock in execution interrupt chain by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3869</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox/compare/4.49.0...4.49.1">https://github.com/tox-dev/tox/compare/4.49.0...4.49.1</a></p>
<h2>v4.49.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>✨ feat(config): add {factor:label} substitution for TOML by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox#3865</a></li>
<li>🐛 fix(legacy): initialize config_format and output_file for --showconfig by <a href="https://github.com/rares985"><code>@​rares985</code></a> in <a href="">tox-dev/tox#3867</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/rares985"><code>@​rares985</code></a> made their first contribution in <a href="">tox-dev/tox#3867</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox/compare/4.48.1...4.49.0">https://github.com/tox-dev/tox/compare/4.48.1...4.49.0</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/tox/blob/main/docs/changelog.rst">tox's changelog</a>.</em></p>
<blockquote>
<h1>Features - 4.50.0</h1>
<ul>
<li>Add <code>interrupt_post_commands</code> option to run cleanup commands even after SIGINT - by :user:<code>gaborbernat</code>.
(:issue:<code>3858</code>)</li>
<li>Add <code>factor['NAME']</code> and <code>env['VAR']</code> subscript syntax for conditional expressions, enabling checks of factors
with non-identifier names like <code>factor['3.14']</code>. Add <code>env_name</code> variable to check the full environment name in
conditions. (:issue:<code>3880</code>)</li>
</ul>
<h1>Bug fixes - 4.50.0</h1>
<ul>
<li>Fix multiple manpage issues: remove duplicate header/author/copyright sections, set <code>project</code> in Sphinx config, and
compile the manpage to troff format at wheel-build time instead of shipping raw RST source - by :user:<code>gaborbernat</code>.
(:issue:<code>3878</code>)</li>
</ul>
<h1>Improved documentation - 4.50.0</h1>
<ul>
<li>Document how to reference the built package path in commands via <code>TOX_PACKAGE</code> - by :user:<code>rahuldevikar</code>
(:issue:<code>3862</code>)</li>
<li>Fix broken TOML examples missing <code>extend = true</code> on conditional replacements inside lists, fix incorrect <code>ref of</code>
path in raw reference docs, and add a test that validates all doc config examples - by :user:<code>gaborbernat</code>
(:issue:<code>3875</code>)</li>
</ul>
<hr />
<p>v4.49.1 (2026-03-09)</p>
<hr />
<h1>Bug fixes - 4.49.1</h1>
<ul>
<li>Break deadlock in execution interrupt chain that caused ~18 flaky timeout failures across 9 tests on Windows/macOS CI
<ul>
<li>by :user:<code>gaborbernat</code>. (:issue:<code>3869</code>)</li>
</ul>
</li>
</ul>
<hr />
<p>v4.49.0 (2026-03-06)</p>
<hr />
<h1>Features - 4.49.0</h1>
<ul>
<li>Add <code>{factor:label}</code> substitution for TOML configs -- factor groups in <code>product</code> matrices and <code>env_base</code> factors
can now be labeled with single-key dicts (e.g., <code>{ecosystem = [&quot;oci&quot;, &quot;python&quot;]}</code>), enabling <code>{factor:ecosystem}</code>
in any string value (descriptions, commands, etc.) to resolve to the active factor. Plain lists automatically get
positional labels (<code>{factor:0}</code>, <code>{factor:1}</code>, ...) - by :user:<code>gaborbernat</code>. (:issue:<code>3860</code>) (:issue:<code>3860</code>)</li>
</ul>
<h1>Bug fixes - 4.49.0</h1>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>db1362d</code></a> release 4.50.0</li>
<li><a href=""><code>2d18e29</code></a> ✨ feat(config): support subscript syntax and env_name in conditionals (<a href="">#3884</a>)</li>
<li><a href=""><code>bf4e4e8</code></a> ✨ feat(run): add interrupt_post_commands for cleanup after Ctrl-C (<a href="">#3882</a>)</li>
<li><a href=""><code>fb1f6af</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#3879</a>)</li>
<li><a href=""><code>02f12b3</code></a> 🧪 test(docs): validate doc config examples to prevent regressions (<a href="">#3875</a>)</li>
<li><a href=""><code>c797c65</code></a> document {env:TOX_PACKAGE} for referencing built packages in commands (<a href="">#3873</a>)</li>
<li><a href=""><code>142b077</code></a> release 4.49.1</li>
<li><a href=""><code>e3876f3</code></a> 🐛 fix(run): break deadlock in execution interrupt chain (<a href="">#3869</a>)</li>
<li><a href=""><code>3aa8135</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#3872</a>)</li>
<li><a href=""><code>8536955</code></a> Update maintainers (<a href="">#3868</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/tox/compare/4.48.1...4.50.0">compare view</a></li>
</ul>
</details>
<br />

Updates `tox-uv` from 1.33.1 to 1.33.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/tox-uv/releases">tox-uv's releases</a>.</em></p>
<blockquote>
<h2>1.33.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(meta): remove tox_uv namespace conflict by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox-uv#314</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox-uv/compare/1.33.3...1.33.4">https://github.com/tox-dev/tox-uv/compare/1.33.3...1.33.4</a></p>
<h2>1.33.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(venv): reject non-Python env names as interpreter specs by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox-uv#312</a></li>
<li>🐛 fix(venv): resolve env names with trailing digits correctly by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox-uv#313</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox-uv/compare/1.33.2...1.33.3">https://github.com/tox-dev/tox-uv/compare/1.33.2...1.33.3</a></p>
<h2>1.33.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(venv): resolve Python spec from env name when tox passes fallback path by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/tox-uv#308</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/tox-uv/compare/1.33.1...1.33.2">https://github.com/tox-dev/tox-uv/compare/1.33.1...1.33.2</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>e0b9d0f</code></a> 🐛 fix(meta): remove tox_uv namespace conflict (<a href="">#314</a>)</li>
<li><a href=""><code>8cee50b</code></a> 🐛 fix(venv): resolve env names with trailing digits correctly (<a href="">#313</a>)</li>
<li><a href=""><code>ff811cb</code></a> 🐛 fix(venv): reject non-Python env names as interpreter specs (<a href="">#312</a>)</li>
<li><a href=""><code>ef8450c</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#307</a>)</li>
<li><a href=""><code>906a243</code></a> 🐛 fix(venv): resolve Python spec from env name when tox passes fallback path ...</li>
<li><a href=""><code>37d1adb</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#306</a>)</li>
<li>See full diff in <a href="https://github.com/tox-dev/tox-uv/compare/1.33.1...1.33.4">compare view</a></li>
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

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b5bbaf772ee`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.