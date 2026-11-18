# Issue

**Title:** Bump astral-sh/setup-uv from 8.1.0 to 8.2.0

## Description

Bumps [astral-sh/setup-uv](https://github.com/astral-sh/setup-uv) from 8.1.0 to 8.2.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/setup-uv/releases">astral-sh/setup-uv's releases</a>.</em></p>
<blockquote>
<h2>v8.2.0 🌈 New inputs <code>quiet</code> and <code>download-from-astral-mirror</code></h2>
<h2>Changes</h2>
<p>This release brings two new inputs and a few bug fixes.</p>
<h3>New inputs</h3>
<p>Lets talk about the new inputs first.</p>
<h4>quiet</h4>
<p>Pretty simple. It turns of all <code>info</code> loggings. Useful if you use this in a composite action and are not interested in all the details.
In the upcoming releases we will add log groups to fully implement support for &quot;less noise&quot;</p>
<blockquote>
<p>[!NOTE]<br />
Warnings and errors are always logged.</p>
</blockquote>
<h4>download-from-astral-mirror</h4>
<p>In some cases you may want to directly use the fallback of checking for available versions and downloading releases from GitHub instead of using the astral.sh mirror. Setting <code>download-from-astral-mirror: false</code> allows you to do that.</p>
<h3>Bugfixes</h3>
<p>When using the astral.sh mirror to query available versions and download releases (done by default) we now stop sending the GitHub token in the header. The mirror never looked at it but we shouldn't be handing out that data even if it is just a short lived token.
All other bugfixes try to limit the impact of failed GitHub queries due to retries and other faults.</p>
<p>We couldn't pinpoint all rootcauses yet but added more logging for error cases to track them down.</p>
<h2>🐛 Bug fixes</h2>
<ul>
<li>fix: report unexpected cache save failures <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#896</a>)</li>
<li>fix: report unexpected setup failures <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#895</a>)</li>
<li>fix: add timeout to fetch to prevent silent hangs <a href="https://github.com/eifinger-bot"><code>@​eifinger-bot</code></a> (<a href="">#883</a>)</li>
<li>Limit GitHub tokens to github.com download URLs <a href="https://github.com/zsol"><code>@​zsol</code></a> (<a href="">#878</a>)</li>
<li>increase libuv-workaround timeout to 100ms <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#880</a>)</li>
</ul>
<h2>🚀 Enhancements</h2>
<ul>
<li>Add quiet input to suppress info-level log output <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#898</a>)</li>
<li>feat: add <code>download-from-astral-mirror</code> input <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#897</a>)</li>
</ul>
<h2>🧰 Maintenance</h2>
<ul>
<li>docs: update dependabot rollup biome guidance <a href="https://github.com/eifinger"><code>@​eifinger</code></a> (<a href="">#902</a>)</li>
<li>chore: update known checksums for 0.11.18 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#899</a>)</li>
<li>chore: update known checksums for 0.11.17 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#892</a>)</li>
<li>chore: update known checksums for 0.11.16 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#889</a>)</li>
<li>chore: update known checksums for 0.11.15 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#885</a>)</li>
<li>chore: update known checksums for 0.11.14 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#879</a>)</li>
<li>chore: update known checksums for 0.11.13 @<a href="https://github.com/apps/github-actions">github-actions[bot]</a> (<a href="">#877</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>fac544c</code></a> chore(deps): roll up dependabot updates (<a href="">#903</a>)</li>
<li><a href=""><code>7390f77</code></a> docs: update dependabot rollup biome guidance (<a href="">#902</a>)</li>
<li><a href=""><code>363c64a</code></a> chore(deps): roll up dependabot updates (<a href="">#901</a>)</li>
<li><a href=""><code>c4fcbaf</code></a> chore(deps): bump release-drafter/release-drafter from 7.3.0 to 7.3.1 (<a href="">#900</a>)</li>
<li><a href=""><code>8e642c5</code></a> chore: update known checksums for 0.11.18 (<a href="">#899</a>)</li>
<li><a href=""><code>a92cb43</code></a> Add quiet input to suppress info-level log output (<a href="">#898</a>)</li>
<li><a href=""><code>e07f2ac</code></a> chore(deps): bump eifinger/actionlint-action from 1.10.1 to 1.10.2 (<a href="">#842</a>)</li>
<li><a href=""><code>bc4034e</code></a> chore(deps): bump github/codeql-action from 4.35.4 to 4.36.0 (<a href="">#893</a>)</li>
<li><a href=""><code>df42d4f</code></a> chore(deps): bump zizmorcore/zizmor-action from 0.5.5 to 0.5.6 (<a href="">#891</a>)</li>
<li><a href=""><code>b9c8c4c</code></a> feat: add <code>download-from-astral-mirror</code> input (<a href="">#897</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/setup-uv/compare/v8.1.0...v8.2.0">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `562f0e0e866e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.