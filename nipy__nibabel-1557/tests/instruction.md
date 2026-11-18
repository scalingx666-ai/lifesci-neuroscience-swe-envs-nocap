# Issue

**Title:** chore(deps): bump astral-sh/setup-uv from 8.2.0 to 10.1.0

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 8.2.0 to 10.1.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v10.1.0 🌈  New output <code>python-runtime-id</code>and respect NO_PROXY</h2>
<h2>Changes</h2>
<p>This release adds more bheind the scene security improvements and also 2 small improvements.</p>
<h3>NO_PROXY</h3>
<p>This action now respects <code>no_proxy/NO_PROXY</code> environment variables which were previously ignored.</p>
<h3>New output <code>python-runtime-id</code></h3>
<p>The new output <code>python-runtime-id</code> can be used to know which python version exactly was installed if you use <code>activate-environment</code>. See <a href="">pyca/cryptography#15572</a> for details on why this can be useful.</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>fix: respect no proxy directive <a href="https://github.com/mj0nez"><code>@​mj0nez</code></a> (<a href="">#1037</a>)</li>
<li>Use JSON + a typed wrapper instead of TS codegen <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#1025</a>)</li>
</ul>
<h2>🚀 Enhancements</h2>
<ul>
<li>Expose a Python &quot;identity&quot; output <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#1036</a>)</li>
<li>Verify downloads with astral-sh/versions checksums <a href="https://github.com/zaniebot"><code>@​zaniebot</code></a> (<a href="">#1033</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>chore: update known checksums for 0.12.12 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1041</a>)</li>
<li>chore: update known checksums for 0.12.10/0.12.11 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1038</a>)</li>
<li>chore: update known checksums for 0.12.9 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1035</a>)</li>
<li>chore: update known checksums for 0.12.7/0.12.8 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1031</a>)</li>
<li>chore: update known checksums for 0.12.6 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1030</a>)</li>
<li>chore: update known checksums for 0.12.5 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1020</a>)</li>
<li>Use self-repo syntax for all in-repo actions/reusable workflows <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#1024</a>)</li>
<li>Pin one-shot tools <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#1022</a>)</li>
<li>ci: remove obsolete direct push attempts <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#1019</a>)</li>
</ul>
<h2>📚 Documentation</h2>
<ul>
<li>docs: update version references to v10.0.1 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#1018</a>)</li>
</ul>
<h2>⬆️ Dependency updates</h2>
<ul>
<li>chore(deps-dev): roll up Dependabot updates <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#1043</a>)</li>
<li>Harden npm install defaults <a href="https://github.com/zaniebot"><code>@​zaniebot</code></a> (<a href="">#1026</a>)</li>
<li>Add dependency cooldowns <a href="https://github.com/woodruffw"><code>@​woodruffw</code></a> (<a href="">#1021</a>)</li>
</ul>
<h2>v10.0.1 🌈 Tolerate transient manifest timeouts</h2>
<h2>Changes</h2>
<p>Thank you <a href="https://github.com/arguile"><code>@​arguile</code></a>- for making this action more resilient.</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bec219d</code></a> chore(deps-dev): roll up Dependabot updates (<a href="">#1043</a>)</li>
<li><a href=""><code>b90ec40</code></a> fix: respect no proxy directive (<a href="">#1037</a>)</li>
<li><a href=""><code>421feb6</code></a> chore: update known checksums for 0.12.12 (<a href="">#1041</a>)</li>
<li><a href=""><code>f634bf4</code></a> Expose a Python &quot;identity&quot; output (<a href="">#1036</a>)</li>
<li><a href=""><code>a6772c8</code></a> chore: update known checksums for 0.12.10/0.12.11 (<a href="">#1038</a>)</li>
<li><a href=""><code>e105c8f</code></a> chore: update known checksums for 0.12.9 (<a href="">#1035</a>)</li>
<li><a href=""><code>cd13f92</code></a> Verify downloads with astral-sh/versions checksums (<a href="">#1033</a>)</li>
<li><a href=""><code>3aef7b9</code></a> chore: update known checksums for 0.12.7/0.12.8 (<a href="">#1031</a>)</li>
<li><a href=""><code>d08d816</code></a> chore: update known checksums for 0.12.6 (<a href="">#1030</a>)</li>
<li><a href=""><code>19b4d1e</code></a> Harden npm install defaults (<a href="">#1026</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/fac544c07dec837d0ccb6301d7b5580bf5edae39...bec219d24cd3e171d82865faccec33120bb574f4">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=astral-sh/setup-uv&package-manager=github_actions&previous-version=8.2.0&new-version=10.1.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `edf28398253e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.