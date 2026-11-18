# Issue

**Title:** Bump pre-commit from 4.3.0 to 4.5.1

## Description

Bumps [pre-commit](https://github.com/pre-commit/pre-commit) from 4.3.0 to 4.5.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/releases">pre-commit's releases</a>.</em></p>
<blockquote>
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
<li>Upgrade <code>ruby-build</code> / <code>rbenv</code>.
<ul>
<li><a href="">#3566</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#3565</a> issue by <a href="https://github.com/MRigal"><code>@​MRigal</code></a>.</li>
</ul>
</li>
<li>Add <code>language: unsupported</code> / <code>language: unsupported_script</code> as aliases for <code>language: system</code> / <code>language: script</code> (which will eventually be deprecated).
<ul>
<li><a href="">#3577</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
<li>Add support docker-in-docker detection for cgroups v2.
<ul>
<li><a href="">#3535</a> PR by <a href="https://github.com/br-rhrbacek"><code>@​br-rhrbacek</code></a>.</li>
<li><a href="">#3360</a> issue by <a href="https://github.com/JasonAlt"><code>@​JasonAlt</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li>Handle when docker gives <code>SecurityOptions: null</code>.
<ul>
<li><a href="">#3537</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#3514</a> issue by <a href="https://github.com/jenstroeger"><code>@​jenstroeger</code></a>.</li>
</ul>
</li>
<li>Fix error context for invalid <code>stages</code> in <code>.pre-commit-config.yaml</code>.
<ul>
<li><a href="">#3576</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pre-commit/pre-commit/blob/main/CHANGELOG.md">pre-commit's changelog</a>.</em></p>
<blockquote>
<h1>4.5.1 - 2025-12-16</h1>
<h3>Fixes</h3>
<ul>
<li>Fix <code>language: python</code> with <code>repo: local</code> without <code>additional_dependencies</code>.
<ul>
<li><a href="">#3597</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h1>4.5.0 - 2025-11-22</h1>
<h3>Features</h3>
<ul>
<li>Add <code>pre-commit hazmat</code>.
<ul>
<li><a href="">#3585</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
<h1>4.4.0 - 2025-11-08</h1>
<h3>Features</h3>
<ul>
<li>Add <code>--fail-fast</code> option to <code>pre-commit run</code>.
<ul>
<li><a href="">#3528</a> PR by <a href="https://github.com/JulianMaurin"><code>@​JulianMaurin</code></a>.</li>
</ul>
</li>
<li>Upgrade <code>ruby-build</code> / <code>rbenv</code>.
<ul>
<li><a href="">#3566</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#3565</a> issue by <a href="https://github.com/MRigal"><code>@​MRigal</code></a>.</li>
</ul>
</li>
<li>Add <code>language: unsupported</code> / <code>language: unsupported_script</code> as aliases
for <code>language: system</code> / <code>language: script</code> (which will eventually be
deprecated).
<ul>
<li><a href="">#3577</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
<li>Add support docker-in-docker detection for cgroups v2.
<ul>
<li><a href="">#3535</a> PR by <a href="https://github.com/br-rhrbacek"><code>@​br-rhrbacek</code></a>.</li>
<li><a href="">#3360</a> issue by <a href="https://github.com/JasonAlt"><code>@​JasonAlt</code></a>.</li>
</ul>
</li>
</ul>
<h3>Fixes</h3>
<ul>
<li>Handle when docker gives <code>SecurityOptions: null</code>.
<ul>
<li><a href="">#3537</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
<li><a href="">#3514</a> issue by <a href="https://github.com/jenstroeger"><code>@​jenstroeger</code></a>.</li>
</ul>
</li>
<li>Fix error context for invalid <code>stages</code> in <code>.pre-commit-config.yaml</code>.
<ul>
<li><a href="">#3576</a> PR by <a href="https://github.com/asottile"><code>@​asottile</code></a>.</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8a0630c</code></a> v4.5.1</li>
<li><a href=""><code>fcbc745</code></a> Merge pull request <a href="">#3597</a> from pre-commit/empty-setup-py</li>
<li><a href=""><code>51592ee</code></a> fix python local template when artifact dirs are present</li>
<li><a href=""><code>67e8faf</code></a> Merge pull request <a href="">#3596</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>c251e6b</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>98ccafa</code></a> Merge pull request <a href="">#3593</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>4895355</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>2cedd58</code></a> Merge pull request <a href="">#3588</a> from pre-commit/pre-commit-ci-update-config</li>
<li><a href=""><code>465192d</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>fd42f96</code></a> Merge pull request <a href="">#3586</a> from pre-commit/zipapp-sha256-file-not-needed</li>
<li>Additional commits viewable in <a href="https://github.com/pre-commit/pre-commit/compare/v4.3.0...v4.5.1">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `76f245903fd5`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.