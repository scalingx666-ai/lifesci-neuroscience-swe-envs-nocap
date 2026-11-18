# Issue

**Title:** Bump pre-commit from 2.3.0 to 4.6.2

## Description

Bumps [pre-commit](https://github.com/pre-commit/pre-commit) from 2.3.0 to 4.6.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/releases">pre-commit's releases</a>.</em></p>
<blockquote>
<h2>pre-commit v4.6.2</h2>
<h3>Fixes</h3>
<ul>
<li>Fix <code>language: node</code> hooks that contain <code>&quot;scripts&quot;: {&quot;build&quot;: ...}</code> with
npm 11.x.
<ul>
<li>Regressed in 4.6.1.</li>
<li><a href="">#3737</a> issue by <a href="https://github.com/mheiges"><code>@​mheiges</code></a>.</li>
<li><a href="">#3743</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h2>pre-commit v4.6.1</h2>
<h3>Fixes</h3>
<ul>
<li>Install <code>language: node</code> hooks via <code>git</code>.
<ul>
<li>Fixes npm 12.x compatibility</li>
<li><a href="">#3719</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#3517</a> issue by <a href="https://github.com/ojob"><code>@​ojob</code></a>.</li>
</ul>
</li>
<li>Set <code>JULIA_DEPOT_PATH</code> for <code>language: julia</code>.
<ul>
<li><a href="">#3711</a> PR by <a href="https://github.com/damonbayer"><code>@​damonbayer</code></a>.</li>
<li><a href="">pre-commit-ci/runner-image#335</a> issue by <a href="https://github.com/damonbayer"><code>@​damonbayer</code></a>.</li>
</ul>
</li>
<li>Produce error on mistyped <code>--repo</code> for <code>pre-commit autoupdate</code>.
<ul>
<li><a href="">#3701</a> PR by <a href="https://github.com/mxr"><code>@​mxr</code></a>.</li>
<li><a href="">#3695</a> issue by <a href="https://github.com/mxr"><code>@​mxr</code></a>.</li>
</ul>
</li>
<li>Improve performance of commit existence check in <code>pre-push</code>.
<ul>
<li><a href="">#3726</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#3604</a> issue by <a href="https://github.com/ptarjan"><code>@​ptarjan</code></a>.</li>
</ul>
</li>
<li>Avoid duplicating conflicted filenames during <code>pre-commit run --all-files</code>.
<ul>
<li><a href="">#3727</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#3706</a> issue by <a href="https://github.com/RomanValov"><code>@​RomanValov</code></a>.</li>
</ul>
</li>
</ul>
<h2>pre-commit v4.6.0</h2>
<h3>Features</h3>
<ul>
<li><code>pre-commit hook-impl</code>: allow <code>--hook-dir</code> to be missing to enable easier usage with <code>git</code> 2.54+ git hooks.
<ul>
<li><a href="">#3662</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li><code>pre-commit hook-impl</code>: <code>--hook-type</code> is required.
<ul>
<li><a href="">#3661</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h2>pre-commit v4.5.1</h2>
<h3>Fixes</h3>
<ul>
<li>Fix <code>language: python</code> with <code>repo: local</code> without <code>additional_dependencies</code>.
<ul>
<li><a href="">#3597</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h2>pre-commit v4.5.0</h2>
<h3>Features</h3>
<ul>
<li>Add <code>pre-commit hazmat</code>.
<ul>
<li><a href="">#3585</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h2>pre-commit v4.4.0</h2>
<h3>Features</h3>
<ul>
<li>Add <code>--fail-fast</code> option to <code>pre-commit run</code>.
<ul>
<li><a href="">#3528</a> PR by <a href="https://github.com/JulianMaurin"><code>@​JulianMaurin</code></a>.</li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/blob/main/CHANGELOG.md">pre-commit's changelog</a>.</em></p>
<blockquote>
<h1>4.6.2 - 2026-08-10</h1>
<h3>Fixes</h3>
<ul>
<li>Fix <code>language: node</code> hooks that contain <code>&quot;scripts&quot;: {&quot;build&quot;: ...}</code> with
npm 11.x.
<ul>
<li>Regressed in 4.6.1.</li>
<li><a href="">#3737</a> issue by <a href="https://github.com/mheiges"><code>@​mheiges</code></a>.</li>
<li><a href="">#3743</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h1>4.6.1 - 2026-07-21</h1>
<h3>Fixes</h3>
<ul>
<li>Install <code>language: node</code> hooks via <code>git</code>.
<ul>
<li>Fixes npm 12.x compatibility</li>
<li><a href="">#3719</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#3517</a> issue by <a href="https://github.com/ojob"><code>@​ojob</code></a>.</li>
</ul>
</li>
<li>Set <code>JULIA_DEPOT_PATH</code> for <code>language: julia</code>.
<ul>
<li><a href="">#3711</a> PR by <a href="https://github.com/damonbayer"><code>@​damonbayer</code></a>.</li>
<li><a href="">pre-commit-ci/runner-image#335</a> issue by <a href="https://github.com/damonbayer"><code>@​damonbayer</code></a>.</li>
</ul>
</li>
<li>Produce error on mistyped <code>--repo</code> for <code>pre-commit autoupdate</code>.
<ul>
<li><a href="">#3701</a> PR by <a href="https://github.com/mxr"><code>@​mxr</code></a>.</li>
<li><a href="">#3695</a> issue by <a href="https://github.com/mxr"><code>@​mxr</code></a>.</li>
</ul>
</li>
<li>Improve performance of commit existence check in <code>pre-push</code>.
<ul>
<li><a href="">#3726</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#3604</a> issue by <a href="https://github.com/ptarjan"><code>@​ptarjan</code></a>.</li>
</ul>
</li>
<li>Avoid duplicating conflicted filenames during <code>pre-commit run --all-files</code>.
<ul>
<li><a href="">#3727</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#3706</a> issue by <a href="https://github.com/RomanValov"><code>@​RomanValov</code></a>.</li>
</ul>
</li>
</ul>
<h1>4.6.0 - 2026-04-21</h1>
<h3>Features</h3>
<ul>
<li><code>pre-commit hook-impl</code>: allow <code>--hook-dir</code> to be missing to enable easier
usage with <code>git</code> 2.54+ git hooks.
<ul>
<li><a href="">#3662</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li><code>pre-commit hook-impl</code>: <code>--hook-type</code> is required.
<ul>
<li><a href="">#3661</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h1>4.5.1 - 2025-12-16</h1>
<h3>Fixes</h3>
<ul>
<li>Fix <code>language: python</code> with <code>repo: local</code> without <code>additional_dependencies</code>.
<ul>
<li><a href="">#3597</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9767b6c</code></a> v4.6.2</li>
<li><a href=""><code>42ee3ff</code></a> Merge pull request <a href="">#3743</a> from pre-commit/npm-build-scripts-11-x</li>
<li><a href=""><code>3056619</code></a> fix <code>language: node</code> for hooks with build scripts and npm 11.x</li>
<li><a href=""><code>242ce8a</code></a> v4.6.1</li>
<li><a href=""><code>766e550</code></a> Merge pull request <a href="">#3727</a> from pre-commit/dedupe</li>
<li><a href=""><code>1558d06</code></a> Merge pull request <a href="">#3726</a> from pre-commit/exists-faster</li>
<li><a href=""><code>8a1c47a</code></a> avoid duplicate files in --all-files during conflict</li>
<li><a href=""><code>2e01c99</code></a> faster check of rev existing locally as a commit</li>
<li><a href=""><code>3613bf2</code></a> Merge pull request <a href="">#3701</a> from pre-commit/autoupdate-repos</li>
<li><a href=""><code>1d811d9</code></a> Return an error for invalid --repo</li>
<li>Additional commits viewable in <a href="https://github.com/pre-commit/pre-commit/compare/v2.3.0...v4.6.2">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `46ec6ed5e8e0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.