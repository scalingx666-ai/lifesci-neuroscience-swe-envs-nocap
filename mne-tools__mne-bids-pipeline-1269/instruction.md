# Issue

**Title:** [dependabot]: Bump the deps group with 7 updates

## Description

Bumps the deps group with 7 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.29.4` | `3.29.7` |
| [lefthook](https://github.com/evilmartians/lefthook) | `2.1.9` | `2.1.10` |
| [openneuro-py](https://github.com/openneuro-py/openneuro-py) | `2026.4.1` | `2026.7.0` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.20` | `0.15.21` |
| [tombi](https://github.com/tombi-toml/tombi) | `1.1.7` | `1.2.0` |
| [tqdm](https://github.com/tqdm/tqdm) | `4.68.3` | `4.68.4` |
| [ty](https://github.com/astral-sh/ty) | `0.0.56` | `0.0.57` |

Updates `filelock` from 3.29.4 to 3.29.7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.29.7</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>asyncio: detect cross-instance reentrant deadlocks before the poll loop by <a href="https://github.com/HrachShah"><code>@​HrachShah</code></a> in <a href="">tox-dev/filelock#586</a></li>
<li>🐛 fix(soft_rw): evict non-regular write marker without reading it by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#588</a></li>
<li>_util: drop the dead st_mtime=0 short-circuit in raise_on_not_writable_file by <a href="https://github.com/HrachShah"><code>@​HrachShah</code></a> in <a href="">tox-dev/filelock#589</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.29.6...3.29.7">https://github.com/tox-dev/filelock/compare/3.29.6...3.29.7</a></p>
<h2>3.29.6</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>serialise singleton construction in FileLockMeta by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#581</a></li>
<li>_util: drop the dead st_mtime=0 short-circuit in raise_on_not_writable_file by <a href="https://github.com/HrachShah"><code>@​HrachShah</code></a> in <a href="">tox-dev/filelock#582</a></li>
<li>test: silence fork DeprecationWarning on 3.15 by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#585</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.29.5...3.29.6">https://github.com/tox-dev/filelock/compare/3.29.5...3.29.6</a></p>
<h2>3.29.5</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>serialise read/write release rollback against a concurrent acquire by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#563</a></li>
<li>🔒 fix(soft_rw): refresh held marker through the verified fd by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#565</a></li>
<li>only unlink the writer marker on release if it is still ours by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#566</a></li>
<li>don't follow symlinks in raise_on_not_writable_file by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#567</a></li>
<li>don't complete a writer acquire on a peer's reclaimed marker by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#571</a></li>
<li>use a private break name in break_lock_file by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#576</a></li>
<li>Keep Unix lock files after release by <a href="https://github.com/itscloud0"><code>@​itscloud0</code></a> in <a href="">tox-dev/filelock#577</a></li>
<li>test: fix Windows type check broken by <a href="">#577</a> by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#580</a></li>
<li>roll back a read acquire's open transaction when its SELECT fails by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#575</a></li>
<li>lifetime: reject negative, non-numeric, and bool values at the setter by <a href="https://github.com/HrachShah"><code>@​HrachShah</code></a> in <a href="">tox-dev/filelock#573</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/itscloud0"><code>@​itscloud0</code></a> made their first contribution in <a href="">tox-dev/filelock#577</a></li>
<li><a href="https://github.com/HrachShah"><code>@​HrachShah</code></a> made their first contribution in <a href="">tox-dev/filelock#573</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.29.4...3.29.5">https://github.com/tox-dev/filelock/compare/3.29.4...3.29.5</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>1efb893</code></a> _util: drop the dead st_mtime=0 short-circuit in raise_on_not_writable_file (...</li>
<li><a href=""><code>3547d58</code></a> soft_rw: evict a non-regular write marker without reading it (<a href="">#588</a>)</li>
<li><a href=""><code>616400e</code></a> asyncio: detect cross-instance reentrant deadlocks before the poll loop (<a href="">#586</a>)</li>
<li><a href=""><code>f8b0e93</code></a> test: silence fork DeprecationWarning on 3.15 (<a href="">#585</a>)</li>
<li><a href=""><code>b68be65</code></a> _util: drop the dead st_mtime=0 short-circuit in raise_on_not_writable_file (...</li>
<li><a href=""><code>a833dd9</code></a> serialise singleton construction in FileLockMeta (<a href="">#581</a>)</li>
<li><a href=""><code>bb2f884</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#583</a>)</li>
<li><a href=""><code>da9c3ed</code></a> :moneybag: Surface GitHub Sponsors + thanks.dev</li>
<li><a href=""><code>be56227</code></a> lifetime: reject negative, non-numeric, and bool values at the setter (<a href="">#573</a>)</li>
<li><a href=""><code>1f6cde4</code></a> roll back a read acquire's open transaction when its SELECT fails (<a href="">#575</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.29.4...3.29.7">compare view</a></li>
</ul>
</details>
<br />

Updates `lefthook` from 2.1.9 to 2.1.10
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/releases">lefthook's releases</a>.</em></p>
<blockquote>
<h2>v2.1.10</h2>
<h2>Changelog</h2>
<ul>
<li>c0a32e900407bf3e2e97c99a7dd2e3f2864ba13a deps: July 2026 (<a href="">#1463</a>)</li>
<li>0b87ca6dc643dab804a1aad59c24003ef147c11a deps: June 2026 (<a href="">#1447</a>)</li>
<li>afce7244cf02abaf996ebe87bb557a725e46993e deps: migrate shellescape to al.essio.dev/pkg/shellescape (<a href="">#1443</a>)</li>
<li>fbb61b369b57a17469bd6997d1624608ce977f61 feat: AI coding agents integration (<a href="">#1448</a>)</li>
<li>cbfb4a5db29b46ac8bf399665cd9ada81022b848 fix: make test suite stable when <code>NO_COLOR</code> is set (<a href="">#1449</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/blob/master/CHANGELOG.md">lefthook's changelog</a>.</em></p>
<blockquote>
<h2>2.1.10 (2026-07-08)</h2>
<ul>
<li>deps: July 2026 (<a href="">#1463</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>feat: AI coding agents integration (<a href="">#1448</a>) by <a href=""><code>@​viralpraxis</code></a></li>
<li>docs: fix language (<a href="">#1453</a>) by <a href=""><code>@​pflanze</code></a></li>
<li>fix: make test suite stable when <code>NO_COLOR</code> is set (<a href="">#1449</a>) by <a href=""><code>@​viralpraxis</code></a></li>
<li>deps: June 2026 (<a href="">#1447</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>deps: migrate shellescape to al.essio.dev/pkg/shellescape (<a href="">#1443</a>) by <a href=""><code>@​maguowei</code></a></li>
<li>docs: upgrade docmd (<a href="">#1442</a>) by <a href=""><code>@​mrexox</code></a></li>
<li>docs: use single quotes in example to handle filepaths with $ by <a href=""><code>@​mrexox</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8d9cfec</code></a> 2.1.10: add experimental ai hooks</li>
<li><a href=""><code>c0a32e9</code></a> deps: July 2026 (<a href="">#1463</a>)</li>
<li><a href=""><code>2ceca38</code></a> docs: fix links to new beta feature</li>
<li><a href=""><code>fbb61b3</code></a> feat: AI coding agents integration (<a href="">#1448</a>)</li>
<li><a href=""><code>82a794f</code></a> docs: fix language (<a href="">#1453</a>)</li>
<li><a href=""><code>cbfb4a5</code></a> fix: make test suite stable when <code>NO_COLOR</code> is set (<a href="">#1449</a>)</li>
<li><a href=""><code>0b87ca6</code></a> deps: June 2026 (<a href="">#1447</a>)</li>
<li><a href=""><code>afce724</code></a> deps: migrate shellescape to al.essio.dev/pkg/shellescape (<a href="">#1443</a>)</li>
<li><a href=""><code>b9549b8</code></a> docs: upgrade docmd (<a href="">#1442</a>)</li>
<li><a href=""><code>0bffc85</code></a> docs: use single quotes in example to handle filepaths with $</li>
<li>See full diff in <a href="https://github.com/evilmartians/lefthook/compare/v2.1.9...v2.1.10">compare view</a></li>
</ul>
</details>
<br />

Updates `openneuro-py` from 2026.4.1 to 2026.7.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/openneuro-py/openneuro-py/releases">openneuro-py's releases</a>.</em></p>
<blockquote>
<h2>v2026.7.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Allow passing multiple <code>--include</code> and <code>--excldue</code> values by <a href="https://github.com/DanielCSchad"><code>@​DanielCSchad</code></a> in <a href="">openneuro-py/openneuro-py#349</a></li>
<li>Share a single AsyncClient across download tasks (fixes <a href="">#317</a>) by <a href="https://github.com/bkowshik"><code>@​bkowshik</code></a> in <a href="">openneuro-py/openneuro-py#351</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/DanielCSchad"><code>@​DanielCSchad</code></a> made their first contribution in <a href="">openneuro-py/openneuro-py#349</a></li>
<li><a href="https://github.com/bkowshik"><code>@​bkowshik</code></a> made their first contribution in <a href="">openneuro-py/openneuro-py#351</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/openneuro-py/openneuro-py/compare/v2026.4.1...v2026.7.0">https://github.com/openneuro-py/openneuro-py/compare/v2026.4.1...v2026.7.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8f9a105</code></a> Share a single AsyncClient across download tasks (fixes <a href="">#317</a>) (<a href="">#351</a>)</li>
<li><a href=""><code>e85fead</code></a> Bump the minor-patch group with 4 updates (<a href="">#352</a>)</li>
<li><a href=""><code>a59459f</code></a> Bump the minor-patch group with 4 updates (<a href="">#350</a>)</li>
<li><a href=""><code>874cd40</code></a> Allow passing multiple <code>--include</code> and <code>--excldue</code> values (<a href="">#349</a>)</li>
<li><a href=""><code>230145e</code></a> Bump the minor-patch group with 5 updates (<a href="">#348</a>)</li>
<li><a href=""><code>17bcddd</code></a> Bump actions/checkout from 6 to 7 (<a href="">#347</a>)</li>
<li><a href=""><code>1f548f3</code></a> Bump the minor-patch group with 5 updates (<a href="">#346</a>)</li>
<li><a href=""><code>28aab48</code></a> Bump the minor-patch group with 6 updates (<a href="">#345</a>)</li>
<li><a href=""><code>5332a61</code></a> Bump the minor-patch group with 6 updates (<a href="">#343</a>)</li>
<li><a href=""><code>366ce66</code></a> Bump tombi from 0.11.5 to 1.0.0 in the majors group across 1 directory (<a href="">#341</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/openneuro-py/openneuro-py/compare/v2026.4.1...v2026.7.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.20 to 0.15.21
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.21</h2>
<h2>Release Notes</h2>
<p>Released on 2026-07-09.</p>
<h3>Preview features</h3>
<ul>
<li>Add <code>--add-ignore</code> for adding <code>ruff:ignore</code> comments (<a href="">#26346</a>)</li>
<li>[<code>flake8-comprehensions</code>] Drop <code>C409</code> tuple comprehension preview behavior (<a href="">#25707</a>)</li>
<li>Avoid whitespace normalization when formatting comments (<a href="">#26455</a>)</li>
<li>[<code>pyupgrade</code>] Lint and fix use of deprecated <code>abc</code> decorators (<code>UP051</code>) (<a href="">#26417</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Refine non-empty f-string detection (<a href="">#26526</a>)</li>
<li>Detect syntax errors in individual notebook cells (<a href="">#26419</a>)</li>
<li>[<code>flake8-implicit-str-concat</code>] Fix <code>ISC003</code> autofix incorrectly stripping <code>+</code> from comments (<a href="">#26554</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-executable</code>] Mark <code>EXE004</code> fix as unsafe (<a href="">#26033</a>)</li>
<li>[<code>flake8-pyi</code>] Mark <code>PYI061</code> fixes as unsafe in Python files (<a href="">#26533</a>)</li>
<li>[<code>pydocstyle</code>] Skip <code>overload-with-docstring</code> in stub files (<code>D418</code>) (<a href="">#26318</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid per-token source index visitor calls (<a href="">#26506</a>)</li>
<li>Cache parenthesized expression boundaries in the formatter (<a href="">#26344</a>)</li>
<li>Improve performance of rendering edits in preview mode (<a href="">#26565</a>)</li>
<li>Inline <code>fits_element</code> in formatter (<a href="">#26429</a>)</li>
<li>Inline formatter printing hot paths (<a href="">#26504</a>)</li>
<li>Lazily create builtin bindings (<a href="">#26510</a>)</li>
<li>Skip empty trivia scans in the source indexer (<a href="">#26507</a>)</li>
<li>Use ICF for macOS release builds (<a href="">#25780</a>)</li>
</ul>
<h3>Formatter</h3>
<ul>
<li>Add <code>--extend-exclude</code> to <code>ruff format</code> (<a href="">#26372</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add &quot;How does Ruff's import sorting compare to isort?&quot; link to README (<a href="">#26530</a>)</li>
<li>Fix Mozilla Firefox repository link in README (<a href="">#26537</a>)</li>
<li>[<code>flake8-bandit</code>] Fix misleading docstring for <code>mako-templates</code> (<code>S702</code>) (<a href="">#26432</a>)</li>
<li>[<code>ruff</code>] Fix non-triggering example for <code>if-key-in-dict-del</code> (<code>RUF051</code>) (<a href="">#26433</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/EkriirkE"><code>@​EkriirkE</code></a></li>
<li><a href="https://github.com/tingerrr"><code>@​tingerrr</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.21</h2>
<p>Released on 2026-07-09.</p>
<h3>Preview features</h3>
<ul>
<li>Add <code>--add-ignore</code> for adding <code>ruff:ignore</code> comments (<a href="">#26346</a>)</li>
<li>[<code>flake8-comprehensions</code>] Drop <code>C409</code> tuple comprehension preview behavior (<a href="">#25707</a>)</li>
<li>Avoid whitespace normalization when formatting comments (<a href="">#26455</a>)</li>
<li>[<code>pyupgrade</code>] Lint and fix use of deprecated <code>abc</code> decorators (<code>UP051</code>) (<a href="">#26417</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>Refine non-empty f-string detection (<a href="">#26526</a>)</li>
<li>Detect syntax errors in individual notebook cells (<a href="">#26419</a>)</li>
<li>[<code>flake8-implicit-str-concat</code>] Fix <code>ISC003</code> autofix incorrectly stripping <code>+</code> from comments (<a href="">#26554</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>flake8-executable</code>] Mark <code>EXE004</code> fix as unsafe (<a href="">#26033</a>)</li>
<li>[<code>flake8-pyi</code>] Mark <code>PYI061</code> fixes as unsafe in Python files (<a href="">#26533</a>)</li>
<li>[<code>pydocstyle</code>] Skip <code>overload-with-docstring</code> in stub files (<code>D418</code>) (<a href="">#26318</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid per-token source index visitor calls (<a href="">#26506</a>)</li>
<li>Cache parenthesized expression boundaries in the formatter (<a href="">#26344</a>)</li>
<li>Improve performance of rendering edits in preview mode (<a href="">#26565</a>)</li>
<li>Inline <code>fits_element</code> in formatter (<a href="">#26429</a>)</li>
<li>Inline formatter printing hot paths (<a href="">#26504</a>)</li>
<li>Lazily create builtin bindings (<a href="">#26510</a>)</li>
<li>Skip empty trivia scans in the source indexer (<a href="">#26507</a>)</li>
<li>Use ICF for macOS release builds (<a href="">#25780</a>)</li>
</ul>
<h3>Formatter</h3>
<ul>
<li>Add <code>--extend-exclude</code> to <code>ruff format</code> (<a href="">#26372</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Add &quot;How does Ruff's import sorting compare to isort?&quot; link to README (<a href="">#26530</a>)</li>
<li>Fix Mozilla Firefox repository link in README (<a href="">#26537</a>)</li>
<li>[<code>flake8-bandit</code>] Fix misleading docstring for <code>mako-templates</code> (<code>S702</code>) (<a href="">#26432</a>)</li>
<li>[<code>ruff</code>] Fix non-triggering example for <code>if-key-in-dict-del</code> (<code>RUF051</code>) (<a href="">#26433</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/EkriirkE"><code>@​EkriirkE</code></a></li>
<li><a href="https://github.com/tingerrr"><code>@​tingerrr</code></a></li>
<li><a href="https://github.com/s-rigaud"><code>@​s-rigaud</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3e1f636</code></a> Bump 0.15.21 (<a href="">#26676</a>)</li>
<li><a href=""><code>4059807</code></a> [ty] Infer metaclass-declared attributes on class instances (<a href="">#26512</a>)</li>
<li><a href=""><code>013e5d0</code></a> [ty] Use a dedicated project name type (<a href="">#26665</a>)</li>
<li><a href=""><code>7ad39ad</code></a> [ty] Avoid allocating decorated parameter names (<a href="">#26666</a>)</li>
<li><a href=""><code>c36f662</code></a> Improve performance of rendering edits in preview mode (<a href="">#26565</a>)</li>
<li><a href=""><code>ad26408</code></a> [ty] Gate membership narrowing on <code>__contains__</code> semantics (<a href="">#25964</a>)</li>
<li><a href=""><code>4594ca7</code></a> [ty] Add variant discriminators for <code>CodeGeneratorKind</code> (<a href="">#26659</a>)</li>
<li><a href=""><code>1af03da</code></a> [ty] Pydantic: Fix float conversion in unions (<a href="">#26655</a>)</li>
<li><a href=""><code>a004a36</code></a> [ty] Handle callable classes in solver (<a href="">#26090</a>)</li>
<li><a href=""><code>d8ef3b0</code></a> [ty] Parse all supported Google docstring sections. (<a href="">#26653</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.20...0.15.21">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 1.1.7 to 1.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v1.2.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚨 Breaking Changes</h3>
<ul>
<li>Send CLI diagnostics to stderr by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1991</a></li>
</ul>
<h3>🦅 New Features</h3>
<ul>
<li>Add release asset attestations by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1993</a></li>
</ul>
<h3>🐝 Bug Fixes</h3>
<ul>
<li>fix(lsp): clear diagnostics after document close if workspace-diagnostics is disabled by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1998</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>ci: align release note category emoji by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1990</a></li>
<li>docs: document TOMBI_NO_COLOR by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1997</a></li>
<li>fix(lsp): avoid cloning document URIs by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1999</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.1.7...v1.2.0">https://github.com/tombi-toml/tombi/compare/v1.1.7...v1.2.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b46e34c</code></a> fix(lsp): avoid cloning document URIs (<a href="">#1999</a>)</li>
<li><a href=""><code>4ca711c</code></a> fix(lsp): clear diagnostics after document close (<a href="">#1998</a>)</li>
<li><a href=""><code>479cd5d</code></a> docs: document TOMBI_NO_COLOR (<a href="">#1997</a>)</li>
<li><a href=""><code>3aa3567</code></a> Revert &quot;Revert logging backend from log/env_logger to tracing/tracing-subscri...</li>
<li><a href=""><code>3e331b6</code></a> Revert logging backend from log/env_logger to tracing/tracing-subscriber (<a href="">#1994</a>)</li>
<li><a href=""><code>d2c371a</code></a> Add release asset attestations (<a href="">#1993</a>)</li>
<li><a href=""><code>fdb7f33</code></a> Send CLI diagnostics to stderr (<a href="">#1991</a>)</li>
<li><a href=""><code>48b0db3</code></a> ci: align release note category emoji (<a href="">#1990</a>)</li>
<li><a href=""><code>9f595cd</code></a> docs: update install.sh stable version to 1.1.7</li>
<li>See full diff in <a href="https://github.com/tombi-toml/tombi/compare/v1.1.7...v1.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `tqdm` from 4.68.3 to 4.68.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.68.4 stable</h2>
<ul>
<li>trim to <code>ncols</code> even when <code>'{bar}' not in bar_format</code> (<a href="">#1717</a>, <a href="">#1767</a> &lt;- <a href="">#1658</a>)</li>
<li>fix <code>tqdm.write</code> when <code>stdout=None</code> (<a href="">#1768</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>53d096e</code></a> bump version, merge pull request <a href="">#1768</a> from its-Sohan/fix/write-stdout-none</li>
<li><a href=""><code>74ff992</code></a> fix: prevent tqdm.write from crashing when sys.stdout is none</li>
<li><a href=""><code>3757d0d</code></a> Merge pull requests <a href="">#1717</a> and <a href="">#1767</a> (fixes <a href="">#1658</a>)</li>
<li><a href=""><code>55156ce</code></a> fix: apply disp_trim to all format_meter return paths (<a href="">#1658</a>)</li>
<li>See full diff in <a href="https://github.com/tqdm/tqdm/compare/v4.68.3...v4.68.4">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.56 to 0.0.57
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.57</h2>
<h2>Release Notes</h2>
<p>Released on 2026-07-07.</p>
<h3>Bug fixes</h3>
<ul>
<li>Detect async generator expressions containing await (<a href="">#26568</a>)</li>
<li>Preserve exhaustive gradual match patterns (<a href="">#26523</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Fix selection range behavior for strings (<a href="">#26532</a>)</li>
<li>Recognize that dedent ends doctest block when parsing docstrings for signature help (<a href="">#26552</a>)</li>
<li>Render reStructuredText hyperlinks as Markdown in hover docstrings (<a href="">#25907</a>)</li>
<li>Update <code>__slots__</code> string when renaming an attribute (<a href="">#26438</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Document PYTHONPATH support in module discovery (<a href="">#3889</a>)</li>
</ul>
<h3>Library support</h3>
<ul>
<li>Add support for extra arguments in Pydantic model constructors (<a href="">#26520</a>)</li>
<li>Detect Pydantic model configurations (<a href="">#26573</a>)</li>
<li>Distinguish lax and strict mode for Pydantic models (<a href="">#26587</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Fix subtyping/assignability for <code>@property</code> protocol members (<a href="">#25332</a>)</li>
<li>Narrow <code>isinstance</code> against intersections containing invalid member (<a href="">#26545</a>)</li>
<li>Narrow match subjects through structural patterns (<a href="">#25942</a>)</li>
<li>Preserve generic <code>functools.partial</code> signatures (<a href="">#24583</a>)</li>
<li>Preserve generic variadic callback semantics (<a href="">#26521</a>)</li>
<li>Preserve invariant materialization on generic specializations (<a href="">#26578</a>)</li>
<li>Preserve literal enum member names (<a href="">#26592</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid exponential invariant constraint paths (<a href="">#26538</a>)</li>
<li>Batch parallel jobs when finding references (<a href="">#26534</a>)</li>
<li>Build module names directly in <code>CompactString</code> (<a href="">#26546</a>)</li>
<li>Elide default use-def state (<a href="">#26398</a>)</li>
<li>Reuse owned buffers for string literals (<a href="">#26547</a>)</li>
<li>Use ICF for macOS release builds (<a href="">#3709</a>)</li>
<li>Use cached class literal lookup for <code>is_subclass_of</code> (<a href="">#26585</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.57</h2>
<p>Released on 2026-07-07.</p>
<h3>Bug fixes</h3>
<ul>
<li>Detect async generator expressions containing await (<a href="">#26568</a>)</li>
<li>Preserve exhaustive gradual match patterns (<a href="">#26523</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Fix selection range behavior for strings (<a href="">#26532</a>)</li>
<li>Recognize that dedent ends doctest block when parsing docstrings for signature help (<a href="">#26552</a>)</li>
<li>Render reStructuredText hyperlinks as Markdown in hover docstrings (<a href="">#25907</a>)</li>
<li>Update <code>__slots__</code> string when renaming an attribute (<a href="">#26438</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Document PYTHONPATH support in module discovery (<a href="">#3889</a>)</li>
</ul>
<h3>Library support</h3>
<ul>
<li>Add support for extra arguments in Pydantic model constructors (<a href="">#26520</a>)</li>
<li>Detect Pydantic model configurations (<a href="">#26573</a>)</li>
<li>Distinguish lax and strict mode for Pydantic models (<a href="">#26587</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Fix subtyping/assignability for <code>@property</code> protocol members (<a href="">#25332</a>)</li>
<li>Narrow <code>isinstance</code> against intersections containing invalid member (<a href="">#26545</a>)</li>
<li>Narrow match subjects through structural patterns (<a href="">#25942</a>)</li>
<li>Preserve generic <code>functools.partial</code> signatures (<a href="">#24583</a>)</li>
<li>Preserve generic variadic callback semantics (<a href="">#26521</a>)</li>
<li>Preserve invariant materialization on generic specializations (<a href="">#26578</a>)</li>
<li>Preserve literal enum member names (<a href="">#26592</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid exponential invariant constraint paths (<a href="">#26538</a>)</li>
<li>Batch parallel jobs when finding references (<a href="">#26534</a>)</li>
<li>Build module names directly in <code>CompactString</code> (<a href="">#26546</a>)</li>
<li>Elide default use-def state (<a href="">#26398</a>)</li>
<li>Reuse owned buffers for string literals (<a href="">#26547</a>)</li>
<li>Use ICF for macOS release builds (<a href="">#3709</a>)</li>
<li>Use cached class literal lookup for <code>is_subclass_of</code> (<a href="">#26585</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/fenghourun"><code>@​fenghourun</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>03cfaaf</code></a> Bump version to 0.0.57 (<a href="">#3927</a>)</li>
<li><a href=""><code>1b3b573</code></a> Update actions/attest-build-provenance action to v4.1.1 (<a href="">#3928</a>)</li>
<li><a href=""><code>0e9cbe1</code></a> Update actions/cache action to v6.1.0 (<a href="">#3930</a>)</li>
<li><a href=""><code>83f4009</code></a> Update actions/setup-python action to v6.3.0 (<a href="">#3931</a>)</li>
<li><a href=""><code>ad99bb9</code></a> Update prek dependencies (<a href="">#3929</a>)</li>
<li><a href=""><code>aeeeed5</code></a> Update astral-sh/setup-uv action to v8.3.1 (<a href="">#3932</a>)</li>
<li><a href=""><code>d171a78</code></a> Document PYTHONPATH support in module discovery (<a href="">#3889</a>)</li>
<li><a href=""><code>c6920a2</code></a> Fix trailing whitespace (<a href="">#3911</a>)</li>
<li><a href=""><code>546f220</code></a> chore: pin pre-commit refs and lock prek in CI (<a href="">#3897</a>)</li>
<li><a href=""><code>4767fce</code></a> Revert &quot;Revert &quot;Use ICF for macOS release builds&quot;&quot; (<a href="">#3901</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ty/compare/0.0.56...0.0.57">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `ae2f84ca4ddc`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.