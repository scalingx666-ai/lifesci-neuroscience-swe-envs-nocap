# Issue

**Title:** chore(deps): bump the python group with 3 updates

## Description

Bumps the python group with 3 updates: [indexed-gzip](https://github.com/pauldmccarthy/indexed_gzip), [ruff](https://github.com/astral-sh/ruff) and [mypy](https://github.com/python/mypy).

Updates `indexed-gzip` from 1.10.1 to 1.10.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pauldmccarthy/indexed_gzip/releases">indexed-gzip's releases</a>.</em></p>
<blockquote>
<h2>1.10.3</h2>
<p>Changes in this release:</p>
<ul>
<li>Adjust <code>pyproject.toml</code> for compatibility with older <code>setuptools</code> versions (<a href="">#178</a>).</li>
</ul>
<h2>1.10.2</h2>
<p>Changes in this release:</p>
<ul>
<li>Adjust the <code>IndexedGzipFile</code> class so it accepts <code>pathlib.Path</code> objects  (<a href="">#177</a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pauldmccarthy/indexed_gzip/blob/main/CHANGELOG.md">indexed-gzip's changelog</a>.</em></p>
<blockquote>
<h2>1.10.3 (December 8th 2025)</h2>
<ul>
<li>Adjust <code>pyproject.toml</code> for compatibility with older <code>setuptools</code> versions (<a href="">#178</a>).</li>
</ul>
<h2>1.10.2 (December 8th 2025)</h2>
<ul>
<li>Adjust the <code>IndexedGzipFile</code> class so it accepts <code>pathlib.Path</code> objects  (<a href="">#177</a>).</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>62de264</code></a> Merge pull request <a href="">#178</a> from pauldmccarthy/mnt/setuptools</li>
<li><a href=""><code>ebeb429</code></a> MNT: cython-coverage should no longer be required, and the package appears to</li>
<li><a href=""><code>e26706d</code></a> CI: typo</li>
<li><a href=""><code>ce86274</code></a> DOC: Changelog</li>
<li><a href=""><code>9e1cea6</code></a> This is seriously fucking ridiculous. Using the new license format makes it</li>
<li><a href=""><code>2c43df2</code></a> Merge pull request <a href="">#177</a> from pauldmccarthy/mnt/pathlib</li>
<li><a href=""><code>cd46a1a</code></a> DOC: Changelog</li>
<li><a href=""><code>db65ea4</code></a> CI: Try to make pip happy</li>
<li><a href=""><code>df6daf6</code></a> CI: Add 3.14 to testing</li>
<li><a href=""><code>89fae01</code></a> CI: Make sure setuptools is up to date</li>
<li>Additional commits viewable in <a href="https://github.com/pauldmccarthy/indexed_gzip/compare/v1.10.1...v1.10.3">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.14.8 to 0.14.13
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.14.13</h2>
<h2>Release Notes</h2>
<p>Released on 2026-01-15.</p>
<p>This is a follow-up release to 0.14.12. Because of an issue publishing the WASM packages, there is no GitHub release or Git tag for 0.14.12, although the package was published to PyPI. The contents of the 0.14.13 release are identical to 0.14.12.</p>
<h2>0.14.12</h2>
<h3>Preview features</h3>
<ul>
<li>[<code>flake8-blind-except</code>] Allow more logging methods (<code>BLE001</code>) (<a href="">#22057</a>)</li>
<li>[<code>ruff</code>] Respect <code>lint.pydocstyle.property-decorators</code> in <code>RUF066</code> (<a href="">#22515</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix configuration path in <code>--show-settings</code> (<a href="">#22478</a>)</li>
<li>Respect <code>fmt: skip</code> for multiple statements on the same logical line (<a href="">#22119</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pydocstyle</code>] Update Rust crate imperative to v1.0.7 (<code>D401</code>) (<a href="">#22519</a>)</li>
<li>[<code>isort</code>] Insert imports in alphabetical order (<code>I002</code>) (<a href="">#22493</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add llms.txt support for documentation (<a href="">#22463</a>)</li>
<li>Use prek in documentation and CI (<a href="">#22505</a>)</li>
<li>[<code>flake8-pytest-style</code>] Add <code>check</code> parameter example to <code>PT017</code> docs (<a href="">#22546</a>)</li>
<li>[<code>ruff</code>] Make example error out-of-the-box (<code>RUF103</code>) (<a href="">#22558</a>)</li>
<li>[<code>ruff</code>] document <code>RUF100</code> trailing comment fix behavior (<a href="">#22479</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>wasm: Require explicit logging initialization (<a href="">#22587</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/terror"><code>@​terror</code></a></li>
<li><a href="https://github.com/harupy"><code>@​harupy</code></a></li>
<li><a href="https://github.com/Jkhall81"><code>@​Jkhall81</code></a></li>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/lubaskinc0de"><code>@​lubaskinc0de</code></a></li>
<li><a href="https://github.com/zanieb"><code>@​zanieb</code></a></li>
<li><a href="https://github.com/MeGaGiGaGon"><code>@​MeGaGiGaGon</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/renovate"><code>@​renovate</code></a></li>
<li><a href="https://github.com/dylwil3"><code>@​dylwil3</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/11happy"><code>@​11happy</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.14.13</h2>
<p>Released on 2026-01-15.</p>
<p>This is a follow-up release to 0.14.12. Because of an issue publishing the WASM packages, there is no GitHub release or Git tag for 0.14.12, although the package was published to PyPI. The contents of the 0.14.13 release are identical to 0.14.12.</p>
<h2>0.14.12</h2>
<p>Released on 2026-01-15.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>flake8-blind-except</code>] Allow more logging methods (<code>BLE001</code>) (<a href="">#22057</a>)</li>
<li>[<code>ruff</code>] Respect <code>lint.pydocstyle.property-decorators</code> in <code>RUF066</code> (<a href="">#22515</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Fix configuration path in <code>--show-settings</code> (<a href="">#22478</a>)</li>
<li>Respect <code>fmt: skip</code> for multiple statements on the same logical line (<a href="">#22119</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pydocstyle</code>] Update Rust crate imperative to v1.0.7 (<code>D401</code>) (<a href="">#22519</a>)</li>
<li>[<code>isort</code>] Insert imports in alphabetical order (<code>I002</code>) (<a href="">#22493</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add llms.txt support for documentation (<a href="">#22463</a>)</li>
<li>Use prek in documentation and CI (<a href="">#22505</a>)</li>
<li>[<code>flake8-pytest-style</code>] Add <code>check</code> parameter example to <code>PT017</code> docs (<a href="">#22546</a>)</li>
<li>[<code>ruff</code>] Make example error out-of-the-box (<code>RUF103</code>) (<a href="">#22558</a>)</li>
<li>[<code>ruff</code>] document <code>RUF100</code> trailing comment fix behavior (<a href="">#22479</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>wasm: Require explicit logging initialization (<a href="">#22587</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/terror"><code>@​terror</code></a></li>
<li><a href="https://github.com/harupy"><code>@​harupy</code></a></li>
<li><a href="https://github.com/Jkhall81"><code>@​Jkhall81</code></a></li>
<li><a href="https://github.com/dhruvmanila"><code>@​dhruvmanila</code></a></li>
<li><a href="https://github.com/lubaskinc0de"><code>@​lubaskinc0de</code></a></li>
<li><a href="https://github.com/zanieb"><code>@​zanieb</code></a></li>
<li><a href="https://github.com/MeGaGiGaGon"><code>@​MeGaGiGaGon</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/renovate"><code>@​renovate</code></a></li>
<li><a href="https://github.com/dylwil3"><code>@​dylwil3</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b4b8299</code></a> [ty] Make <code>NamedTuple(...)</code> and <code>namedtuple(...)</code> calls stricter (<a href="">#22601</a>)</li>
<li><a href=""><code>fd9f87d</code></a> Bump 0.14.13 (<a href="">#22604</a>)</li>
<li><a href=""><code>048f02f</code></a> [ty] Remove redundant re-exports that share the same top-most module</li>
<li><a href=""><code>a72af10</code></a> [ty] Add <code>ModuleName::top</code></li>
<li><a href=""><code>2f34836</code></a> [ty] Add test capturing redundant re-exports from pandas</li>
<li><a href=""><code>db9eee7</code></a> [ty] Attach origin module on to re-exported symbols</li>
<li><a href=""><code>2cbd68a</code></a> [ty] Move fully qualified name into auto-import implementation</li>
<li><a href=""><code>2a09467</code></a> Add trailing slashes to <code>npm publish</code> paths (<a href="">#22603</a>)</li>
<li><a href=""><code>eca58ca</code></a> [ty] Override <code>__file__</code> to str when applicable on imported modules (<a href="">#22333</a>)</li>
<li><a href=""><code>aa9f1b2</code></a> Further improvements to typing conformance script (<a href="">#22596</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.14.8...0.14.13">compare view</a></li>
</ul>
</details>
<br />

Updates `mypy` from 1.19.0 to 1.19.1
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/python/mypy/blob/master/CHANGELOG.md">mypy's changelog</a>.</em></p>
<blockquote>
<h3>Mypy 1.19.1</h3>
<ul>
<li>Fix noncommutative joins with bounded TypeVars (Shantanu, PR <a href="">20345</a>)</li>
<li>Respect output format for cached runs by serializing raw errors in cache metas (Ivan Levkivskyi, PR <a href="">20372</a>)</li>
<li>Allow <code>types.NoneType</code> in match cases (A5rocks, PR <a href="">20383</a>)</li>
<li>Fix mypyc generator regression with empty tuple (BobTheBuidler, PR <a href="">20371</a>)</li>
<li>Fix crash involving Unpack-ed TypeVarTuple (Shantanu, PR <a href="">20323</a>)</li>
<li>Fix crash on star import of redefinition (Ivan Levkivskyi, PR <a href="">20333</a>)</li>
<li>Fix crash on typevar with forward ref used in other module (Ivan Levkivskyi, PR <a href="">20334</a>)</li>
<li>Fail with an explicit error on PyPy (Ivan Levkivskyi, PR <a href="">20389</a>)</li>
</ul>
<h3>Acknowledgements</h3>
<p>Thanks to all mypy contributors who contributed to this release:</p>
<ul>
<li>A5rocks</li>
<li>BobTheBuidler</li>
<li>bzoracler</li>
<li>Chainfire</li>
<li>Christoph Tyralla</li>
<li>David Foster</li>
<li>Frank Dana</li>
<li>Guo Ci</li>
<li>iap</li>
<li>Ivan Levkivskyi</li>
<li>James Hilton-Balfe</li>
<li>jhance</li>
<li>Joren Hammudoglu</li>
<li>Jukka Lehtosalo</li>
<li>KarelKenens</li>
<li>Kevin Kannammalil</li>
<li>Marc Mueller</li>
<li>Michael Carlstrom</li>
<li>Michael J. Sullivan</li>
<li>Piotr Sawicki</li>
<li>Randolf Scholz</li>
<li>Shantanu</li>
<li>Sigve Sebastian Farstad</li>
<li>sobolevn</li>
<li>Stanislav Terliakov</li>
<li>Stephen Morton</li>
<li>Theodore Ando</li>
<li>Thiago J. Barbalho</li>
<li>wyattscarpenter</li>
</ul>
<p>I’d also like to thank my employer, Dropbox, for supporting mypy development.</p>
<h2>Mypy 1.18</h2>
<p>We’ve just uploaded mypy 1.18.1 to the Python Package Index (<a href="https://pypi.org/project/mypy/">PyPI</a>).
Mypy is a static type checker for Python. This release includes new features, performance</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>412c19a</code></a> Bump version to 1.19.1</li>
<li><a href=""><code>20aea0a</code></a> Update changelog for 1.19.1 (<a href="">#20414</a>)</li>
<li><a href=""><code>2b23b50</code></a> Serialize raw errors in cache metas (<a href="">#20372</a>)</li>
<li><a href=""><code>f60f90f</code></a> Fail on PyPy in main instead of setup.py (<a href="">#20389</a>)</li>
<li><a href=""><code>58d485b</code></a> Fail with an explicit error on PyPy (<a href="">#20384</a>)</li>
<li><a href=""><code>a4b31a2</code></a> Allow <code>types.NoneType</code> in match cases (<a href="">#20383</a>)</li>
<li><a href=""><code>8a6eff4</code></a> [mypyc] fix generator regression with empty tuple (<a href="">#20371</a>)</li>
<li><a href=""><code>70eceea</code></a> Fix noncommutative joins with bounded TypeVars (<a href="">#20345</a>)</li>
<li><a href=""><code>3890fc4</code></a> Fix crash involving Unpack-ed TypeVarTuple (<a href="">#20323</a>)</li>
<li><a href=""><code>c93d917</code></a> Fix crash on star import of redefinition (<a href="">#20333</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/python/mypy/compare/v1.19.0...v1.19.1">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f105777ffcd0`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.