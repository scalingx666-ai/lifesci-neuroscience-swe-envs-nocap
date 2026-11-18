# Issue

**Title:** [dependabot]: Bump the deps group with 6 updates

## Description

Bumps the deps group with 6 updates:

| Package | From | To |
| --- | --- | --- |
| [autoreject](https://github.com/autoreject/autoreject) | `0.4.3` | `0.4.4` |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.29.1` | `3.29.3` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.16` | `0.15.17` |
| [tombi](https://github.com/tombi-toml/tombi) | `1.1.2` | `1.1.3` |
| [tqdm](https://github.com/tqdm/tqdm) | `4.68.1` | `4.68.2` |
| [ty](https://github.com/astral-sh/ty) | `0.0.44` | `0.0.48` |

Updates `autoreject` from 0.4.3 to 0.4.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/autoreject/autoreject/releases">autoreject's releases</a>.</em></p>
<blockquote>
<h2>v0.4.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Update <strong>init</strong>.py by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">autoreject/autoreject#325</a></li>
<li>drop support for py&lt;3.9 by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">autoreject/autoreject#326</a></li>
<li>Move project and build configuration to <code>pyproject.toml</code> and use <code>setuptools-scm</code> for generating package version from Git tags by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">autoreject/autoreject#328</a></li>
<li>Switch build backend to hatchling by <a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> in <a href="">autoreject/autoreject#335</a></li>
<li>remove ref-names from .git_archival.txt by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">autoreject/autoreject#338</a></li>
<li>Bump Py version 3.10 by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">autoreject/autoreject#339</a></li>
<li>Fix kernel parameters by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">autoreject/autoreject#352</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/hoechenberger"><code>@​hoechenberger</code></a> made their first contribution in <a href="">autoreject/autoreject#328</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/autoreject/autoreject/compare/v0.4.3...v0.4.4">https://github.com/autoreject/autoreject/compare/v0.4.3...v0.4.4</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>29bec2a</code></a> Fix kernel parameters (<a href="">#352</a>)</li>
<li><a href=""><code>16be71c</code></a> [dependabot]: Bump codecov/codecov-action from 5 to 6 in the actions group (#...</li>
<li><a href=""><code>af14df6</code></a> Bump actions/cache from 4 to 5 (<a href="">#346</a>)</li>
<li><a href=""><code>570a6e5</code></a> MAINT: Try automerge [ci skip]</li>
<li><a href=""><code>256b416</code></a> Bump actions/checkout from 5 to 6 (<a href="">#345</a>)</li>
<li><a href=""><code>68f3097</code></a> Bump actions/setup-python from 5 to 6 (<a href="">#343</a>)</li>
<li><a href=""><code>f9675cd</code></a> Bump actions/checkout from 4 to 5 (<a href="">#342</a>)</li>
<li><a href=""><code>e32e9e8</code></a> Bump codecov/codecov-action from 4 to 5 (<a href="">#340</a>)</li>
<li><a href=""><code>4cc3342</code></a> Bump Py version 3.10 (<a href="">#339</a>)</li>
<li><a href=""><code>5b7a7e6</code></a> remove ref-names from .git_archival.txt (<a href="">#338</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/autoreject/autoreject/compare/v0.4.3...v0.4.4">compare view</a></li>
</ul>
</details>
<br />

Updates `filelock` from 3.29.1 to 3.29.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.29.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🔧 ci(release): publish to PyPI on tag push by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#557</a></li>
<li>validate pid range in _parse_lock_holder by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#556</a></li>
<li>🐛 fix(ci): restore release environment on tag job by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#559</a></li>
<li>🐛 fix(ci): publish from release.yaml on tag push by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#560</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.29.2...3.29.3">https://github.com/tox-dev/filelock/compare/3.29.2...3.29.3</a></p>
<h2>3.29.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>open marker reads non-blocking to refuse attacker-placed fifo by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#549</a></li>
<li>🔒 fix(soft): harden stale-lock breaking and self-heal malformed locks by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#551</a></li>
<li>check hostname in is_lock_held_by_us by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#553</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.29.1...3.29.2">https://github.com/tox-dev/filelock/compare/3.29.1...3.29.2</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/filelock/blob/main/docs/changelog.rst">filelock's changelog</a>.</em></p>
<blockquote>
<p>###########
Changelog
###########</p>
<hr />
<p>3.29.3 (2026-06-10)</p>
<hr />
<ul>
<li>🐛 fix(ci): restore release environment on tag job :pr:<code>559</code></li>
<li>validate pid range in _parse_lock_holder :pr:<code>556</code> - by :user:<code>dxbjavid</code></li>
<li>🔧 ci(release): publish to PyPI on tag push :pr:<code>557</code></li>
<li>build(deps): bump astral-sh/setup-uv from 8.1.0 to 8.2.0 :pr:<code>558</code> - by :user:<code>dependabot[bot]</code></li>
</ul>
<hr />
<p>3.29.2 (2026-06-10)</p>
<hr />
<ul>
<li>build(deps): bump actions/checkout from 6.0.2 to 6.0.3 :pr:<code>555</code> - by :user:<code>dependabot[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>554</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>check hostname in is_lock_held_by_us :pr:<code>553</code> - by :user:<code>dxbjavid</code></li>
<li>🔒 fix(soft): harden stale-lock breaking and self-heal malformed locks :pr:<code>551</code></li>
<li>open marker reads non-blocking to refuse attacker-placed fifo :pr:<code>549</code> - by :user:<code>dxbjavid</code></li>
</ul>
<hr />
<p>3.29.1 (2026-06-03)</p>
<hr />
<ul>
<li>🐛 fix(soft): refuse to follow symlinks when reading the lock file :pr:<code>548</code> - by :user:<code>dxbjavid</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>547</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>546</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>chore: improve filelock maintenance path :pr:<code>545</code> - by :user:<code>lphuc2250gma</code></li>
<li>chore: improve filelock maintenance path :pr:<code>544</code> - by :user:<code>lphuc2250gma</code></li>
<li>chore: improve filelock maintenance path :pr:<code>542</code> - by :user:<code>lphuc2250gma</code></li>
<li>docs: clarify per-thread scope of FileLock configuration :pr:<code>543</code> - by :user:<code>Gares95</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>541</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>docs: fix API docs of <code>release()</code> :pr:<code>540</code> - by :user:<code>MrAnno</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>539</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>538</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>537</code> - by :user:<code>pre-commit-ci[bot]</code></li>
<li>build(deps): bump astral-sh/setup-uv from 8.0.0 to 8.1.0 :pr:<code>536</code> - by :user:<code>dependabot[bot]</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>535</code> - by :user:<code>pre-commit-ci[bot]</code></li>
</ul>
<hr />
<p>3.29.0 (2026-04-19)</p>
<hr />
<ul>
<li>✨ feat(soft): enable stale lock detection on Windows :pr:<code>534</code></li>
<li>🐛 fix(async): use single-thread executor for lock consistency :pr:<code>533</code></li>
<li>build(deps): bump actions/upload-artifact from 7.0.0 to 7.0.1 :pr:<code>530</code> - by :user:<code>dependabot[bot]</code></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>85e73d7</code></a> 🐛 fix(ci): publish from release.yaml on tag push (<a href="">#560</a>)</li>
<li><a href=""><code>f86dcb1</code></a> Release 3.29.3</li>
<li><a href=""><code>643bdbe</code></a> 🐛 fix(ci): restore release environment on tag job (<a href="">#559</a>)</li>
<li><a href=""><code>7a8f74a</code></a> validate pid range in _parse_lock_holder (<a href="">#556</a>)</li>
<li><a href=""><code>d1d49a0</code></a> 🔧 ci(release): publish to PyPI on tag push (<a href="">#557</a>)</li>
<li><a href=""><code>b37e162</code></a> build(deps): bump astral-sh/setup-uv from 8.1.0 to 8.2.0 (<a href="">#558</a>)</li>
<li><a href=""><code>d9216de</code></a> Release 3.29.2</li>
<li><a href=""><code>ab6844d</code></a> build(deps): bump actions/checkout from 6.0.2 to 6.0.3 (<a href="">#555</a>)</li>
<li><a href=""><code>b862ead</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#554</a>)</li>
<li><a href=""><code>2ff7c3c</code></a> check hostname in is_lock_held_by_us (<a href="">#553</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.29.1...3.29.3">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.16 to 0.15.17
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.17</h2>
<h2>Release Notes</h2>
<p>Released on 2026-06-11.</p>
<h3>Preview features</h3>
<ul>
<li>Allow human-readable names in suppression comments (<a href="">#25614</a>)</li>
<li>Fix handling of <code>ignore</code> comments within a <code>disable</code>/<code>enable</code> pair (<a href="">#25845</a>)</li>
<li>Prioritize human-readable names in CLI output (<a href="">#25869</a>)</li>
<li>Respect diagnostic start and parent ranges and trailing comments in <code>ruff:ignore</code> suppressions (<a href="">#25673</a>)</li>
<li>[<code>flake8-async</code>] Add <code>trio.as_safe_channel</code> to safe decorators (<code>ASYNC119</code>) (<a href="">#25775</a>)</li>
<li>[<code>flake8-pytest-style</code>] Also check <code>pytest_asyncio</code> fixtures (<a href="">#25375</a>)</li>
<li>[<code>ruff</code>] Ban <code>pytest</code> autouse fixtures (<code>RUF076</code>) (<a href="">#25477</a>)</li>
<li>[<code>pyupgrade</code>] Add <code>from __future__ import annotations</code> automatically (<code>UP007</code>, <code>UP045</code>) (<a href="">#23259</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix diagnostic when <code>ruff:enable</code> or <code>ruff:disable</code> appears where <code>ruff:ignore</code> is expected (<a href="">#25700</a>)</li>
<li>[<code>pyupgrade</code>] Preserve leading empty literals to avoid syntax errors (<code>UP032</code>) (<a href="">#25491</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-pytest-style</code>] Clarify diagnostic message for single parameters (<code>PT007</code>) (<a href="">#25592</a>)</li>
<li>[<code>numpy</code>] Drop autofix for <code>np.in1d</code> (<code>NPY201</code>) (<a href="">#25612</a>)</li>
<li>[<code>pylint</code>] Exempt Python version comparisons (<code>PLR2004</code>) (<a href="">#25743</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Reserve AST <code>Vec</code>s with correct capacity for common cases (<a href="">#25451</a>)</li>
</ul>
<h3>Formatter</h3>
<ul>
<li>Preserve whitespace for Quarto cell option comments (<a href="">#25641</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Allow rule names in <code>ruff rule</code> (<a href="">#25640</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Fix playground diagnostics scrollbars (<a href="">#25642</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/SuryanshSS1011"><code>@​SuryanshSS1011</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/romero-deshaw"><code>@​romero-deshaw</code></a></li>
<li><a href="https://github.com/karlhillx"><code>@​karlhillx</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.17</h2>
<p>Released on 2026-06-11.</p>
<h3>Preview features</h3>
<ul>
<li>Allow human-readable names in suppression comments (<a href="">#25614</a>)</li>
<li>Fix handling of <code>ignore</code> comments within a <code>disable</code>/<code>enable</code> pair (<a href="">#25845</a>)</li>
<li>Prioritize human-readable names in CLI output (<a href="">#25869</a>)</li>
<li>Respect diagnostic start and parent ranges and trailing comments in <code>ruff:ignore</code> suppressions (<a href="">#25673</a>)</li>
<li>[<code>flake8-async</code>] Add <code>trio.as_safe_channel</code> to safe decorators (<code>ASYNC119</code>) (<a href="">#25775</a>)</li>
<li>[<code>flake8-pytest-style</code>] Also check <code>pytest_asyncio</code> fixtures (<a href="">#25375</a>)</li>
<li>[<code>ruff</code>] Ban <code>pytest</code> autouse fixtures (<code>RUF076</code>) (<a href="">#25477</a>)</li>
<li>[<code>pyupgrade</code>] Add <code>from __future__ import annotations</code> automatically (<code>UP007</code>, <code>UP045</code>) (<a href="">#23259</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix diagnostic when <code>ruff:enable</code> or <code>ruff:disable</code> appears where <code>ruff:ignore</code> is expected (<a href="">#25700</a>)</li>
<li>[<code>pyupgrade</code>] Preserve leading empty literals to avoid syntax errors (<code>UP032</code>) (<a href="">#25491</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-pytest-style</code>] Clarify diagnostic message for single parameters (<code>PT007</code>) (<a href="">#25592</a>)</li>
<li>[<code>numpy</code>] Drop autofix for <code>np.in1d</code> (<code>NPY201</code>) (<a href="">#25612</a>)</li>
<li>[<code>pylint</code>] Exempt Python version comparisons (<code>PLR2004</code>) (<a href="">#25743</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Reserve AST <code>Vec</code>s with correct capacity for common cases (<a href="">#25451</a>)</li>
</ul>
<h3>Formatter</h3>
<ul>
<li>Preserve whitespace for Quarto cell option comments (<a href="">#25641</a>)</li>
</ul>
<h3>CLI</h3>
<ul>
<li>Allow rule names in <code>ruff rule</code> (<a href="">#25640</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Fix playground diagnostics scrollbars (<a href="">#25642</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/SuryanshSS1011"><code>@​SuryanshSS1011</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/romero-deshaw"><code>@​romero-deshaw</code></a></li>
<li><a href="https://github.com/karlhillx"><code>@​karlhillx</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7c645a9</code></a> Bump 0.15.17 (<a href="">#25872</a>)</li>
<li><a href=""><code>f381eb1</code></a> Prioritize human-readable names in CLI output (<a href="">#25869</a>)</li>
<li><a href=""><code>b9b4546</code></a> Minor workflow simplification (<a href="">#25870</a>)</li>
<li><a href=""><code>1e77ba0</code></a> [ty] Move <code>PreformattedBlockScanner</code> to format-agnostic location. (<a href="">#25856</a>)</li>
<li><a href=""><code>6f2b772</code></a> [ty] Preserve nominal type of enum.property instances (<a href="">#25849</a>)</li>
<li><a href=""><code>be4777c</code></a> [ty] Fix site-package error when multiple versions of pythons are installed i...</li>
<li><a href=""><code>53f6ff7</code></a> Allow human-readable names in suppression comments (<a href="">#25614</a>)</li>
<li><a href=""><code>6740325</code></a> [ty] Restrict uncached raw signature access (<a href="">#25866</a>)</li>
<li><a href=""><code>970b1bf</code></a> Auto-update snapshots when syncing typeshed (<a href="">#25841</a>)</li>
<li><a href=""><code>0785793</code></a> Fix handling of <code>ignore</code> comments within a <code>disable</code>/<code>enable</code> pair (<a href="">#25845</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.16...0.15.17">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 1.1.2 to 1.1.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v1.1.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚀 New Features</h3>
<ul>
<li>fix(pyproject): keep declarations out of references by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1937</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>docs(install): remove sha256 prefix from checksum example by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1933</a></li>
<li>fix(ci): quote install workflow step name by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1934</a></li>
<li>ci: pin GitHub Actions and tighten defaults by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1935</a></li>
<li>ci: pin npm release tooling versions by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1936</a></li>
<li>ci: use trusted publishing for PyPI release by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1938</a></li>
<li>fix(ci): pass snapcraft matrix platform to build by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1939</a></li>
<li>fix(ci): allow snapcraft cross-build platforms on amd64 by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1940</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.1.2...v1.1.3">https://github.com/tombi-toml/tombi/compare/v1.1.2...v1.1.3</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>362cafb</code></a> fix(ci): allow snapcraft cross-build platforms on amd64 (<a href="">#1940</a>)</li>
<li><a href=""><code>9037292</code></a> Merge pull request <a href="">#1939</a> from tombi-toml/ya7010/investigate-failed-github-act...</li>
<li><a href=""><code>91512a3</code></a> fix(ci): pass snapcraft matrix platform to build</li>
<li><a href=""><code>8ce49eb</code></a> Merge pull request <a href="">#1938</a> from tombi-toml/ya7010/required-reviewers-and-tag-ci</li>
<li><a href=""><code>3f827a9</code></a> ci: allow manual reruns for PyPI tag releases</li>
<li><a href=""><code>27a49c9</code></a> ci: use trusted publishing for PyPI release</li>
<li><a href=""><code>bc9af40</code></a> Merge pull request <a href="">#1937</a> from tombi-toml/ya7010/uv-workspace-references</li>
<li><a href=""><code>0c64025</code></a> Merge branch 'main' into ya7010/uv-workspace-references</li>
<li><a href=""><code>93553a3</code></a> Merge pull request <a href="">#1936</a> from tombi-toml/ya7010/run-option-2-too</li>
<li><a href=""><code>49cf6d6</code></a> ci: use Node 24 for npm trusted publishing</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v1.1.2...v1.1.3">compare view</a></li>
</ul>
</details>
<br />

Updates `tqdm` from 4.68.1 to 4.68.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.68.2 stable</h2>
<ul>
<li>revert accidental change to <code>ascii</code> default (fixes <a href="">#1760</a>)
<ul>
<li><code>UnicodeEncodeError: 'charmap' codec can't encode characters in position 6-7: character maps to &lt;undefined&gt;</code> can be fixed by installing <code>tqdm!=4.68.0,!=4.68.1</code></li>
</ul>
</li>
<li>misc docs updates
<ul>
<li>fix links</li>
<li>replace stray <code>rst</code> -&gt; <code>md</code> syntax</li>
<li>consistent &quot;progress bar&quot; terminology (<a href="">#1737</a>)</li>
</ul>
</li>
<li>tests: fix coverage (fixes <a href="">#1760</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4b33952</code></a> revert accidental change to <code>tqdm(ascii)</code> default</li>
<li><a href=""><code>b10848f</code></a> docs: fix links</li>
<li><a href=""><code>85b62dd</code></a> docs: replace stray rst -&gt; md</li>
<li><a href=""><code>d2fb04a</code></a> docs: mention OpenAI sponsorship</li>
<li><a href=""><code>85940f9</code></a> docs: consistent progress bar terminology</li>
<li><a href=""><code>9dbb36b</code></a> tests: fix coverage</li>
<li>See full diff in <a href="https://github.com/tqdm/tqdm/compare/v4.68.1...v4.68.2">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.44 to 0.0.48
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.48</h2>
<h2>Release Notes</h2>
<p>Released on 2026-06-10.</p>
<h3>Performance</h3>
<ul>
<li>Avoid redundant constraint saturation work (<a href="">#25786</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add support for TypedDict <code>extra_items</code> (<a href="">#25591</a>)</li>
<li>Improve <code>closed=True</code> TypedDict precision (<a href="">#25651</a>)</li>
<li>Require subtyping for transitive constraint pivots (<a href="">#25778</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#25828</a>). <a href="https://github.com/python/typeshed/compare/d3504ddc24c92b960a9661813efcdef10fad6d29...32b95c1f59aa2c8edd7f2a5fd3bdfeed639ee1a7">Typeshed diff</a></li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
</ul>
<h2>Install ty 0.0.48</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-installer.ps1 | iex&quot;
</code></pre>
<h2>Download ty 0.0.48</h2>
<table>
<thead>
<tr>
<th>File</th>
<th>Platform</th>
<th>Checksum</th>
</tr>
</thead>
<tbody>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-aarch64-apple-darwin.tar.gz">ty-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-x86_64-apple-darwin.tar.gz">ty-x86_64-apple-darwin.tar.gz</a></td>
<td>Intel macOS</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-x86_64-apple-darwin.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-aarch64-pc-windows-msvc.zip">ty-aarch64-pc-windows-msvc.zip</a></td>
<td>ARM64 Windows</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-aarch64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-i686-pc-windows-msvc.zip">ty-i686-pc-windows-msvc.zip</a></td>
<td>x86 Windows</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-i686-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-x86_64-pc-windows-msvc.zip">ty-x86_64-pc-windows-msvc.zip</a></td>
<td>x64 Windows</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-x86_64-pc-windows-msvc.zip.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-aarch64-unknown-linux-gnu.tar.gz">ty-aarch64-unknown-linux-gnu.tar.gz</a></td>
<td>ARM64 Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-aarch64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-i686-unknown-linux-gnu.tar.gz">ty-i686-unknown-linux-gnu.tar.gz</a></td>
<td>x86 Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-i686-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-powerpc64-unknown-linux-gnu.tar.gz">ty-powerpc64-unknown-linux-gnu.tar.gz</a></td>
<td>PPC64 Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-powerpc64-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-powerpc64le-unknown-linux-gnu.tar.gz">ty-powerpc64le-unknown-linux-gnu.tar.gz</a></td>
<td>PPC64LE Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-powerpc64le-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-riscv64gc-unknown-linux-gnu.tar.gz">ty-riscv64gc-unknown-linux-gnu.tar.gz</a></td>
<td>RISCV Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-riscv64gc-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
<tr>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-s390x-unknown-linux-gnu.tar.gz">ty-s390x-unknown-linux-gnu.tar.gz</a></td>
<td>S390x Linux</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.48/ty-s390x-unknown-linux-gnu.tar.gz.sha256">checksum</a></td>
</tr>
</tbody>
</table>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.48</h2>
<p>Released on 2026-06-10.</p>
<h3>Performance</h3>
<ul>
<li>Avoid redundant constraint saturation work (<a href="">#25786</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Add support for TypedDict <code>extra_items</code> (<a href="">#25591</a>)</li>
<li>Improve <code>closed=True</code> TypedDict precision (<a href="">#25651</a>)</li>
<li>Require subtyping for transitive constraint pivots (<a href="">#25778</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#25828</a>). <a href="https://github.com/python/typeshed/compare/d3504ddc24c92b960a9661813efcdef10fad6d29...32b95c1f59aa2c8edd7f2a5fd3bdfeed639ee1a7">Typeshed diff</a></li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
</ul>
<h2>0.0.47</h2>
<p>Released on 2026-06-10.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid panicking on encountering a recursive NamedTuple that references a recursive NewType (<a href="">#25764</a>)</li>
<li>Fix out-of-bound panic in notebooks involving suppression comments (<a href="">#25629</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Preserve overloads through callable protocol decorators (<a href="">#25806</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#25779</a>). <a href="https://github.com/python/typeshed/compare/4a47505dd891ac8a94ba7f4b578899c72727ce23...d3504ddc24c92b960a9661813efcdef10fad6d29">Typeshed diff</a></li>
</ul>
<h3>Performance and memory-usage improvements</h3>
<ul>
<li>Avoid caching specialization-invariant known instances (<a href="">#25816</a>)</li>
<li>Avoid resolving overload sets for ordinary functions (<a href="">#25817</a>)</li>
<li>Store common definition inference results inline (<a href="">#25814</a>)</li>
<li>Use <code>Box&lt;SystemPath&gt;</code> etc. in <code>Files</code> (<a href="">#25554</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
</ul>
<h2>0.0.46</h2>
<p>Released on 2026-06-08.</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>10b243d</code></a> Bump version to 0.0.48 (<a href="">#3729</a>)</li>
<li><a href=""><code>c7a02f3</code></a> Automatically trigger new ty-pre-commit releases when we cut a release (<a href="">#3727</a>)</li>
<li><a href=""><code>b6465aa</code></a> Update typing FAQs: we have a pre-commit hook now (<a href="">#3728</a>)</li>
<li><a href=""><code>bd984e5</code></a> Bump version to 0.0.47 (<a href="">#3726</a>)</li>
<li><a href=""><code>dd697a4</code></a> Harden release-script edits around typeshed-sync CHANGELOG entries (<a href="">#3725</a>)</li>
<li><a href=""><code>23c525e</code></a> Ensure the submodule is initialized in <code>release.sh</code> (<a href="">#3724</a>)</li>
<li><a href=""><code>baf9732</code></a> Update actions/checkout action to v6.0.3 (<a href="">#3716</a>)</li>
<li><a href=""><code>0137761</code></a> Update astral-sh/setup-uv action to v8.2.0 (<a href="">#3718</a>)</li>
<li><a href=""><code>b27800a</code></a> Update prek dependencies (<a href="">#3717</a>)</li>
<li><a href=""><code>2917c84</code></a> Bump version to 0.0.46 (<a href="">#3700</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ty/compare/0.0.44...0.0.48">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `da5958bdecc6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.