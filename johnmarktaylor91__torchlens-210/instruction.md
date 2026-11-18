# Issue

**Title:** chore(deps): bump actions/download-artifact from 8.0.1 to 8.0.2

## Description

Bumps [actions/download-artifact](https://github.com/actions/download-artifact) from 8.0.1 to 8.0.2.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/download-artifact/releases">actions/download-artifact's releases</a>.</em></p>
<blockquote>
<h2>v8.0.2</h2>
<h2>What's Changed</h2>
<ul>
<li>Update the readme by <a href="https://github.com/danwkennedy"><code>@​danwkennedy</code></a> in <a href="">actions/download-artifact#473</a></li>
<li>Improves artifact download retries when the service returns HTTP 429 (rate limiting), including honoring valid Retry-After headers.</li>
<li>Update <code>@​actions/artifact</code> to 6.3.1 by <a href="https://github.com/tunc-d"><code>@​tunc-d</code></a> in <a href="">actions/download-artifact#492</a></li>
<li>Prepare download-artifact v8.0.2 by <a href="https://github.com/tunc-d"><code>@​tunc-d</code></a> in <a href="">actions/download-artifact#493</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/tunc-d"><code>@​tunc-d</code></a> made their first contribution in <a href="">actions/download-artifact#492</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/download-artifact/compare/v8.0.1...v8.0.2">https://github.com/actions/download-artifact/compare/v8.0.1...v8.0.2</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9000827</code></a> Merge pull request <a href="">#493</a> from actions/tunc-d-prepare-download-v8-0-2</li>
<li><a href=""><code>e455989</code></a> Prepare download-artifact v8.0.2</li>
<li><a href=""><code>a00b90c</code></a> Merge pull request <a href="">#492</a> from actions/tunc-d-download-artifact-package-bump</li>
<li><a href=""><code>29bb7ce</code></a> Update <code>@​actions/artifact</code> to 6.3.1</li>
<li><a href=""><code>484a0b5</code></a> Update the readme (<a href="">#473</a>)</li>
<li>See full diff in <a href="https://github.com/actions/download-artifact/compare/3e5f45b2cfb9172054b4087a40e8e0b5a5461e7c...9000827ccba6bdab643e8b6fd33ac0654aef8333">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae01cb22bcbe`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.