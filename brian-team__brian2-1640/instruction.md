# Issue

**Title:** Bump conda-incubator/setup-miniconda from 3.1.1 to 3.2.0

## Description

Bumps [conda-incubator/setup-miniconda](https://github.com/conda-incubator/setup-miniconda) from 3.1.1 to 3.2.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/conda-incubator/setup-miniconda/releases">conda-incubator/setup-miniconda's releases</a>.</em></p>
<blockquote>
<h2>Version 3.2.0</h2>
<h3>Fixes</h3>
<ul>
<li>Check all <code>.condarc</code> files when removing <code>defaults</code> by <a href="https://github.com/marcoesters"><code>@​marcoesters</code></a> in <a href="">conda-incubator/setup-miniconda#398</a></li>
<li>Add version normalization for minicondaVersion in input validation by <a href="https://github.com/jezdez"><code>@​jezdez</code></a> in <a href="">conda-incubator/setup-miniconda#397</a></li>
<li>Workaround for <code>auto_activate_base</code> deprecation by <a href="https://github.com/jaimergp"><code>@​jaimergp</code></a> in <a href="">conda-incubator/setup-miniconda#402</a></li>
</ul>
<h3>Tasks and Maintenance</h3>
<ul>
<li>Bump conda-incubator/setup-miniconda from 3.1.0 to 3.1.1 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">conda-incubator/setup-miniconda#391</a></li>
<li>Bump undici from 5.28.4 to 5.28.5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">conda-incubator/setup-miniconda#390</a></li>
<li>Bump semver and <code>@​types/semver</code> by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">conda-incubator/setup-miniconda#399</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/conda-incubator/setup-miniconda/blob/main/CHANGELOG.md">conda-incubator/setup-miniconda's changelog</a>.</em></p>
<blockquote>
<h1>CHANGELOG</h1>
<h2>[v3.2.0] (2025-06-04)</h2>
<h3>Fixes</h3>
<ul>
<li>Check all <code>.condarc</code> files when removing <code>defaults</code> by <a href="https://github.com/marcoesters"><code>@​marcoesters</code></a> in
<a href="">conda-incubator/setup-miniconda#398</a></li>
<li>Add version normalization for minicondaVersion in input validation by <a href="https://github.com/jezdez"><code>@​jezdez</code></a>
in <a href="">conda-incubator/setup-miniconda#397</a></li>
<li>Workaround for auto_activate_base deprecation by <a href="https://github.com/jaimergp"><code>@​jaimergp</code></a> in
<a href="">conda-incubator/setup-miniconda#402</a></li>
</ul>
<h3>Tasks and Maintenance</h3>
<ul>
<li>Bump conda-incubator/setup-miniconda from 3.1.0 to 3.1.1 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in
<a href="">conda-incubator/setup-miniconda#391</a></li>
<li>Bump undici from 5.28.4 to 5.28.5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in
<a href="">conda-incubator/setup-miniconda#390</a></li>
<li>Bump semver and <code>@​types/semver</code> by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in
<a href="">conda-incubator/setup-miniconda#399</a></li>
</ul>
<h2><a href="https://github.com/conda-incubator/setup-miniconda/releases/tag/v3.1.1">v3.1.1</a> (2025-01-20)</h2>
<h3>Fixes</h3>
<ul>
<li><a href="">#378</a>: Make <code>nodefaults</code> warning more explicit</li>
<li><a href="">#387</a>: Detect and support Linux ARM runners for both Miniconda and Miniforge</li>
</ul>
<h3>Tasks and Maintenance</h3>
<ul>
<li><a href="">#374</a>: Bump conda-incubator/setup-miniconda from 3.0.4 to 3.1.0</li>
<li><a href="">#375</a>: Bump actions/cache from 3 to 4</li>
<li><a href="">#384</a>: Bump <code>@​actions/tool-cache</code> from 2.0.1 to 2.0.2</li>
<li><a href="">#386</a>: Fix link to example 14</li>
<li><a href="">#388</a>: Fix mamba 1.x examples</li>
</ul>
<p><a href="">#374</a>: <a href="">conda-incubator/setup-miniconda#374</a>
<a href="">#375</a>: <a href="">conda-incubator/setup-miniconda#375</a>
<a href="">#378</a>: <a href="">conda-incubator/setup-miniconda#378</a>
<a href="">#384</a>: <a href="">conda-incubator/setup-miniconda#384</a>
<a href="">#386</a>: <a href="">conda-incubator/setup-miniconda#386</a>
<a href="">#387</a>: <a href="">conda-incubator/setup-miniconda#387</a>
<a href="">#388</a>: <a href="">conda-incubator/setup-miniconda#388</a></p>
<h2>[v3.1.0] (2024-10-31)</h2>
<h3>Features</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8352349</code></a> Merge pull request <a href="">#403</a> from conda-incubator/prepare-3.2.0</li>
<li><a href=""><code>07746af</code></a> Format via <code>npm run prettier:format</code></li>
<li><a href=""><code>b0c4eb8</code></a> Update CHANGELOG.md</li>
<li><a href=""><code>5dc2927</code></a> Bump semver from 7.7.1 to 7.7.2 (<a href="">#400</a>)</li>
<li><a href=""><code>91c4acc</code></a> Merge pull request <a href="">#402</a> from conda-incubator/auto-activate-base</li>
<li><a href=""><code>0b3329e</code></a> Workaround for auto_activate_base deprecation</li>
<li><a href=""><code>7470d07</code></a> Merge pull request <a href="">#399</a> from conda-incubator/dependabot/npm_and_yarn/main/mul...</li>
<li><a href=""><code>598ddbc</code></a> Commit result of <code>npm run build</code></li>
<li><a href=""><code>f0b2634</code></a> Bump semver and <code>@​types/semver</code></li>
<li><a href=""><code>e497204</code></a> Bump undici from 5.28.4 to 5.28.5 (<a href="">#390</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/conda-incubator/setup-miniconda/compare/505e6394dae86d6a5c7fbb6e3fb8938e3e863830...835234971496cad1653abb28a638a281cf32541f">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=conda-incubator/setup-miniconda&package-manager=github_actions&previous-version=3.1.1&new-version=3.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `54e782609e7b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.