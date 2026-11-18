# Issue

**Title:** Bump ruff from 0.16.10 to 0.17.0 in the minor-and-patch group

## Description

Bumps the minor-and-patch group with 1 update: [ruff](https://github.com/astral-sh/ruff).

Updates `ruff` from 0.16.10 to 0.17.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.17.0</h2>
<h2>Release Notes</h2>
<p>Released on 2026-10-09.</p>
<p>The executables in our macOS and Windows release archives and <code>ruff</code> wheels are now code-signed. macOS executables are signed with an Apple Developer ID certificate and notarized by Apple. Windows executables have timestamped Authenticode signatures from Azure Artifact Signing. This enables verification of the release publisher and binary integrity, supports publisher-based allowlisting, and should reduce security warnings and antivirus false positives.</p>
<h3>Breaking changes</h3>
<ul>
<li>
<p>Update the default and latest Python versions for 3.15 (<a href="">#28792</a>)</p>
<p>Ruff now defaults to Python 3.11 instead of 3.10 when no Python version is configured through <a href="https://docs.astral.sh/ruff/settings/#target-version"><code>target-version</code></a> or <a href="https://docs.astral.sh/ruff/configuration/#inferring-the-python-version"><code>requires-python</code></a>. When checking for syntax errors without a configured Python version, Ruff now defaults to Python 3.15 instead of 3.14.</p>
</li>
<li>
<p>Update the default rule set (<a href="">#28786</a>)</p>
<p>Several of the <code>flake8-datetimez</code> rules (<a href="https://docs.astral.sh/ruff/rules/call-datetime-without-tzinfo/"><code>DTZ001</code></a>, <a href="https://docs.astral.sh/ruff/rules/call-datetime-now-without-tzinfo/"><code>DTZ005</code></a>, <a href="https://docs.astral.sh/ruff/rules/call-datetime-fromtimestamp/"><code>DTZ006</code></a>, <a href="https://docs.astral.sh/ruff/rules/call-datetime-strptime-without-zone/"><code>DTZ007</code></a>, <a href="https://docs.astral.sh/ruff/rules/call-date-today/"><code>DTZ011</code></a>, <a href="https://docs.astral.sh/ruff/rules/call-date-fromtimestamp/"><code>DTZ012</code></a>, and <a href="https://docs.astral.sh/ruff/rules/datetime-min-max/"><code>DTZ901</code></a>) are no longer enabled by default, while <a href="https://docs.astral.sh/ruff/rules/undefined-local-with-nested-import-star-usage/"><code>undefined-local-with-nested-import-star-usage</code></a> (<code>F406</code>), which corresponds to a syntax error, is now enabled by default.</p>
</li>
<li>
<p>Update Rust crate quick-junit to 0.8.0 (<a href="">#27295</a>)</p>
<p>JUnit output now uses a <code>skipped</code> attribute instead of <code>disabled</code> on <code>&lt;testsuite&gt;</code> elements and includes a <code>skipped</code> attribute on the root <code>&lt;testsuites&gt;</code> element.</p>
</li>
<li>
<p>[<code>flake8-import-conventions</code>] Add <code>datetime as dt</code> as a conventional alias (<code>ICN001</code>) (<a href="">#28790</a>)</p>
</li>
<li>
<p>Support Unicode dummy variable names (<a href="">#28722</a>)</p>
<p>The default <a href="https://docs.astral.sh/ruff/settings/#lint_dummy-variable-rgx"><code>lint.dummy-variable-rgx</code></a> now recognizes underscore-prefixed Unicode names, such as <code>_次</code>, as dummy variables.</p>
</li>
<li>
<p>Update to Unicode 17 (<a href="">#21229</a>, <a href="">#28784</a>)</p>
<p>Ruff now uses Unicode 17 data for identifier normalization and named character escapes (<code>&quot;\N{...}&quot;</code>).</p>
</li>
<li>
<p>Always show unsafe and display-only fixes in the CLI (<a href="">#27810</a>)</p>
<p>The default <code>full</code> output format now shows unsafe fixes and suggestions requiring manual review, regardless of the <a href="https://docs.astral.sh/ruff/settings/#unsafe-fixes"><code>unsafe-fixes</code></a> setting. Actually applying unsafe fixes still requires explicit opt-in.</p>
</li>
<li>
<p>Remove the Python dependency from conda-forge builds (<a href="">conda-forge/ruff-feedstock#361</a>)</p>
<p>The conda-forge build no longer depends on Python, now supports linux-riscv64, win-arm64, and linux-ppc64le platforms, and now includes shell completions. However, no longer depending on Python means that <code>python -m ruff</code> and <code>import ruff</code> will no longer work. Use <code>ruff</code> directly from <code>PATH</code> instead. PyPI installations and those from the standalone installer are unaffected.</p>
</li>
<li>
<p>Remove support for ruff-lsp (<a href="">#28750</a>)</p>
<p>Support for <code>ruff-lsp</code>, the legacy Python language server <a href="https://github.com/astral-sh/ruff/releases/tag/0.9.5">deprecated in Ruff v0.9.5</a>, has been removed. The Ruff VS Code extension now always uses the native language server; <code>ruff.nativeServer</code> is deprecated and ignored. See the <a href="https://docs.astral.sh/ruff/editors/migration/">migration guide</a>.</p>
</li>
</ul>
<h3>Stabilization</h3>
<p>The following rules have been stabilized and are no longer in preview:</p>
<ul>
<li><a href="https://docs.astral.sh/ruff/rules/lazy-import-mismatch"><code>lazy-import-mismatch</code></a> (<code>TID254</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/lazy-import-immediately-resolved"><code>lazy-import-immediately-resolved</code></a> (<code>TID255</code>)</li>
<li><a href="https://docs.astral.sh/ruff/rules/os-path-commonprefix"><code>os-path-commonprefix</code></a> (<code>RUF071</code>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.17.0</h2>
<p>Released on 2026-10-09.</p>
<p>The executables in our macOS and Windows release archives and <code>ruff</code> wheels are now code-signed.
macOS executables are signed with an Apple Developer ID certificate and notarized by Apple. Windows
executables have timestamped Authenticode signatures from Azure Artifact Signing. This enables
verification of the release publisher and binary integrity, supports publisher-based allowlisting,
and should reduce security warnings and antivirus false positives.</p>
<h3>Breaking changes</h3>
<ul>
<li>
<p>Update the default and latest Python versions for 3.15 (<a href="">#28792</a>)</p>
<p>Ruff now defaults to Python 3.11 instead of 3.10 when no Python version is configured through
<a href="https://docs.astral.sh/ruff/settings/#target-version"><code>target-version</code></a> or
<a href="https://docs.astral.sh/ruff/configuration/#inferring-the-python-version"><code>requires-python</code></a>. When
checking for syntax errors without a configured Python version, Ruff now defaults to Python 3.15
instead of 3.14.</p>
</li>
<li>
<p>Update the default rule set (<a href="">#28786</a>)</p>
<p>Several of the <code>flake8-datetimez</code> rules
(<a href="https://docs.astral.sh/ruff/rules/call-datetime-without-tzinfo/"><code>DTZ001</code></a>,
<a href="https://docs.astral.sh/ruff/rules/call-datetime-now-without-tzinfo/"><code>DTZ005</code></a>,
<a href="https://docs.astral.sh/ruff/rules/call-datetime-fromtimestamp/"><code>DTZ006</code></a>,
<a href="https://docs.astral.sh/ruff/rules/call-datetime-strptime-without-zone/"><code>DTZ007</code></a>,
<a href="https://docs.astral.sh/ruff/rules/call-date-today/"><code>DTZ011</code></a>,
<a href="https://docs.astral.sh/ruff/rules/call-date-fromtimestamp/"><code>DTZ012</code></a>, and
<a href="https://docs.astral.sh/ruff/rules/datetime-min-max/"><code>DTZ901</code></a>) are no longer enabled by default,
while <a href="https://docs.astral.sh/ruff/rules/undefined-local-with-nested-import-star-usage/"><code>undefined-local-with-nested-import-star-usage</code></a>
(<code>F406</code>), which corresponds to a syntax error, is now enabled by default.</p>
</li>
<li>
<p>Update Rust crate quick-junit to 0.8.0 (<a href="">#27295</a>)</p>
<p>JUnit output now uses a <code>skipped</code> attribute instead of <code>disabled</code> on <code>&lt;testsuite&gt;</code> elements and
includes a <code>skipped</code> attribute on the root <code>&lt;testsuites&gt;</code> element.</p>
</li>
<li>
<p>[<code>flake8-import-conventions</code>] Add <code>datetime as dt</code> as a conventional alias (<code>ICN001</code>) (<a href="">#28790</a>)</p>
</li>
<li>
<p>Support Unicode dummy variable names (<a href="">#28722</a>)</p>
<p>The default <a href="https://docs.astral.sh/ruff/settings/#lint_dummy-variable-rgx"><code>lint.dummy-variable-rgx</code></a>
now recognizes underscore-prefixed Unicode names, such as <code>_次</code>, as dummy variables.</p>
</li>
<li>
<p>Update to Unicode 17 (<a href="">#21229</a>, <a href="">#28784</a>)</p>
<p>Ruff now uses Unicode 17 data for identifier normalization and named character escapes (<code>&quot;\N{...}&quot;</code>).</p>
</li>
<li>
<p>Always show unsafe and display-only fixes in the CLI (<a href="">#27810</a>)</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5b27c1c</code></a> Bump version to 0.17.0 (<a href="">#29259</a>)</li>
<li><a href=""><code>8f362bf</code></a> Integrate vendored Unicode names into Ruff</li>
<li><a href=""><code>88a50d6</code></a> Revert upstream Unicode loose matching</li>
<li><a href=""><code>276832a</code></a> Revert upstream Unicode alias normalization</li>
<li><a href=""><code>26911ca</code></a> Vendor unicode_names2 from upstream</li>
<li><a href=""><code>27e3797</code></a> [<code>ruff</code>] Stabilize <code>os-path-commonprefix</code> (<code>RUF071</code>) (<a href="">#28764</a>)</li>
<li><a href=""><code>bbb52c1</code></a> [<code>flake8-tidy-imports</code>] Stabilize <code>lazy-import-immediately-resolved</code> (`TID255...</li>
<li><a href=""><code>5aa9cbd</code></a> [<code>flake8-tidy-imports</code>] Stabilize <code>lazy-import-mismatch</code> (<code>TID254</code>) (<a href="">#28760</a>)</li>
<li><a href=""><code>dba1bc8</code></a> [<code>flake8-import-conventions</code>] Add <code>datetime as dt</code> as a conventional alias (`...</li>
<li><a href=""><code>ef23c9c</code></a> Update default and latest Python versions for 3.15 (<a href="">#28792</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.16.10...0.17.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=ruff&package-manager=uv&previous-version=0.16.10&new-version=0.17.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7e4394912364`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.