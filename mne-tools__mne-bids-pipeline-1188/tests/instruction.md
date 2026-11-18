# Issue

**Title:** [dependabot]: Bump the deps group with 9 updates

## Description

Bumps the deps group with 9 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.24.3` | `3.25.0` |
| [nibabel](https://github.com/nipy/nibabel) | `5.3.3` | `5.4.0` |
| [codespell](https://github.com/codespell-project/codespell) | `2.4.1` | `2.4.2` |
| [lefthook](https://github.com/evilmartians/lefthook) | `2.0.15` | `2.1.2` |
| [openneuro-py](https://github.com/hoechenberger/openneuro-py) | `2026.1.0` | `2026.3.0` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.4` | `0.15.5` |
| [tombi](https://github.com/tombi-toml/tombi) | `0.7.33` | `0.9.0` |
| [ty](https://github.com/astral-sh/ty) | `0.0.19` | `0.0.21` |
| [mkdocs-material](https://github.com/squidfunk/mkdocs-material) | `9.7.3` | `9.7.4` |

Updates `filelock` from 3.24.3 to 3.25.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.25.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Add permissions to check workflow by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#500</a></li>
<li>Move SECURITY.md to .github/SECURITY.md by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#501</a></li>
<li>Standardize .github files to .yaml suffix by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#504</a></li>
<li>✨ feat(async): add AsyncReadWriteLock by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#506</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.24.4...3.25.0">https://github.com/tox-dev/filelock/compare/3.24.4...3.25.0</a></p>
<h2>3.24.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Suppress ValueError in _try_break_stale_lock for corrupted lock files by <a href="https://github.com/bysiber"><code>@​bysiber</code></a> in <a href="">tox-dev/filelock#496</a></li>
<li>Fix ValueError in _acquire_transaction_lock when blocking=False with timeout by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#498</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/bysiber"><code>@​bysiber</code></a> made their first contribution in <a href="">tox-dev/filelock#496</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.24.3...3.24.4">https://github.com/tox-dev/filelock/compare/3.24.3...3.24.4</a></p>
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
<p>3.25.0 (2026-03-01)</p>
<hr />
<ul>
<li>✨ feat(async): add AsyncReadWriteLock :pr:<code>506</code></li>
<li>Standardize .github files to .yaml suffix</li>
<li>build(deps): bump actions/download-artifact from 7 to 8 :pr:<code>503</code> - by :user:<code>dependabot[bot]</code></li>
<li>build(deps): bump actions/upload-artifact from 6 to 7 :pr:<code>502</code> - by :user:<code>dependabot[bot]</code></li>
<li>Move SECURITY.md to .github/SECURITY.md</li>
<li>Add security policy</li>
<li>Add permissions to check workflow :pr:<code>500</code></li>
<li>[pre-commit.ci] pre-commit autoupdate :pr:<code>499</code> - by :user:<code>pre-commit-ci[bot]</code></li>
</ul>
<hr />
<p>3.24.3 (2026-02-19)</p>
<hr />
<ul>
<li>🐛 fix(unix): handle ENOENT race on FUSE/NFS during acquire :pr:<code>495</code></li>
<li>🐛 fix(ci): add trailing blank line after changelog entries :pr:<code>492</code></li>
</ul>
<hr />
<p>3.24.2 (2026-02-16)</p>
<hr />
<ul>
<li>🐛 fix(rw): close sqlite3 cursors and skip SoftFileLock Windows race :pr:<code>491</code></li>
<li>🐛 fix(test): resolve flaky write non-starvation test :pr:<code>490</code></li>
<li>📝 docs: restructure using Diataxis framework :pr:<code>489</code></li>
</ul>
<hr />
<p>3.24.1 (2026-02-15)</p>
<hr />
<ul>
<li>🐛 fix(soft): resolve Windows deadlock and test race condition :pr:<code>488</code></li>
</ul>
<hr />
<p>3.24.0 (2026-02-14)</p>
<hr />
<ul>
<li>✨ feat(lock): add lifetime parameter for lock expiration (<a href="">#68</a>) :pr:<code>486</code></li>
<li>✨ feat(lock): add cancel_check to acquire (<a href="">#309</a>) :pr:<code>487</code></li>
<li>🐛 fix(api): detect same-thread self-deadlock :pr:<code>481</code></li>
<li>✨ feat(mode): respect POSIX default ACLs (<a href="">#378</a>) :pr:<code>483</code></li>
<li>🐛 fix(win): eliminate lock file race in threaded usage :pr:<code>484</code></li>
<li>✨ feat(lock): add poll_interval to constructor :pr:<code>482</code></li>
<li>🐛 fix(unix): auto-fallback to SoftFileLock on ENOSYS :pr:<code>480</code></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7f195d9</code></a> Release 3.25.0</li>
<li><a href=""><code>df2754e</code></a> ✨ feat(async): add AsyncReadWriteLock (<a href="">#506</a>)</li>
<li><a href=""><code>8a359c5</code></a> Standardize .github files to .yaml suffix</li>
<li><a href=""><code>9e7b33d</code></a> build(deps): bump actions/download-artifact from 7 to 8 (<a href="">#503</a>)</li>
<li><a href=""><code>5fe6836</code></a> build(deps): bump actions/upload-artifact from 6 to 7 (<a href="">#502</a>)</li>
<li><a href=""><code>af265f9</code></a> Move SECURITY.md to .github/SECURITY.md</li>
<li><a href=""><code>67a5569</code></a> Add security policy</li>
<li><a href=""><code>4b8c261</code></a> Add permissions to check workflow (<a href="">#500</a>)</li>
<li><a href=""><code>e749d66</code></a> [pre-commit.ci] pre-commit autoupdate (<a href="">#499</a>)</li>
<li><a href=""><code>721b37b</code></a> Fix ValueError in _acquire_transaction_lock when blocking=False with timeout ...</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.24.3...3.25.0">compare view</a></li>
</ul>
</details>
<br />

Updates `nibabel` from 5.3.3 to 5.4.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/nipy/nibabel/releases">nibabel's releases</a>.</em></p>
<blockquote>
<h2>5.4.0</h2>
<h2>Release notes</h2>
<p>New feature release in the 5.4.x series.</p>
<p>This release requires a minimum Python of 3.10 and NumPy 1.25, and has been tested up to Python 3.14 and NumPy 2.4.</p>
<h2>New features</h2>
<ul>
<li>Add mode parameter to <a href="https://nipy.org/nibabel/reference/nibabel.processing.html#nibabel.processing.conform">nibabel.processing.conform</a> (<a href="">#1396</a>) (Clorindo Notte, reviewed by CM)</li>
</ul>
<h2>Enhancements</h2>
<ul>
<li>Label image axes consistently in cases of extreme obliquity (<a href="">#1450</a>) (Leonardo Ayala, reviewed by CM)</li>
<li>Use <a href="https://docs.python.org/3/library/compression.zstd.html#module-compression.zstd">compressionzstd</a> or <code>backports.zstd</code> in preference to <code>pyzstd</code> (<a href="">#1444</a>) (PM, reviewed by CM)</li>
<li>Support PAR/REC files generated by Philips R11 consoles (<a href="">#1430</a>) (Alex Daniel, reviewed by CM)</li>
<li>Add stub file for top-level nibabel module, improving support in code analyzers (<a href="">#1436</a>) (Jon Cluce, reviewed by CM)</li>
<li>Use informative error message for missing file attribute in <a href="https://nipy.org/nibabel/reference/nibabel.streamlines.html#nibabel.streamlines.tck.TCKFile">TCKFile</a> header (<a href="">#1422</a>) (Jon Haitz Legarreta Gorroño, reviewed by CM)</li>
<li>Support <code>ushort</code> datatypes in MGH/MGZ files (<a href="">#1415</a>) (Benjamin Thyreau, reviewed by CM)</li>
<li>Simplify <a href="https://nipy.org/nibabel/reference/nibabel.cmdline.html#nibabel.cmdline.utils.table2string">nibabel.cmdline.utils.table2string</a> implementation (<a href="">#1403</a>) (CM)</li>
</ul>
<h2>Bug fixes</h2>
<ul>
<li>Fix type-checking errors in <a href="https://nipy.org/nibabel/reference/nibabel.volumeutils.html#nibabel.volumeutils.rec2dict">nibabel.volumeutils.rec2dict</a> (<a href="">#1424</a>) (Jon Haitz Legarreta Gorroño, reviewed by CM)</li>
<li>Adapt to functools.partial becoming a method descriptor in Python 3.14 (<a href="">#1391</a>) (Benjamin Beasley, reviewed by CM)</li>
</ul>
<h2>Maintenance</h2>
<ul>
<li>Split pre-release tests into cron job (<a href="">#1466</a>) (CM, reviewed by Remi Gau)</li>
<li>Adapt to numpy 2.5 deprecation of setting <a href="https://numpy.org/doc/stable/reference/generated/numpy.ndarray.shape.html#numpy.ndarray.shape">shape</a> attributes (<a href="">#1452</a>) (CM)</li>
<li>Document and test support for <a href="https://docs.python.org/3/library/os.html#os.PathLike">osPathLike</a> objects in streamlines APIs (<a href="">#1435</a>) (Jon Haitz Legarreta Gorroño, reviewed by CM)</li>
<li>Drop CI tests on Intel Macs (<a href="">#1439</a>) (Dimitri Papadopoulos, reviewed by CM)</li>
<li>Update license metadata using SPDX expression (<a href="">#1425</a>) (Dimitri Papadopoulos, reviewed by CM)</li>
<li>Test on Python 3.14, us locking tox runners (<a href="">#1431</a>, <a href="">#1447</a>) (CM)</li>
<li>Update style checker (ruff) and address new complaints (<a href="">#1405</a>, <a href="">#1406</a>, <a href="">#1433</a>) (CM, Dimitri Papadopoulos)</li>
<li>Add broad testing for Python 3.13 (<a href="">#1381</a>) (CM)</li>
<li>Build docs on PRs with ReadTheDocs to permit quick inspection. (<a href="">#1398</a>) (CM)</li>
</ul>
<h2>API changes and deprecations</h2>
<ul>
<li>Drop support for Python 3.9, Numpy &lt; 1.25 (<a href="">#1448</a>) (CM)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/musicinmybrain"><code>@​musicinmybrain</code></a> made their first contribution in <a href="">nipy/nibabel#1391</a></li>
<li><a href="https://github.com/nightwnvol"><code>@​nightwnvol</code></a> made their first contribution in <a href="">nipy/nibabel#1396</a></li>
<li><a href="https://github.com/bthyreau"><code>@​bthyreau</code></a> made their first contribution in <a href="">nipy/nibabel#1415</a></li>
<li><a href="https://github.com/shnizzedy"><code>@​shnizzedy</code></a> made their first contribution in <a href="">nipy/nibabel#1436</a></li>
<li><a href="https://github.com/alexdaniel654"><code>@​alexdaniel654</code></a> made their first contribution in <a href="">nipy/nibabel#1432</a></li>
<li><a href="https://github.com/leoyala"><code>@​leoyala</code></a> made their first contribution in <a href="">nipy/nibabel#1450</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/nipy/nibabel/blob/master/Changelog">nibabel's changelog</a>.</em></p>
<blockquote>
<h1>5.4.0 (Monday 2 March 2026)</h1>
<p>New feature release in the 5.4.x series.</p>
<p>This release requires a minimum Python of 3.10 and NumPy 1.25, and has been
tested up to Python 3.14 and NumPy 2.4.</p>
<h2>New features</h2>
<ul>
<li>Add mode parameter to :func:<code>nibabel.processing.conform</code> (pr/1396) (Clorindo Notte,
reviewed by CM)</li>
</ul>
<h2>Enhancements</h2>
<ul>
<li>Label image axes consistently in cases of extreme obliquity (pr/1450) (Leonardo Ayala,
reviewed by CM)</li>
<li>Use :mod:<code>compression.zstd</code> or <code>backports.zstd</code> in preference to <code>pyzstd</code>
(pr/1444) (PM, reviewed by CM)</li>
<li>Support PAR/REC files generated by Philips R11 consoles (pr/1430)
(Alex Daniel, reviewed by CM)</li>
<li>Add stub file for top-level nibabel module, improving support in code analyzers
(pr/1436) (Jon Cluce, reviewed by CM)</li>
<li>Use informative error message for missing file attribute in
:class:<code>~nibabel.streamlines.tck.TCKFile</code> header (pr/1422)
(Jon Haitz Legarreta Gorroño, reviewed by CM)</li>
<li>Support <code>ushort</code> datatypes in MGH/MGZ files (pr/1415) (Benjamin Thyreau,
reviewed by CM)</li>
<li>Simplify :func:<code>nibabel.cmdline.utils.table2string</code> implementation (pr/1403) (CM)</li>
</ul>
<h2>Bug fixes</h2>
<ul>
<li>Fix type-checking errors in :func:<code>nibabel.volumeutils.rec2dict</code> (pr/1424)
(Jon Haitz Legarreta Gorroño, reviewed by CM)</li>
<li>Adapt to functools.partial becoming a method descriptor in Python 3.14
(pr/1391) (Benjamin Beasley, reviewed by CM)</li>
</ul>
<h2>Maintenance</h2>
<ul>
<li>Split pre-release tests into cron job (pr/1466) (CM, reviewed by Remi Gau)</li>
<li>Adapt to numpy 2.5 deprecation of setting :attr:<code>~numpy.ndarray.shape</code> attributes
(pr/1452) (CM)</li>
<li>Document and test support for :class:<code>os.PathLike</code> objects in streamlines APIs
(pr/1435) (Jon Haitz Legarreta Gorroño, reviewed by CM)</li>
<li>Drop CI tests on Intel Macs (pr/1439) (Dimitri Papadopoulos, reviewed by CM)</li>
<li>Update license metadata using SPDX expression (pr/1425) (Dimitri Papadopoulos, reviewed by CM)</li>
<li>Test on Python 3.14, us locking tox runners (pr/1431, pr/1447) (CM)</li>
<li>Update style checker (ruff) and address new complaints (pr/1405, pr/1406, pr/1433) (CM,
Dimitri Papadopoulos)</li>
<li>Add broad testing for Python 3.13 (pr/1381) (CM)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4602d92</code></a> chore: Update <a href="https://github.com/remi-gau"><code>@​remi-gau</code></a> affiliation</li>
<li><a href=""><code>8dcf51f</code></a> chore: Update affiliations/ORCIDs, rerun prep_zenodo</li>
<li><a href=""><code>e17c528</code></a> chore: Do not force ascii in Zenodo snippet</li>
<li><a href=""><code>768ba19</code></a> chore: Update <a href="https://github.com/gjpcbecq"><code>@​gjpcbecq</code></a> affiliation/ORCID</li>
<li><a href=""><code>23ee0ab</code></a> chore: Use lastname, firstname in .zenodo.json</li>
<li><a href=""><code>e88f4be</code></a> chore: Remove outdated release instructions, at least one old make command</li>
<li><a href=""><code>814470a</code></a> doc: Update dependency list, badges</li>
<li><a href=""><code>f99443d</code></a> [DATALAD RUNCMD] uv run tools/prep_zenodo.py</li>
<li><a href=""><code>e379ba5</code></a> chore: Add dependencies to prep_zenodo, ignore dependabot</li>
<li><a href=""><code>5e9045a</code></a> chore: Update mailmap</li>
<li>Additional commits viewable in <a href="https://github.com/nipy/nibabel/compare/5.3.3...5.4.0">compare view</a></li>
</ul>
</details>
<br />

Updates `codespell` from 2.4.1 to 2.4.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/codespell-project/codespell/releases">codespell's releases</a>.</em></p>
<blockquote>
<h2>v2.4.2</h2>
<!-- raw HTML omitted -->
<h2>Highlights</h2>
<ul>
<li>Fixed compatibility with chardet 7+</li>
</ul>
<h2>What's Changed</h2>
<ul>
<li>Fix and clarify cases in ignore patterns by <a href="https://github.com/DanielYang59"><code>@​DanielYang59</code></a> in <a href="">codespell-project/codespell#3583</a></li>
<li>codespell-private.yml: Do not codespell digital signature files by <a href="https://github.com/cclauss"><code>@​cclauss</code></a> in <a href="">codespell-project/codespell#3623</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3634</a></li>
<li>numbes-&gt;numbers and numbesr-&gt;numbers by <a href="https://github.com/skshetry"><code>@​skshetry</code></a> in <a href="">codespell-project/codespell#3635</a></li>
<li>Add spelling corrections for disclose and variables. by <a href="https://github.com/cfi-gb"><code>@​cfi-gb</code></a> in <a href="">codespell-project/codespell#3622</a></li>
<li>Add spelling correction for Vulnererability and variants. by <a href="https://github.com/cfi-gb"><code>@​cfi-gb</code></a> in <a href="">codespell-project/codespell#3625</a></li>
<li>Remove lets-&gt;let's by <a href="https://github.com/Piedone"><code>@​Piedone</code></a> in <a href="">codespell-project/codespell#3633</a></li>
<li>Add corrections for &quot;dictate&quot; by <a href="https://github.com/jdufresne"><code>@​jdufresne</code></a> in <a href="">codespell-project/codespell#3636</a></li>
<li>Add specicification (and pl) typo by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a> in <a href="">codespell-project/codespell#3639</a></li>
<li>Remove &quot;blueish&quot; correction by <a href="https://github.com/hadess"><code>@​hadess</code></a> in <a href="">codespell-project/codespell#3510</a></li>
<li>Add &quot;lighting&quot; as an option to fix &quot;lighning&quot; by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a> in <a href="">codespell-project/codespell#3648</a></li>
<li>Revert adding <code>lien</code> to the rare dictionary  by <a href="https://github.com/nikolaik"><code>@​nikolaik</code></a> in <a href="">codespell-project/codespell#3631</a></li>
<li>&quot;ane&quot; could have been &quot;one&quot; by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a> in <a href="">codespell-project/codespell#3645</a></li>
<li>Add spelling correction for &quot;priort&quot; by <a href="https://github.com/cfi-gb"><code>@​cfi-gb</code></a> in <a href="">codespell-project/codespell#3647</a></li>
<li>Remove &quot;fix&quot; of &quot;deques&quot; - it is quite legit by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a> in <a href="">codespell-project/codespell#3649</a></li>
<li>Several new suggestions by <a href="https://github.com/mdeweerd"><code>@​mdeweerd</code></a> in <a href="">codespell-project/codespell#3621</a></li>
<li>Add proposal constraints to containts by <a href="https://github.com/mdeweerd"><code>@​mdeweerd</code></a> in <a href="">codespell-project/codespell#3652</a></li>
<li>Additions dleay,infp,practive,utiliy by <a href="https://github.com/mdeweerd"><code>@​mdeweerd</code></a> in <a href="">codespell-project/codespell#3643</a></li>
<li>Add calncelled and its variations by <a href="https://github.com/mdeweerd"><code>@​mdeweerd</code></a> in <a href="">codespell-project/codespell#3650</a></li>
<li>Use raw strings for regex by <a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> in <a href="">codespell-project/codespell#3654</a></li>
<li>Allow multiple spaces before codespell:ignore by <a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> in <a href="">codespell-project/codespell#3653</a></li>
<li>Added correction from <code>timeour</code> to <code>timeout</code> by <a href="https://github.com/jamesbraza"><code>@​jamesbraza</code></a> in <a href="">codespell-project/codespell#3656</a></li>
<li>Add typos found in various software projects by <a href="https://github.com/luzpaz"><code>@​luzpaz</code></a> in <a href="">codespell-project/codespell#3640</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3659</a></li>
<li>Add codespell suggestions for enabke and friends by <a href="https://github.com/mdeweerd"><code>@​mdeweerd</code></a> in <a href="">codespell-project/codespell#3657</a></li>
<li>END: add &quot;queues&quot; (plural from queue) as possible fix for ques by <a href="https://github.com/yarikoptic"><code>@​yarikoptic</code></a> in <a href="">codespell-project/codespell#3591</a></li>
<li>agreegate, lesda, realod, colouer by <a href="https://github.com/mdeweerd"><code>@​mdeweerd</code></a> in <a href="">codespell-project/codespell#3665</a></li>
<li>Update pre-commit version in documentation by <a href="https://github.com/prchoward"><code>@​prchoward</code></a> in <a href="">codespell-project/codespell#3666</a></li>
<li>MAINT: Rename CI file and run name by <a href="https://github.com/larsoner"><code>@​larsoner</code></a> in <a href="">codespell-project/codespell#3667</a></li>
<li>preoccuption-&gt;preoccupation; occuption-&gt;occupation by <a href="https://github.com/TheGiraffe3"><code>@​TheGiraffe3</code></a> in <a href="">codespell-project/codespell#3668</a></li>
<li>Suggestions for: checkto, diminsion, waitfor by <a href="https://github.com/mdeweerd"><code>@​mdeweerd</code></a> in <a href="">codespell-project/codespell#3670</a></li>
<li>Typos found in sigstore-python by <a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> in <a href="">codespell-project/codespell#3664</a></li>
<li>usgin-&gt;using by <a href="https://github.com/ydah"><code>@​ydah</code></a> in <a href="">codespell-project/codespell#3672</a></li>
<li>Add typos found in various software projects by <a href="https://github.com/luzpaz"><code>@​luzpaz</code></a> in <a href="">codespell-project/codespell#3669</a></li>
<li>Add coered -&gt; coerced by <a href="https://github.com/effigies"><code>@​effigies</code></a> in <a href="">codespell-project/codespell#3680</a></li>
<li>backwward(s)-&gt;backward(s), onwward(s)-&gt;onward(s) by <a href="https://github.com/cjwatson"><code>@​cjwatson</code></a> in <a href="">codespell-project/codespell#3682</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3685</a></li>
<li>telemetery-&gt;telemetry by <a href="https://github.com/august-soderberg"><code>@​august-soderberg</code></a> in <a href="">codespell-project/codespell#3686</a></li>
<li>Add hexedacimal and similar typos by <a href="https://github.com/Akuli"><code>@​Akuli</code></a> in <a href="">codespell-project/codespell#3692</a></li>
<li>Add rounted-&gt;routed, rounded and friends by <a href="https://github.com/peternewman"><code>@​peternewman</code></a> in <a href="">codespell-project/codespell#3693</a></li>
<li>Add symmectric and similar typos by <a href="https://github.com/Akuli"><code>@​Akuli</code></a> in <a href="">codespell-project/codespell#3694</a></li>
<li>Fix CI on Windows: pip upgrade pip by <a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> in <a href="">codespell-project/codespell#3698</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2ccb47f</code></a> Compat with chardet 7 (<a href="">#3886</a>)</li>
<li><a href=""><code>4ec53bf</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>2a4acba</code></a> Bump actions/download-artifact from 7 to 8</li>
<li><a href=""><code>be17cac</code></a> Bump actions/upload-artifact from 6 to 7</li>
<li><a href=""><code>04a0712</code></a> Bump ruff (<a href="">#3879</a>)</li>
<li><a href=""><code>583d879</code></a> avoide-&gt;avoid, avoided, avoids,</li>
<li><a href=""><code>1f59f34</code></a> Add correction for 'foudation' to 'foundation'</li>
<li><a href=""><code>e047fda</code></a> Add spelling correction for gather and variants.</li>
<li><a href=""><code>b5cd66d</code></a> respondant-&gt;respondent</li>
<li><a href=""><code>92125a3</code></a> Add detection of ivoice and variants.</li>
<li>Additional commits viewable in <a href="https://github.com/codespell-project/codespell/compare/v2.4.1...v2.4.2">compare view</a></li>
</ul>
</details>
<br />

Updates `lefthook` from 2.0.15 to 2.1.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/releases">lefthook's releases</a>.</em></p>
<blockquote>
<h2>v2.1.2</h2>
<h2>Changelog</h2>
<ul>
<li>737a6f71589e6a2e6f704be4d6c485d473c25b69 ci: freeze docmd (<a href="">#1327</a>)</li>
<li>6fb8e50d09202a71683fd0c160ba9458d0fe38be feat: introduce setup hook option (<a href="">#1326</a>)</li>
<li>246f1c99f02be680a8ce24c9d880f2570d25b212 fix: rollback auto-staged changes if unwanted changes detected (<a href="">#1251</a>)</li>
<li>af21ce3978a6a9ab79cdc8150e515d4dcd15434d pkg(pypi): fix python packages publishing</li>
<li>52c5d93b452c67490b8aa7488761ad19a098fb33 refactor: recovering logic for changesets (<a href="">#1324</a>)</li>
</ul>
<h2>v2.1.1</h2>
<h2>Changelog</h2>
<ul>
<li>beae38f0e4f132d685247310116464a50ac6a11b chore: reduce verbosity of hints in lefthook install (<a href="">#1303</a>)</li>
<li>59c72606e76f6ca42cc5989a28ed79f42cf0d5a7 ci: fix publishing to PyPi</li>
<li>b6cdb2ed9778561860b244df033c73af23ef0291 docs(install): add missing /v2 suffix for go get -tool (<a href="">#1304</a>)</li>
<li>47b48679bf1af27633902fa4d1098cf79547bcfd fix: reset colors on config read (<a href="">#1309</a>)</li>
</ul>
<h2>v2.1.0</h2>
<h2>Changelog</h2>
<ul>
<li>6cb576e73621d7b263094663c64827ab96e271ae chore: fancy wording and indentation for hits</li>
<li>9ace994a09c6a642a1be7df8fe11586f72827bfe ci: skip Python publishing</li>
<li>47b8f5c06f19db0ba26a6283579238248e995bfe feat: allow installing non-git hooks (<a href="">#1301</a>)</li>
<li>ec7e8e18afc0d5c002d761f937ae5db84dddb6e0 feat: check core.hooksPath when lefthook install (<a href="">#1292</a>)</li>
</ul>
<h2>v2.0.16</h2>
<h2>Changelog</h2>
<ul>
<li>432efde268b98e5874281d7ca3cb16306bcdd04a chore(golangci-lint): upgrade to 2.8.0 (<a href="">#1278</a>)</li>
<li>130855b6a576799afcd1d32f7ab4e1e286ef69d1 chore: timeout cleanup (<a href="">#1297</a>)</li>
<li>4217025c2fef2caa2abe334ef2beeabeca3d7e05 deps: January 2026 (<a href="">#1285</a>)</li>
<li>272b59b38c50e948602e28c363c39a6e33936f43 docs(remotes): elaborate on when to refetch and failure mode (<a href="">#1287</a>)</li>
<li>e6adbbaf0b12e6cbe72e95e9e482617d0b4ac36c feat: add timeout argument (<a href="">#1263</a>)</li>
<li>a50fcff10df9ccc0afa0c4c7236d1b48b4215f93 fix(jsonschema): accept string in file_types (<a href="">#1288</a>)</li>
<li>8b88796491706f4c897b26d289d429988c4be411 fix: try reading direct file instead of all remotes (<a href="">#1243</a>)</li>
<li>7c6b73327162b93661ad59fe6705ccbfd4beefc1 perf!: skip ghost hook when hooks are already configured (<a href="">#1255</a>)</li>
<li>2096d4c72b96fbdebb6792b6fec141b6eeb1480b pkg: pack one binary per platform into python wheels (<a href="">#1181</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/evilmartians/lefthook/blob/master/CHANGELOG.md">lefthook's changelog</a>.</em></p>
<blockquote>
<h2>2.1.2 (2026-03-01)</h2>
<ul>
<li>feat: introduce setup hook option (<a href="">#1326</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>refactor: recovering logic for changesets (<a href="">#1324</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>fix: rollback auto-staged changes if unwanted changes detected (<a href="">#1251</a>) by <a href="https://github.com/tuchfarber"><code>@​tuchfarber</code></a></li>
<li>docs: improve docs ui (<a href="">#1323</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>docs: additional skip example and note about reinstallation (<a href="">#1319</a>) by <a href="https://github.com/iloveitaly"><code>@​iloveitaly</code></a></li>
<li>docs: fix incorrect --verbose usage (<a href="">#1318</a>) by <a href="https://github.com/iloveitaly"><code>@​iloveitaly</code></a></li>
<li>pkg: fix python packages publishing by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
</ul>
<h2>2.1.1 (2026-02-12)</h2>
<ul>
<li>ci: fix publishing to PyPi by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>fix: reset colors on config read (<a href="">#1309</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>chore: reduce verbosity of hints in lefthook install (<a href="">#1303</a>) by <a href="https://github.com/joevin-slq-docto"><code>@​joevin-slq-docto</code></a></li>
<li>docs: add missing /v2 suffix for go get -tool (<a href="">#1304</a>) by <a href="https://github.com/alexandregv"><code>@​alexandregv</code></a></li>
</ul>
<h2>2.1.0 (2026-02-03)</h2>
<ul>
<li>ci: skip Python publishing by [<a href="https://github.com/mrexox"><code>@​mrexox</code></a>][]</li>
<li>chore: fancy wording and indentation for hits by [<a href="https://github.com/mrexox"><code>@​mrexox</code></a>][]</li>
<li>feat: check core.hooksPath when lefthook install (<a href="">#1292</a>) by [<a href="https://github.com/joevin-slq-docto"><code>@​joevin-slq-docto</code></a>][]</li>
<li>feat: allow installing non-git hooks (<a href="">#1301</a>) by [<a href="https://github.com/mrexox"><code>@​mrexox</code></a>][]</li>
</ul>
<h2>2.0.16 (2026-01-27)</h2>
<ul>
<li>chore: timeout cleanup (<a href="">#1297</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>feat: add timeout argument (<a href="">#1263</a>) by <a href="https://github.com/franzramadhan"><code>@​franzramadhan</code></a></li>
<li>deps: January 2026 (<a href="">#1285</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>pkg: pack one binary per platform into python wheels (<a href="">#1181</a>) by <a href="https://github.com/danfimov"><code>@​danfimov</code></a></li>
<li>fix: accept string in file_types (<a href="">#1288</a>) by <a href="https://github.com/scop"><code>@​scop</code></a></li>
<li>docs: elaborate on when to refetch and failure mode (<a href="">#1287</a>) by <a href="https://github.com/scop"><code>@​scop</code></a></li>
<li>fix: try reading direct file instead of all remotes (<a href="">#1243</a>) by <a href="https://github.com/mrexox"><code>@​mrexox</code></a></li>
<li>perf: [<strong>breaking</strong>] skip ghost hook when hooks are already configured (<a href="">#1255</a>) by <a href="https://github.com/WooWan"><code>@​WooWan</code></a></li>
<li>chore: upgrade to 2.8.0 (<a href="">#1278</a>) by <a href="https://github.com/scop"><code>@​scop</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>7dfb4bf</code></a> 2.1.2: introduce setup option, restore unstaged changes after fail</li>
<li><a href=""><code>6fb8e50</code></a> feat: introduce setup hook option (<a href="">#1326</a>)</li>
<li><a href=""><code>737a6f7</code></a> ci: freeze docmd (<a href="">#1327</a>)</li>
<li><a href=""><code>683a0e5</code></a> docs: update the first page and callouts</li>
<li><a href=""><code>52c5d93</code></a> refactor: recovering logic for changesets (<a href="">#1324</a>)</li>
<li><a href=""><code>306b648</code></a> docs: fix broken links</li>
<li><a href=""><code>9173dc9</code></a> docs: keep footer in the bottom</li>
<li><a href=""><code>246f1c9</code></a> fix: rollback auto-staged changes if unwanted changes detected (<a href="">#1251</a>)</li>
<li><a href=""><code>c1534f5</code></a> docs: improve docs ui (<a href="">#1323</a>)</li>
<li><a href=""><code>642b693</code></a> docs: additional skip example and note about reinstallation (<a href="">#1319</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/evilmartians/lefthook/compare/v2.0.15...v2.1.2">compare view</a></li>
</ul>
</details>
<br />

Updates `openneuro-py` from 2026.1.0 to 2026.3.0
<details>
<summary>Commits</summary>
<ul>
<li>See full diff in <a href="https://github.com/hoechenberger/openneuro-py/commits">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.4 to 0.15.5
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.5</h2>
<h2>Release Notes</h2>
<p>Released on 2026-03-05.</p>
<h3>Preview features</h3>
<ul>
<li>Discover Markdown files by default in preview mode (<a href="">#23434</a>)</li>
<li>[<code>perflint</code>] Extend <code>PERF102</code> to comprehensions and generators (<a href="">#23473</a>)</li>
<li>[<code>refurb</code>] Fix <code>FURB101</code> and <code>FURB103</code> false positives when I/O variable is used later (<a href="">#23542</a>)</li>
<li>[<code>ruff</code>] Add fix for <code>none-not-at-end-of-union</code> (<code>RUF036</code>) (<a href="">#22829</a>)</li>
<li>[<code>ruff</code>] Fix false positive for <code>re.split</code> with empty string pattern (<code>RUF055</code>) (<a href="">#23634</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>fastapi</code>] Handle callable class dependencies with <code>__call__</code> method (<code>FAST003</code>) (<a href="">#23553</a>)</li>
<li>[<code>pydocstyle</code>] Fix numpy section ordering (<code>D420</code>) (<a href="">#23685</a>)</li>
<li>[<code>pyflakes</code>] Fix false positive for names shadowing re-exports (<code>F811</code>) (<a href="">#23356</a>)</li>
<li>[<code>pyupgrade</code>] Avoid inserting redundant <code>None</code> elements in <code>UP045</code> (<a href="">#23459</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Document extension mapping for Markdown code formatting (<a href="">#23574</a>)</li>
<li>Update default Python version examples (<a href="">#23605</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Publish releases to Astral mirror (<a href="">#23616</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/amyreese"><code>@​amyreese</code></a></li>
<li><a href="https://github.com/stakeswky"><code>@​stakeswky</code></a></li>
<li><a href="https://github.com/chirizxc"><code>@​chirizxc</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/bxff"><code>@​bxff</code></a></li>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/kar-ganap"><code>@​kar-ganap</code></a></li>
</ul>
<h2>Install ruff 0.15.5</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://github.com/astral-sh/ruff/releases/download/0.15.5/ruff-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.5</h2>
<p>Released on 2026-03-05.</p>
<h3>Preview features</h3>
<ul>
<li>Discover Markdown files by default in preview mode (<a href="">#23434</a>)</li>
<li>[<code>perflint</code>] Extend <code>PERF102</code> to comprehensions and generators (<a href="">#23473</a>)</li>
<li>[<code>refurb</code>] Fix <code>FURB101</code> and <code>FURB103</code> false positives when I/O variable is used later (<a href="">#23542</a>)</li>
<li>[<code>ruff</code>] Add fix for <code>none-not-at-end-of-union</code> (<code>RUF036</code>) (<a href="">#22829</a>)</li>
<li>[<code>ruff</code>] Fix false positive for <code>re.split</code> with empty string pattern (<code>RUF055</code>) (<a href="">#23634</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>fastapi</code>] Handle callable class dependencies with <code>__call__</code> method (<code>FAST003</code>) (<a href="">#23553</a>)</li>
<li>[<code>pydocstyle</code>] Fix numpy section ordering (<code>D420</code>) (<a href="">#23685</a>)</li>
<li>[<code>pyflakes</code>] Fix false positive for names shadowing re-exports (<code>F811</code>) (<a href="">#23356</a>)</li>
<li>[<code>pyupgrade</code>] Avoid inserting redundant <code>None</code> elements in <code>UP045</code> (<a href="">#23459</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Document extension mapping for Markdown code formatting (<a href="">#23574</a>)</li>
<li>Update default Python version examples (<a href="">#23605</a>)</li>
</ul>
<h3>Other changes</h3>
<ul>
<li>Publish releases to Astral mirror (<a href="">#23616</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/amyreese"><code>@​amyreese</code></a></li>
<li><a href="https://github.com/stakeswky"><code>@​stakeswky</code></a></li>
<li><a href="https://github.com/chirizxc"><code>@​chirizxc</code></a></li>
<li><a href="https://github.com/anishgirianish"><code>@​anishgirianish</code></a></li>
<li><a href="https://github.com/bxff"><code>@​bxff</code></a></li>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/kar-ganap"><code>@​kar-ganap</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5e4a3d9</code></a> Bump 0.15.5 (<a href="">#23743</a>)</li>
<li><a href=""><code>69c23cc</code></a> [ty] Render all changed diagnostics in conformance.py (<a href="">#23613</a>)</li>
<li><a href=""><code>4926bd5</code></a> [ty] Split deferred checks out of <code>types/infer/builder.rs</code> (<a href="">#23740</a>)</li>
<li><a href=""><code>9a70f5e</code></a> Discover markdown files by default in preview mode (<a href="">#23434</a>)</li>
<li><a href=""><code>3dc78b0</code></a> [ty] Use <code>HasOptionalDefinition</code> for <code>except</code> handlers (<a href="">#23739</a>)</li>
<li><a href=""><code>a6a5e8d</code></a> [ty] Fix precedence of <code>all</code> selector in TOML configurations (<a href="">#23723</a>)</li>
<li><a href=""><code>2a5384b</code></a> [ty] Make <code>all</code> selector case sensitive (<a href="">#23713</a>)</li>
<li><a href=""><code>db77d7b</code></a> [ty] Add a diagnostic if a <code>TypeVar</code> is used to specialize a <code>ParamSpec</code>, or ...</li>
<li><a href=""><code>db28490</code></a> [ty] Override home directory in ty tests (<a href="">#23724</a>)</li>
<li><a href=""><code>5f0fd91</code></a> [ty] More type-variable default validation (<a href="">#23639</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.4...0.15.5">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 0.7.33 to 0.9.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v0.9.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🚨 Breaking Changes</h3>
<ul>
<li>fix: apply exclude patterns to explicitly specified files by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1540</a></li>
</ul>
<h3>🚀 New Features</h3>
<ul>
<li>feat: add propertyNames validation and type inference from keywords by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1536</a></li>
<li>refactor: move key-empty rule from linter to validator by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1537</a></li>
</ul>
<h3>🐛 Bug Fixes</h3>
<ul>
<li>fix: enable comment directive completion for keys not in schema properties by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1539</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>chore: title. by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1530</a></li>
<li>feat: tasks by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1532</a></li>
<li>docs: consolidate new comment treatment spec by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1534</a></li>
<li>refactor: simplify table-keys-order sorting with single-pass classification by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1535</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.8.0...v0.9.0">https://github.com/tombi-toml/tombi/compare/v0.8.0...v0.9.0</a></p>
<h2>v0.8.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<p>v0.8.0 has been released, and it now allows line breaks per <code>Key Value</code> / <code>Value</code> .</p>
<p>Each line break is implicitly treated as a group, and automatic sorting is performed per group.</p>
<!-- raw HTML omitted -->
<h3>🚀 New Features</h3>
<ul>
<li>Feat new comment directives by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1514</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix(lsp): include with-comma range for key hover by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#1529</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v0.7.33...v0.8.0">https://github.com/tombi-toml/tombi/compare/v0.7.33...v0.8.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>896e67b</code></a> Merge pull request <a href="">#1540</a> from tombi-toml/fix/apply-exclude-patterns-to-explic...</li>
<li><a href=""><code>41104f8</code></a> refactor: streamline pattern matching in file search</li>
<li><a href=""><code>19d97b8</code></a> refactor: update FileSearch to use FileSearchEntry for improved result handling</li>
<li><a href=""><code>b16f09f</code></a> fix: apply exclude patterns to explicitly specified files</li>
<li><a href=""><code>ac087e1</code></a> Merge pull request <a href="">#1539</a> from tombi-toml/fix/completion-comment-directive-for...</li>
<li><a href=""><code>861e205</code></a> fix: enable comment directive completion for keys not in schema properties</li>
<li><a href=""><code>0dc4726</code></a> Merge pull request <a href="">#1537</a> from tombi-toml/refactor/move-key-empty-rule-to-vali...</li>
<li><a href=""><code>2c06e81</code></a> test: add tests for key-empty LintOptions off and error</li>
<li><a href=""><code>c2a26c3</code></a> fix: enhance key-empty diagnostic handling in linter</li>
<li><a href=""><code>bb58526</code></a> fix: propagate directive diagnostics and post-process key-empty severity in l...</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v0.7.33...v0.9.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.19 to 0.0.21
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.21</h2>
<h2>Release Notes</h2>
<p>Released on 2026-03-05.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid stack overflow with recursive typevar (<a href="">#23652</a>)</li>
<li>Fix panic on incomplete except handlers (<a href="">#23708</a>)</li>
<li>Allow unions of different-length iterables in <code>*args</code> unpacking into optional positional parameters (<a href="">#23124</a>)</li>
<li>Don't replace <code>Any</code> attributes with <code>object</code> after <code>isinstance</code> narrowing (<a href="">#23725</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Exclude decorators from class/def code folding (<a href="">#23543</a>)</li>
<li>Fix handling of non-Python text documents (<a href="">#23704</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Add <code>all</code> selector to <code>ty.json</code> schema (<a href="">#23721</a>)</li>
<li>Fix precedence of <code>all</code> selector in TOML configurations (<a href="">#23723</a>)</li>
<li>Make <code>all</code> selector case-sensitive (<a href="">#23713</a>)</li>
</ul>
<h3>Type checking</h3>
<ul>
<li>Add <code>invalid-enum-member-annotation</code> lint rule (<a href="">#23648</a>)</li>
<li>Add a diagnostic for an unused awaitable (<a href="">#23650</a>)</li>
<li>Add a diagnostic if a <code>TypeVar</code> is used to specialize a <code>ParamSpec</code>, or vice versa (<a href="">#23738</a>)</li>
<li>Add more type-variable default validation (<a href="">#23639</a>)</li>
<li>Add unbound type variable detection in annotations (<a href="">#23641</a>)</li>
<li>Apply narrowing to walrus values (<a href="">#23687</a>)</li>
<li>Do not union <code>Unknown</code> into unannotated container types (<a href="">#23718</a>)</li>
<li>Avoid inferring generics with negative intersections (<a href="">#23750</a>)</li>
<li>More precise types for <code>name</code> and <code>value</code> of an enum (<a href="">#23683</a>)</li>
<li>Better preserve user-provided union order in inferred specializations (<a href="">#23715</a>)</li>
<li>Support narrowing in ternary expressions (<a href="">#23726</a>)</li>
<li>Validate bare ParamSpec usage in type annotations, and support stringified ParamSpecs as the first argument to <code>Callable</code> (<a href="">#23625</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/zsol"><code>@​zsol</code></a></li>
<li><a href="https://github.com/Gankra"><code>@​Gankra</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/AlexWaygood"><code>@​AlexWaygood</code></a></li>
<li><a href="https://github.com/rizzip"><code>@​rizzip</code></a></li>
<li><a href="https://github.com/iksuddle"><code>@​iksuddle</code></a></li>
<li><a href="https://github.com/dcreager"><code>@​dcreager</code></a></li>
<li><a href="https://github.com/BurntSushi"><code>@​BurntSushi</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/blob/main/CHANGELOG.md">ty's changelog</a>.</em></p>
<blockquote>
<h2>0.0.21</h2>
<p>Released on 2026-03-05.</p>
<h3>Bug fixes</h3>
<ul>
<li>Avoid stack overflow with recursive typevar (<a href="">#23652</a>)</li>
<li>Fix panic on incomplete except handlers (<a href="">#23708</a>)</li>
<li>Allow unions of different-length iterables in <code>*args</code> unpacking into optional positional parameters (<a href="">#23124</a>)</li>
<li>Don't replace <code>Any</code> attributes with <code>object</code> after <code>isinstance</code> narrowing (<a href="">#23725</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Exclude decorators from class/def code folding (<a href="">#23543</a>)</li>
<li>Fix handling of non-Python text documents (<a href="">#23704</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Add <code>all</code> selector to <code>ty.json</code> schema (<a href="">#23721</a>)</li>
<li>Fix precedence of <code>all</code> selector in TOML configurations (<a href="">#23723</a>)</li>
<li>Make <code>all</code> selector case-sensitive (<a href="">#23713</a>)</li>
</ul>
<h3>Type checking</h3>
<ul>
<li>Add <code>invalid-enum-member-annotation</code> lint rule (<a href="">#23648</a>)</li>
<li>Add a diagnostic for an unused awaitable (<a href="">#23650</a>)</li>
<li>Add a diagnostic if a <code>TypeVar</code> is used to specialize a <code>ParamSpec</code>, or vice versa (<a href="">#23738</a>)</li>
<li>Add more type-variable default validation (<a href="">#23639</a>)</li>
<li>Add unbound type variable detection in annotations (<a href="">#23641</a>)</li>
<li>Apply narrowing to walrus values (<a href="">#23687</a>)</li>
<li>Do not union <code>Unknown</code> into unannotated container types (<a href="">#23718</a>)</li>
<li>Avoid inferring generics with negative intersections (<a href="">#23750</a>)</li>
<li>More precise types for <code>name</code> and <code>value</code> of an enum (<a href="">#23683</a>)</li>
<li>Better preserve user-provided union order in inferred specializations (<a href="">#23715</a>)</li>
<li>Support narrowing in ternary expressions (<a href="">#23726</a>)</li>
<li>Validate bare ParamSpec usage in type annotations, and support stringified ParamSpecs as the first ...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `3ad1e9261a1e`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.