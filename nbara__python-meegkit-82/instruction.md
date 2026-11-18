# Issue

**Title:** Bump the actions group with 2 updates

## Description

Bumps the actions group with 2 updates: [actions/checkout](https://github.com/actions/checkout) and [actions/setup-python](https://github.com/actions/setup-python).

Updates `actions/checkout` from 3 to 4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/releases">actions/checkout's releases</a>.</em></p>
<blockquote>
<h2>v4.0.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Update default runtime to node20 by <a href="https://github.com/takost"><code>@​takost</code></a> in <a href="">actions/checkout#1436</a></li>
<li>Support fetching without the --progress option by <a href="https://github.com/simonbaird"><code>@​simonbaird</code></a> in <a href="">actions/checkout#1067</a></li>
<li>Release 4.0.0 by <a href="https://github.com/takost"><code>@​takost</code></a> in <a href="">actions/checkout#1447</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/takost"><code>@​takost</code></a> made their first contribution in <a href="">actions/checkout#1436</a></li>
<li><a href="https://github.com/simonbaird"><code>@​simonbaird</code></a> made their first contribution in <a href="">actions/checkout#1067</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v3...v4.0.0">https://github.com/actions/checkout/compare/v3...v4.0.0</a></p>
<h2>v3.6.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Mark test scripts with Bash'isms to be run via Bash by <a href="https://github.com/dscho"><code>@​dscho</code></a> in <a href="">actions/checkout#1377</a></li>
<li>Add option to fetch tags even if fetch-depth &gt; 0 by <a href="https://github.com/RobertWieczoreck"><code>@​RobertWieczoreck</code></a> in <a href="">actions/checkout#579</a></li>
<li>Release 3.6.0 by <a href="https://github.com/luketomlinson"><code>@​luketomlinson</code></a> in <a href="">actions/checkout#1437</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/RobertWieczoreck"><code>@​RobertWieczoreck</code></a> made their first contribution in <a href="">actions/checkout#579</a></li>
<li><a href="https://github.com/luketomlinson"><code>@​luketomlinson</code></a> made their first contribution in <a href="">actions/checkout#1437</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v3.5.3...v3.6.0">https://github.com/actions/checkout/compare/v3.5.3...v3.6.0</a></p>
<h2>v3.5.3</h2>
<h2>What's Changed</h2>
<ul>
<li>Fix: Checkout Issue in self hosted runner due to faulty submodule check-ins by <a href="https://github.com/megamanics"><code>@​megamanics</code></a> in <a href="">actions/checkout#1196</a></li>
<li>Fix typos found by codespell by <a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> in <a href="">actions/checkout#1287</a></li>
<li>Add support for sparse checkouts by <a href="https://github.com/dscho"><code>@​dscho</code></a> and <a href="https://github.com/dfdez"><code>@​dfdez</code></a> in <a href="">actions/checkout#1369</a></li>
<li>Release v3.5.3 by <a href="https://github.com/TingluoHuang"><code>@​TingluoHuang</code></a> in <a href="">actions/checkout#1376</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/megamanics"><code>@​megamanics</code></a> made their first contribution in <a href="">actions/checkout#1196</a></li>
<li><a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> made their first contribution in <a href="">actions/checkout#1287</a></li>
<li><a href="https://github.com/dfdez"><code>@​dfdez</code></a> made their first contribution in <a href="">actions/checkout#1369</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v3...v3.5.3">https://github.com/actions/checkout/compare/v3...v3.5.3</a></p>
<h2>v3.5.2</h2>
<h2>What's Changed</h2>
<ul>
<li>Fix: Use correct API url / endpoint in GHES by <a href="https://github.com/fhammerl"><code>@​fhammerl</code></a> in <a href="">actions/checkout#1289</a> based on <a href="">#1286</a> by <a href="https://github.com/1newsr"><code>@​1newsr</code></a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/checkout/compare/v3.5.1...v3.5.2">https://github.com/actions/checkout/compare/v3.5.1...v3.5.2</a></p>
<h2>v3.5.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Improve checkout performance on Windows runners by upgrading <code>@​actions/github</code> dependency by <a href="https://github.com/BrettDong"><code>@​BrettDong</code></a> in <a href="">actions/checkout#1246</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/BrettDong"><code>@​BrettDong</code></a> made their first contribution in <a href="">actions/checkout#1246</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/actions/checkout/blob/main/CHANGELOG.md">actions/checkout's changelog</a>.</em></p>
<blockquote>
<h1>Changelog</h1>
<h2>v4.2.2</h2>
<ul>
<li><code>url-helper.ts</code> now leverages well-known environment variables by <a href="https://github.com/jww3"><code>@​jww3</code></a> in <a href="">actions/checkout#1941</a></li>
<li>Expand unit test coverage for <code>isGhes</code> by <a href="https://github.com/jww3"><code>@​jww3</code></a> in <a href="">actions/checkout#1946</a></li>
</ul>
<h2>v4.2.1</h2>
<ul>
<li>Check out other refs/* by commit if provided, fall back to ref by <a href="https://github.com/orhantoy"><code>@​orhantoy</code></a> in <a href="">actions/checkout#1924</a></li>
</ul>
<h2>v4.2.0</h2>
<ul>
<li>Add Ref and Commit outputs by <a href="https://github.com/lucacome"><code>@​lucacome</code></a> in <a href="">actions/checkout#1180</a></li>
<li>Dependency updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>- <a href="">actions/checkout#1777</a>, <a href="">actions/checkout#1872</a></li>
</ul>
<h2>v4.1.7</h2>
<ul>
<li>Bump the minor-npm-dependencies group across 1 directory with 4 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1739</a></li>
<li>Bump actions/checkout from 3 to 4 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1697</a></li>
<li>Check out other refs/* by commit by <a href="https://github.com/orhantoy"><code>@​orhantoy</code></a> in <a href="">actions/checkout#1774</a></li>
<li>Pin actions/checkout's own workflows to a known, good, stable version. by <a href="https://github.com/jww3"><code>@​jww3</code></a> in <a href="">actions/checkout#1776</a></li>
</ul>
<h2>v4.1.6</h2>
<ul>
<li>Check platform to set archive extension appropriately by <a href="https://github.com/cory-miller"><code>@​cory-miller</code></a> in <a href="">actions/checkout#1732</a></li>
</ul>
<h2>v4.1.5</h2>
<ul>
<li>Update NPM dependencies by <a href="https://github.com/cory-miller"><code>@​cory-miller</code></a> in <a href="">actions/checkout#1703</a></li>
<li>Bump github/codeql-action from 2 to 3 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1694</a></li>
<li>Bump actions/setup-node from 1 to 4 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1696</a></li>
<li>Bump actions/upload-artifact from 2 to 4 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1695</a></li>
<li>README: Suggest <code>user.email</code> to be <code>41898282+github-actions[bot]@users.noreply.github.com</code> by <a href="https://github.com/cory-miller"><code>@​cory-miller</code></a> in <a href="">actions/checkout#1707</a></li>
</ul>
<h2>v4.1.4</h2>
<ul>
<li>Disable <code>extensions.worktreeConfig</code> when disabling <code>sparse-checkout</code> by <a href="https://github.com/jww3"><code>@​jww3</code></a> in <a href="">actions/checkout#1692</a></li>
<li>Add dependabot config by <a href="https://github.com/cory-miller"><code>@​cory-miller</code></a> in <a href="">actions/checkout#1688</a></li>
<li>Bump the minor-actions-dependencies group with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1693</a></li>
<li>Bump word-wrap from 1.2.3 to 1.2.5 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/checkout#1643</a></li>
</ul>
<h2>v4.1.3</h2>
<ul>
<li>Check git version before attempting to disable <code>sparse-checkout</code> by <a href="https://github.com/jww3"><code>@​jww3</code></a> in <a href="">actions/checkout#1656</a></li>
<li>Add SSH user parameter by <a href="https://github.com/cory-miller"><code>@​cory-miller</code></a> in <a href="">actions/checkout#1685</a></li>
<li>Update <code>actions/checkout</code> version in <code>update-main-version.yml</code> by <a href="https://github.com/jww3"><code>@​jww3</code></a> in <a href="">actions/checkout#1650</a></li>
</ul>
<h2>v4.1.2</h2>
<ul>
<li>Fix: Disable sparse checkout whenever <code>sparse-checkout</code> option is not present <a href="https://github.com/dscho"><code>@​dscho</code></a> in <a href="">actions/checkout#1598</a></li>
</ul>
<h2>v4.1.1</h2>
<ul>
<li>Correct link to GitHub Docs by <a href="https://github.com/peterbe"><code>@​peterbe</code></a> in <a href="">actions/checkout#1511</a></li>
<li>Link to release page from what's new section by <a href="https://github.com/cory-miller"><code>@​cory-miller</code></a> in <a href="">actions/checkout#1514</a></li>
</ul>
<h2>v4.1.0</h2>
<ul>
<li><a href="">Add support for partial checkout filters</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>11bd719</code></a> Prepare 4.2.2 Release (<a href="">#1953</a>)</li>
<li><a href=""><code>e3d2460</code></a> Expand unit test coverage (<a href="">#1946</a>)</li>
<li><a href=""><code>163217d</code></a> <code>url-helper.ts</code> now leverages well-known environment variables. (<a href="">#1941</a>)</li>
<li><a href=""><code>eef6144</code></a> Prepare 4.2.1 release (<a href="">#1925</a>)</li>
<li><a href=""><code>6b42224</code></a> Add workflow file for publishing releases to immutable action package (<a href="">#1919</a>)</li>
<li><a href=""><code>de5a000</code></a> Check out other refs/* by commit if provided, fall back to ref (<a href="">#1924</a>)</li>
<li><a href=""><code>d632683</code></a> Prepare 4.2.0 release (<a href="">#1878</a>)</li>
<li><a href=""><code>6d193bf</code></a> Bump braces from 3.0.2 to 3.0.3 (<a href="">#1777</a>)</li>
<li><a href=""><code>db0cee9</code></a> Bump the minor-npm-dependencies group across 1 directory with 4 updates (<a href="">#1872</a>)</li>
<li><a href=""><code>b684943</code></a> Add Ref and Commit outputs (<a href="">#1180</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/actions/checkout/compare/v3...v4">compare view</a></li>
</ul>
</details>
<br />

Updates `actions/setup-python` from 4 to 5
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/actions/setup-python/releases">actions/setup-python's releases</a>.</em></p>
<blockquote>
<h2>v5.0.0</h2>
<h2>What's Changed</h2>
<p>In scope of this release, we update node version runtime from node16 to node20 (<a href="">actions/setup-python#772</a>). Besides, we update dependencies to the latest versions.</p>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/setup-python/compare/v4.8.0...v5.0.0">https://github.com/actions/setup-python/compare/v4.8.0...v5.0.0</a></p>
<h2>v4.8.0</h2>
<h2>What's Changed</h2>
<p>In scope of this release we added support for GraalPy (<a href="">actions/setup-python#694</a>). You can use this snippet to set up GraalPy:</p>
<pre lang="yaml"><code>steps:
- uses: actions/checkout@v4
- uses: actions/setup-python@v4
  with:
    python-version: 'graalpy-22.3'
- run: python my_script.py
</code></pre>
<p>Besides, the release contains such changes as:</p>
<ul>
<li>Trim python version when reading from file by <a href="https://github.com/FerranPares"><code>@​FerranPares</code></a> in <a href="">actions/setup-python#628</a></li>
<li>Use non-deprecated versions in examples by <a href="https://github.com/jeffwidman"><code>@​jeffwidman</code></a> in <a href="">actions/setup-python#724</a></li>
<li>Change deprecation comment to past tense by <a href="https://github.com/jeffwidman"><code>@​jeffwidman</code></a> in <a href="">actions/setup-python#723</a></li>
<li>Bump <code>@​babel/traverse</code> from 7.9.0 to 7.23.2 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/setup-python#743</a></li>
<li>advanced-usage.md: Encourage the use actions/checkout@v4 by <a href="https://github.com/cclauss"><code>@​cclauss</code></a> in <a href="">actions/setup-python#729</a></li>
<li>Examples now use checkout@v4 by <a href="https://github.com/simonw"><code>@​simonw</code></a> in <a href="">actions/setup-python#738</a></li>
<li>Update actions/checkout to v4 by <a href="https://github.com/dmitry-shibanov"><code>@​dmitry-shibanov</code></a> in <a href="">actions/setup-python#761</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/FerranPares"><code>@​FerranPares</code></a> made their first contribution in <a href="">actions/setup-python#628</a></li>
<li><a href="https://github.com/timfel"><code>@​timfel</code></a> made their first contribution in <a href="">actions/setup-python#694</a></li>
<li><a href="https://github.com/jeffwidman"><code>@​jeffwidman</code></a> made their first contribution in <a href="">actions/setup-python#724</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/setup-python/compare/v4...v4.8.0">https://github.com/actions/setup-python/compare/v4...v4.8.0</a></p>
<h2>v4.7.1</h2>
<h2>What's Changed</h2>
<ul>
<li>Bump word-wrap from 1.2.3 to 1.2.4 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a> in <a href="">actions/setup-python#702</a></li>
<li>Add range validation for toml files by <a href="https://github.com/dmitry-shibanov"><code>@​dmitry-shibanov</code></a> in <a href="">actions/setup-python#726</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/actions/setup-python/compare/v4...v4.7.1">https://github.com/actions/setup-python/compare/v4...v4.7.1</a></p>
<h2>v4.7.0</h2>
<p>In scope of this release, the support for reading python version from pyproject.toml was added (<a href="">actions/setup-python#669</a>).</p>
<pre lang="yaml"><code>      - name: Setup Python
        uses: actions/setup-python@v4
&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0b93645</code></a> Enhance workflows: Add macOS 13 support, upgrade publish-action, and update d...</li>
<li><a href=""><code>9c76e71</code></a> Bump pillow from 7.2 to 10.2.0 in /<strong>tests</strong>/data  (<a href="">#956</a>)</li>
<li><a href=""><code>f4c5a11</code></a> Revise <code>isGhes</code> logic (<a href="">#963</a>)</li>
<li><a href=""><code>19dfb7b</code></a> Bump default versions to latest (<a href="">#905</a>)</li>
<li><a href=""><code>e9675cc</code></a> Merge pull request <a href="">#943</a> from actions/Jcambass-patch-1</li>
<li><a href=""><code>3226af6</code></a> Upgrade IA publish</li>
<li><a href=""><code>70dcb22</code></a> Merge pull request <a href="">#941</a> from actions/Jcambass-patch-1</li>
<li><a href=""><code>65b48c7</code></a> Create publish-immutable-actions.yml</li>
<li><a href=""><code>29a37be</code></a> initial commit (<a href="">#938</a>)</li>
<li><a href=""><code>f677139</code></a> Bump pyinstaller from 3.6 to 5.13.1 in /<strong>tests</strong>/data (<a href="">#923</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/actions/setup-python/compare/v4...v5">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `c9128f279f73`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.