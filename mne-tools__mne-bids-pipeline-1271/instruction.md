# Issue

**Title:** [dependabot]: Bump the deps group with 5 updates

## Description

Bumps the deps group with 5 updates:

| Package | From | To |
| --- | --- | --- |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.29.7` | `3.30.2` |
| [pyarrow](https://github.com/apache/arrow) | `24.0.0` | `25.0.0` |
| [codespell](https://github.com/codespell-project/codespell) | `2.4.2` | `2.4.3` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.21` | `0.15.22` |
| [ty](https://github.com/astral-sh/ty) | `0.0.57` | `0.0.60` |

Updates `filelock` from 3.29.7 to 3.30.2
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.30.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Document every lock type, and stop evicting a marker we cannot read by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#672</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.30.1...3.30.2">https://github.com/tox-dev/filelock/compare/3.30.1...3.30.2</a></p>
<h2>3.30.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>📝 docs: separate changelog releases with a blank line by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#668</a></li>
<li>🐛 fix: tolerate NFSv3 stale handle in strict claim read by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#669</a></li>
<li>Match fork-reset protocol on the class object by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#671</a></li>
<li>reject non-finite lease duration in marker records by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#670</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.30.0...3.30.1">https://github.com/tox-dev/filelock/compare/3.30.0...3.30.1</a></p>
<h2>3.30.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🎨 style: readability cleanup across the library by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#598</a></li>
<li>🐛 fix(api): ignore lifetime on native OS locks by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#593</a></li>
<li>🐛 fix(unix): don't mutate lock file before acquiring flock by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#594</a></li>
<li>soft: evict a non-regular lock file without reading it by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#597</a></li>
<li>🐛 fix(windows): bind reparse-point check to the locked handle by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#596</a></li>
<li>🐛 fix(api): make native lock release transactional by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#615</a></li>
<li>🐛 fix(soft): make marker writes and cleanup transactional by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#614</a></li>
<li>🐛 fix(windows): open the lock file through NtCreateFile by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#617</a></li>
<li>✨ feat(api): add context_error_policy for dual context failures by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#618</a></li>
<li>📝 docs: correct Unix lock-file cleanup and flock claims by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#623</a></li>
<li>✨ feat(api): add close_error_policy for post-unlock close errors by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#619</a></li>
<li>🐛 fix(api): canonicalize singleton keys without following a final symlink by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#621</a></li>
<li>✨ feat(unix): add fallback_to_soft opt-out for native locks by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#622</a></li>
<li>✨ feat: add lock_descriptor for a caller-owned descriptor by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#620</a></li>
<li>✨ feat(api): add preserve_lock_file to keep the lock pathname by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#624</a></li>
<li>✨ feat(api): add on_acquired post-acquisition hook by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#625</a></li>
<li>🔧 build(release): towncrier changelog pipeline, backfill, and docs by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#626</a></li>
<li>📝 docs: drop bot entries and link code refs in the changelog by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#638</a></li>
<li>🐛 fix(api): validate lifetime values by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#644</a></li>
<li>🐛 fix(win32): capture process probe errors by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#645</a></li>
<li>🐛 fix(api): reject dropped lock options by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#646</a></li>
<li>🐛 fix(api): retain acquisition path identity by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#647</a></li>
<li>🐛 fix(api): detach grouped release errors by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#648</a></li>
<li>🐛 fix(descriptor): define unavailable behavior by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#650</a></li>
<li>🐛 fix(ci): map absolute coverage paths by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#651</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/filelock/blob/main/docs/changelog.rst">filelock's changelog</a>.</em></p>
<blockquote>
<p>###########
Changelog
###########</p>
<p>.. towncrier-draft-entries:: Unreleased</p>
<p>.. towncrier release notes start</p>
<hr />
<p>3.30.2 (2026-07-16)</p>
<hr />
<ul>
<li>Stop :class:<code>~filelock.SoftFileLease</code> deleting a live marker whose <code>mode</code> it does not implement. An unrecognized mode now names its owner instead of reading as malformed, so a record written by a newer filelock survives the grace window rather than being evicted after two seconds. :pr:<code>672</code></li>
<li>Stop :class:<code>~filelock.StrictSoftFileLock</code> and :class:<code>~filelock.AsyncStrictSoftFileLock</code> calling themselves a native OS lock when they warn that they ignore <code>lifetime</code>; they now say a strict claim is only ever cleared by <code>force_break()</code>. :pr:<code>672</code></li>
<li>Cover every lock type in the tutorials and how-to guides, with examples drawn from projects that use filelock, and color the mermaid diagrams.
Correct the claims that <code>StrictSoftFileLock</code> exposes <code>owner</code>, that :class:<code>~filelock.SoftFileLock</code> evicts a strict sentinel, that :class:<code>~filelock.ReadWriteLock</code> requires a <code>.db</code> extension, and that every log record is <code>DEBUG</code>. :pr:<code>672</code></li>
</ul>
<hr />
<p>3.30.1 (2026-07-16)</p>
<hr />
<ul>
<li><code>StrictSoftFileLock</code> and <code>AsyncStrictSoftFileLock</code> no longer abort acquisition when a peer's claim vanishes as an
NFSv3 stale filehandle instead of a clean removal; the reader revalidates and skips it, so strict locks hold mutual
exclusion across independent NFSv3 client caches. :pr:<code>669</code></li>
<li><code>SoftFileLease</code> reads a marker whose lease duration is <code>nan</code> or <code>inf</code> as malformed rather than as a valid lease,
so such a marker ages out through the grace window instead of raising <code>LeaseSettingsMismatch</code> on every contender. :pr:<code>670</code></li>
</ul>
<hr />
<p>3.30.0 (2026-07-16)</p>
<hr />
<ul>
<li>Add <code>context_error_policy</code> to surface body and release failures as a :exc:<code>BaseExceptionGroup</code>. :pr:<code>618</code></li>
<li>Add <code>close_error_policy</code> to control an :func:<code>os.close</code> failure after the OS unlock. :pr:<code>619</code></li>
<li>Add :func:<code>~filelock.lock_descriptor</code> and :func:<code>~filelock.unlock_descriptor</code> to lock a caller-owned file descriptor. :pr:<code>620</code></li>
<li>Add <code>fallback_to_soft</code> to fail closed instead of downgrading to :class:<code>~filelock.SoftFileLock</code> on <code>ENOSYS</code>. :pr:<code>622</code></li>
<li>Add <code>preserve_lock_file</code> so native locks keep the lock pathname on release. :pr:<code>624</code></li>
<li>Add an <code>on_acquired</code> hook that runs a callback on the locked descriptor once the lock is held. :pr:<code>625</code></li>
<li>Add <code>StrictSoftFileLock</code>, which treats every marker it did not publish as contention, and <code>SoftFileLease</code>, whose
claim expires and whose holder learns through <code>on_compromise</code> when it is lost. <code>SoftFileLock(lifetime=...)</code> now warns
and names them. Both publish a record <code>SoftFileLock</code> evicts, so do not mix contracts on one path. :pr:<code>636</code></li>
<li>Add <code>StrictSoftFileLock</code> and <code>AsyncStrictSoftFileLock</code> with owner-specific hard-linked claims. Strict mode fails
closed on claim damage, exposes each recovery token, and requires an exact claim name for a force break. :pr:<code>637</code></li>
<li>Ignore <code>lifetime</code> on native locks with a warning; only :class:<code>~filelock.SoftFileLock</code> honors it. :pr:<code>593</code></li>
<li>Stop mutating the Unix lock file before :func:<code>fcntl.flock</code> is held. :pr:<code>594</code></li>
<li>Bind the Windows reparse-point check to the locked handle to close a symlink-swap race. :pr:<code>596</code></li>
<li>Evict a non-regular soft lock file without reading it. :pr:<code>597</code></li>
<li>Write a soft lock's holder record atomically so a short write cannot create overlapping holders. :pr:<code>614</code></li>
<li>Make native lock release transactional so a failed unlock is retried, not dropped. :pr:<code>615</code></li>
<li>Open the Windows lock file via <code>NtCreateFile</code> so a real access denial is raised, not reported as a timeout. :pr:<code>617</code></li>
<li>Canonicalize singleton keys so equivalent path spellings share an instance, without following a final symlink. :pr:<code>621</code></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9a71d06</code></a> Release 3.30.2</li>
<li><a href=""><code>0dfa1b2</code></a> Document every lock type, and stop evicting a marker we cannot read (<a href="">#672</a>)</li>
<li><a href=""><code>47d435f</code></a> Release 3.30.1</li>
<li><a href=""><code>9b7b3b1</code></a> reject non-finite lease duration in marker records (<a href="">#670</a>)</li>
<li><a href=""><code>cfafd70</code></a> Match fork-reset protocol on the class object (<a href="">#671</a>)</li>
<li><a href=""><code>e4c0eb3</code></a> 🐛 fix: tolerate NFSv3 stale handle in strict claim read (<a href="">#669</a>)</li>
<li><a href=""><code>d0450d5</code></a> 📝 docs: separate changelog releases with a blank line (<a href="">#668</a>)</li>
<li><a href=""><code>1b09406</code></a> Release 3.30.0</li>
<li><a href=""><code>5f2d663</code></a> 👷 ci(matrix): add SMB, capability, and matrix docs (<a href="">#665</a>)</li>
<li><a href=""><code>2345750</code></a> Replace prettier with mdformat and yamlfmt (<a href="">#667</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.29.7...3.30.2">compare view</a></li>
</ul>
</details>
<br />

Updates `pyarrow` from 24.0.0 to 25.0.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/apache/arrow/releases">pyarrow's releases</a>.</em></p>
<blockquote>
<h2>Apache Arrow 25.0.0</h2>
<p>Release Notes URL: <a href="https://arrow.apache.org/release/25.0.0.html">https://arrow.apache.org/release/25.0.0.html</a></p>
<h2>Apache Arrow 25.0.0 RC1</h2>
<p>Release Notes: Release Candidate: 25.0.0 RC1</p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>59bea6e</code></a> MINOR: [Release] Update versions for 25.0.0</li>
<li><a href=""><code>381fab6</code></a> MINOR: [Release] Update .deb/.rpm changelogs for 25.0.0</li>
<li><a href=""><code>7f72d5b</code></a> MINOR: [Release] Update CHANGELOG.md for 25.0.0</li>
<li><a href=""><code>fe2f85c</code></a> <a href="">GH-50336</a>: [Release][Archery] Fix archery GitHub integration for release scrip...</li>
<li><a href=""><code>c658548</code></a> <a href="">GH-50293</a>: [CI] Run check-labels for all triggers to avoid cancelling further ...</li>
<li><a href=""><code>f83c8ca</code></a> <a href="">GH-50330</a>: [C++][R][Parquet] Add missing typename in RleBitPackedDecoderGetRun...</li>
<li><a href=""><code>35e0f63</code></a> <a href="">GH-50318</a>: [R][CI] Install missing libpng-dev for test-r-linux-as-cran (<a href="">#50328</a>)</li>
<li><a href=""><code>61ca7a9</code></a> <a href="">GH-50295</a>: [C++][R] #include &lt;ranges&gt; in vector_select_k.cc breaks macOS CRAN ...</li>
<li><a href=""><code>1b6edb8</code></a> <a href="">GH-50291</a>: [Python][Packaging] Stop using nightly build dependencies for build...</li>
<li><a href=""><code>e183ea9</code></a> MINOR: [Docs] Add Timestamp With Offset to canonical extension types status (...</li>
<li>Additional commits viewable in <a href="https://github.com/apache/arrow/compare/apache-arrow-24.0.0...apache-arrow-25.0.0">compare view</a></li>
</ul>
</details>
<br />

Updates `codespell` from 2.4.2 to 2.4.3
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/codespell-project/codespell/releases">codespell's releases</a>.</em></p>
<blockquote>
<h2>v2.4.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Add 'radback' to dictionary with correction by <a href="https://github.com/Flo3561"><code>@​Flo3561</code></a> in <a href="">codespell-project/codespell#3883</a></li>
<li>Add 'repetirion' to dictionary corrections by <a href="https://github.com/Flo3561"><code>@​Flo3561</code></a> in <a href="">codespell-project/codespell#3885</a></li>
<li>Need to specify a version of Python version after all by <a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> in <a href="">codespell-project/codespell#3887</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3889</a></li>
<li>Add cases for &quot;modulle&quot; -&gt; &quot;module&quot; by <a href="https://github.com/utzcoz"><code>@​utzcoz</code></a> in <a href="">codespell-project/codespell#3888</a></li>
<li>Add case &quot;auido&quot; -&gt; &quot;audio&quot; by <a href="https://github.com/utzcoz"><code>@​utzcoz</code></a> in <a href="">codespell-project/codespell#3890</a></li>
<li>Add credentilas-&gt;credentials and friends by <a href="https://github.com/peternewman"><code>@​peternewman</code></a> in <a href="">codespell-project/codespell#3895</a></li>
<li>Add the case &quot;cubid&quot; -&gt; &quot;cubic&quot; by <a href="https://github.com/utzcoz"><code>@​utzcoz</code></a> in <a href="">codespell-project/codespell#3891</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3897</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3900</a></li>
<li>Bump codecov/codecov-action from 5 to 6 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">codespell-project/codespell#3902</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3904</a></li>
<li>Add <code>magntiude-&gt;magnitude</code> by <a href="https://github.com/nathanjmcdougall"><code>@​nathanjmcdougall</code></a> in <a href="">codespell-project/codespell#3899</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3909</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3912</a></li>
<li>Add the case &quot;instanc&quot; -&gt; &quot;instance&quot; by <a href="https://github.com/utzcoz"><code>@​utzcoz</code></a> in <a href="">codespell-project/codespell#3896</a></li>
<li>gampad -&gt; gamepad (and plural) by <a href="https://github.com/julianstirling"><code>@​julianstirling</code></a> in <a href="">codespell-project/codespell#3906</a></li>
<li>Add typos of <code>monotonic</code> and <code>monotonicity</code> by <a href="https://github.com/nathanjmcdougall"><code>@​nathanjmcdougall</code></a> in <a href="">codespell-project/codespell#3898</a></li>
<li>Add spelling correction for multipile(s)/vulnerabities. by <a href="https://github.com/cfi-gb"><code>@​cfi-gb</code></a> in <a href="">codespell-project/codespell#3905</a></li>
<li>Add 'simpilfy -&gt; simplify' by <a href="https://github.com/alexreinking"><code>@​alexreinking</code></a> in <a href="">codespell-project/codespell#3913</a></li>
<li>fix(packaging): prevent unwanted files and tests from being installed by <a href="https://github.com/mikelolasagasti"><code>@​mikelolasagasti</code></a> in <a href="">codespell-project/codespell#3911</a></li>
<li>Add skarhoj-&gt;SKAARHOJ to dictionary corrections by <a href="https://github.com/peternewman"><code>@​peternewman</code></a> in <a href="">codespell-project/codespell#3908</a></li>
<li>Improve the dictionary by <a href="https://github.com/algonell"><code>@​algonell</code></a> in <a href="">codespell-project/codespell#3914</a></li>
<li>Add spelling correction for accorss/accors. by <a href="https://github.com/cfi-gb"><code>@​cfi-gb</code></a> in <a href="">codespell-project/codespell#3916</a></li>
<li>Bump autofix-ci/action from 1.3.3 to 1.3.4 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">codespell-project/codespell#3921</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3923</a></li>
<li>Add <code>influecer-&gt;influencer</code> and <code>influnce*</code> typos to dictionary by <a href="https://github.com/nathanjmcdougall"><code>@​nathanjmcdougall</code></a> in <a href="">codespell-project/codespell#3925</a></li>
<li>Add typos for <code>excavate</code> and variants by <a href="https://github.com/nathanjmcdougall"><code>@​nathanjmcdougall</code></a> in <a href="">codespell-project/codespell#3926</a></li>
<li>Dict: Add corrections for memoy by <a href="https://github.com/mdeweerd"><code>@​mdeweerd</code></a> in <a href="">codespell-project/codespell#3924</a></li>
<li><code>overheda -&gt; overhead</code> by <a href="https://github.com/George-Ogden"><code>@​George-Ogden</code></a> in <a href="">codespell-project/codespell#3919</a></li>
<li><code>inclusize-&gt;inclusive</code> and variants by <a href="https://github.com/George-Ogden"><code>@​George-Ogden</code></a> in <a href="">codespell-project/codespell#3918</a></li>
<li>Add spelling corrections for authorization by <a href="https://github.com/cfi-gb"><code>@​cfi-gb</code></a> in <a href="">codespell-project/codespell#3922</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3927</a></li>
<li>Don't fix Voight by <a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> in <a href="">codespell-project/codespell#3929</a></li>
<li>Add spelling corrections for interstect and interstection by <a href="https://github.com/korli"><code>@​korli</code></a> in <a href="">codespell-project/codespell#3928</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3930</a></li>
<li>Improve output in interactive mode by <a href="https://github.com/darkmattercoder"><code>@​darkmattercoder</code></a> in <a href="">codespell-project/codespell#3884</a></li>
<li>feat: support codespell:ignore-next-line directive by <a href="https://github.com/SAY-5"><code>@​SAY-5</code></a> in <a href="">codespell-project/codespell#3931</a></li>
<li>Add woork-&gt;work and formace-&gt;format and friends by <a href="https://github.com/peternewman"><code>@​peternewman</code></a> in <a href="">codespell-project/codespell#3828</a></li>
<li>shortctu -&gt; shortcut by <a href="https://github.com/George-Ogden"><code>@​George-Ogden</code></a> in <a href="">codespell-project/codespell#3934</a></li>
<li>A couple typos by <a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> in <a href="">codespell-project/codespell#3935</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3937</a></li>
<li>[pre-commit.ci] pre-commit autoupdate by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">codespell-project/codespell#3942</a></li>
<li>reclaculate-&gt;recalculate by <a href="https://github.com/adamgann"><code>@​adamgann</code></a> in <a href="">codespell-project/codespell#3936</a></li>
<li>Add spelling correction for improprt. by <a href="https://github.com/cfi-gb"><code>@​cfi-gb</code></a> in <a href="">codespell-project/codespell#3939</a></li>
<li>Dictionary plasic-plastic by <a href="https://github.com/julianstirling"><code>@​julianstirling</code></a> in <a href="">codespell-project/codespell#3938</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>57b2140</code></a> Read only [tool.codespell] from TOML config (<a href="">#3975</a>)</li>
<li><a href=""><code>23b8d94</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>926c4d6</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>820a301</code></a> Merge pull request <a href="">#3967</a> from codespell-project/peternewman-patch-1</li>
<li><a href=""><code>9fe42c9</code></a> Add common misspellings for reseeve-&gt;reserve to dictionary</li>
<li><a href=""><code>725173c</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>86c13ee</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li><a href=""><code>7b9f36c</code></a> Bump actions/checkout from 6 to 7</li>
<li><a href=""><code>bcc1b80</code></a> Add spelling corrections for simpe and variants.</li>
<li><a href=""><code>89584cc</code></a> [pre-commit.ci] pre-commit autoupdate</li>
<li>Additional commits viewable in <a href="https://github.com/codespell-project/codespell/compare/v2.4.2...v2.4.3">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.21 to 0.15.22
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.15.22</h2>
<h2>Release Notes</h2>
<p>Released on 2026-07-16.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>pycodestyle</code>] Add an autofix for <code>E402</code> (<a href="">#22212</a>)</li>
<li>[<code>refurb</code>] Allow subclassing builtins in stub files (<code>FURB189</code>) (<a href="">#26812</a>)</li>
<li>[<code>ruff</code>] Add rule to replace <code>noqa</code> comments with <code>ruff:ignore</code> (<code>RUF105</code>) (<a href="">#26423</a>)</li>
<li>[<code>ruff</code>] Add rule to use human-readable names in <code>ruff:ignore</code> comments (<code>RUF106</code>) (<a href="">#26682</a>)</li>
<li>[<code>ruff</code>] Add rule to use human-readable names in configuration selectors (<code>RUF201</code>) (<a href="">#26772</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-pyi</code>] Fix false positive in <code>__all__</code> (<code>PYI053</code>) (<a href="">#26872</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pylint</code>] Ignore mutable type updates in <code>redefined-loop-name</code> (<code>PLW2901</code>) (<a href="">#25733</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid redundant lexer token bookkeeping (<a href="">#26765</a>)</li>
<li>Avoid redundant pending-indentation writes (<a href="">#26774</a>)</li>
<li>Avoid unnecessary identifier lookahead (<a href="">#26525</a>)</li>
<li>Reuse parser scratch buffers (<a href="">#26798</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Document argfile support (<a href="">#26803</a>)</li>
<li>[<code>flake8-datetimez</code>] Clarify naming guidance for <code>datetime.today</code> (<code>DTZ002</code>) (<a href="">#26658</a>)</li>
<li>[<code>pycodestyle</code>] Document <code>E731</code> fix safety (<a href="">#26847</a>)</li>
<li>[<code>ruff</code>] Clarify intentional async contexts for <code>unused-async</code> (<code>RUF029</code>) (<a href="">#26641</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/dwego"><code>@​dwego</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/Joosboy"><code>@​Joosboy</code></a></li>
<li><a href="https://github.com/KaufmanDmitriy"><code>@​KaufmanDmitriy</code></a></li>
<li><a href="https://github.com/PeterJCLaw"><code>@​PeterJCLaw</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
</ul>
<h2>Install ruff 0.15.22</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>&lt;/tr&gt;&lt;/table&gt;
</code></pre>
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.15.22</h2>
<p>Released on 2026-07-16.</p>
<h3>Preview features</h3>
<ul>
<li>[<code>pycodestyle</code>] Add an autofix for <code>E402</code> (<a href="">#22212</a>)</li>
<li>[<code>refurb</code>] Allow subclassing builtins in stub files (<code>FURB189</code>) (<a href="">#26812</a>)</li>
<li>[<code>ruff</code>] Add rule to replace <code>noqa</code> comments with <code>ruff:ignore</code> (<code>RUF105</code>) (<a href="">#26423</a>)</li>
<li>[<code>ruff</code>] Add rule to use human-readable names in <code>ruff:ignore</code> comments (<code>RUF106</code>) (<a href="">#26682</a>)</li>
<li>[<code>ruff</code>] Add rule to use human-readable names in configuration selectors (<code>RUF201</code>) (<a href="">#26772</a>)</li>
</ul>
<h3>Bug fixes</h3>
<ul>
<li>[<code>flake8-pyi</code>] Fix false positive in <code>__all__</code> (<code>PYI053</code>) (<a href="">#26872</a>)</li>
</ul>
<h3>Rule changes</h3>
<ul>
<li>[<code>pylint</code>] Ignore mutable type updates in <code>redefined-loop-name</code> (<code>PLW2901</code>) (<a href="">#25733</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid redundant lexer token bookkeeping (<a href="">#26765</a>)</li>
<li>Avoid redundant pending-indentation writes (<a href="">#26774</a>)</li>
<li>Avoid unnecessary identifier lookahead (<a href="">#26525</a>)</li>
<li>Reuse parser scratch buffers (<a href="">#26798</a>)</li>
</ul>
<h3>Documentation</h3>
<ul>
<li>Document argfile support (<a href="">#26803</a>)</li>
<li>[<code>flake8-datetimez</code>] Clarify naming guidance for <code>datetime.today</code> (<code>DTZ002</code>) (<a href="">#26658</a>)</li>
<li>[<code>pycodestyle</code>] Document <code>E731</code> fix safety (<a href="">#26847</a>)</li>
<li>[<code>ruff</code>] Clarify intentional async contexts for <code>unused-async</code> (<code>RUF029</code>) (<a href="">#26641</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/dwego"><code>@​dwego</code></a></li>
<li><a href="https://github.com/MichaReiser"><code>@​MichaReiser</code></a></li>
<li><a href="https://github.com/Joosboy"><code>@​Joosboy</code></a></li>
<li><a href="https://github.com/KaufmanDmitriy"><code>@​KaufmanDmitriy</code></a></li>
<li><a href="https://github.com/PeterJCLaw"><code>@​PeterJCLaw</code></a></li>
<li><a href="https://github.com/ntBre"><code>@​ntBre</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0177a7e</code></a> Bump 0.15.22 (<a href="">#26884</a>)</li>
<li><a href=""><code>fe8ba85</code></a> [<code>pycodestyle</code>] Document <code>E731</code> fix safety (<a href="">#26847</a>)</li>
<li><a href=""><code>f3cf7c8</code></a> [<code>ruff</code>] Add <code>rule-codes-in-selectors</code> (<code>RUF201</code>) (<a href="">#26772</a>)</li>
<li><a href=""><code>d244fd7</code></a> Document argfile support (<a href="">#26803</a>)</li>
<li><a href=""><code>f239758</code></a> [<code>flake8-pyi</code>] Fix false positive in <code>__all__</code> (<code>PYI053</code>) (<a href="">#26872</a>)</li>
<li><a href=""><code>54acbcd</code></a> [ty] Support <code>TypeVarTuple</code> and <code>Unpack</code> (<a href="">#25240</a>)</li>
<li><a href=""><code>87fc38c</code></a> [ty] Parallelize subtype hierarchy search (<a href="">#26875</a>)</li>
<li><a href=""><code>e454f91</code></a> [ty] Share interned query keys across Salsa queries (<a href="">#26794</a>)</li>
<li><a href=""><code>6f361a7</code></a> [ty] only collect expected types for files open in the editor (<a href="">#25546</a>)</li>
<li><a href=""><code>6d6b2b3</code></a> [ty] Avoid allocations during Salsa interned lookups (<a href="">#26877</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.21...0.15.22">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.57 to 0.0.60
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.60</h2>
<h2>Release Notes</h2>
<p>Released on 2026-07-15.</p>
<h3>Bug fixes</h3>
<ul>
<li>Expand transparent callable workaround with overloads and <code>Awaitable[T]</code> (<a href="">#26761</a>)</li>
<li>Separate type-mapping caches by transformation mode (<a href="">#26857</a>)</li>
<li>Avoid recursive protocol union redundancy checks (<a href="">#26689</a>)</li>
<li>Handle recursive protocols in redundant-cast checks (<a href="">#26708</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Prevent type that is written with a code span from being incorrectly re-wrapped during docstring Markdown rendering (<a href="">#26723</a>)</li>
</ul>
<h3>Library support</h3>
<ul>
<li>Pydantic: Support <code>populate_by_name</code> and custom initializers (<a href="">#26764</a>)</li>
<li>Pydantic: Warn about immediately discarded extra arguments (<a href="">#26762</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Narrow TypeGuard keyword arguments and remove <code>invalid-type-guard-call</code> (<a href="">#26809</a>)</li>
<li>Support own-line suppression comments (<a href="">#26785</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Derive descriptor setter domains for protocols (<a href="">#26683</a>)</li>
<li>Handle cycles in derived constraint relations (<a href="">#26814</a>)</li>
<li>Implement unified generic call inference (<a href="">#26141</a>)</li>
<li>Preserve constraints from bound receivers (<a href="">#26776</a>)</li>
<li>Project exact-length narrowing through TypeVars (<a href="">#26852</a>)</li>
<li>Resolve PEP 695 aliases in type[...] annotations (<a href="">#26842</a>)</li>
<li>Retain sequence pattern narrowing in successful <code>match</code> cases (<a href="">#26807</a>)</li>
<li>Support class and static protocol methods (<a href="">#26574</a>)</li>
<li>Support class objects satisfying instance-method protocols (<a href="">#26789</a>)</li>
<li>Support <code>type[Protocol]</code> (<a href="">#26649</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#26840</a>). <a href="https://github.com/python/typeshed/compare/b9090e99745ac1511d8efd828622b11a9a3623e8...b00c387c669cb50d5d388d77b74c2e832e147fe8">Typeshed diff</a></li>
<li>Treat transparent callable decorators consistently in class assignments (<a href="">#26720</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Compare overloaded protocol method returns pairwise (<a href="">#26684</a>)</li>
<li>Extend <code>PathBounds</code> fast-path to support both upper and lower bounds (<a href="">#26782</a>)</li>
<li>Skip <code>Self</code> type scans for non-generic instances (<a href="">#26703</a>)</li>
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
<h2>0.0.60</h2>
<p>Released on 2026-07-15.</p>
<h3>Bug fixes</h3>
<ul>
<li>Expand transparent callable workaround with overloads and <code>Awaitable[T]</code> (<a href="">#26761</a>)</li>
<li>Separate type-mapping caches by transformation mode (<a href="">#26857</a>)</li>
<li>Avoid recursive protocol union redundancy checks (<a href="">#26689</a>)</li>
<li>Handle recursive protocols in redundant-cast checks (<a href="">#26708</a>)</li>
</ul>
<h3>LSP server</h3>
<ul>
<li>Prevent type that is written with a code span from being incorrectly re-wrapped during docstring Markdown rendering (<a href="">#26723</a>)</li>
</ul>
<h3>Library support</h3>
<ul>
<li>Pydantic: Support <code>populate_by_name</code> and custom initializers (<a href="">#26764</a>)</li>
<li>Pydantic: Warn about immediately discarded extra arguments (<a href="">#26762</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Narrow TypeGuard keyword arguments and remove <code>invalid-type-guard-call</code> (<a href="">#26809</a>)</li>
<li>Support own-line suppression comments (<a href="">#26785</a>)</li>
</ul>
<h3>Core type checking</h3>
<ul>
<li>Derive descriptor setter domains for protocols (<a href="">#26683</a>)</li>
<li>Handle cycles in derived constraint relations (<a href="">#26814</a>)</li>
<li>Implement unified generic call inference (<a href="">#26141</a>)</li>
<li>Preserve constraints from bound receivers (<a href="">#26776</a>)</li>
<li>Project exact-length narrowing through TypeVars (<a href="">#26852</a>)</li>
<li>Resolve PEP 695 aliases in type[...] annotations (<a href="">#26842</a>)</li>
<li>Retain sequence pattern narrowing in successful <code>match</code> cases (<a href="">#26807</a>)</li>
<li>Support class and static protocol methods (<a href="">#26574</a>)</li>
<li>Support class objects satisfying instance-method protocols (<a href="">#26789</a>)</li>
<li>Support <code>type[Protocol]</code> (<a href="">#26649</a>)</li>
<li>Sync vendored typeshed stubs (<a href="">#26840</a>). <a href="https://github.com/python/typeshed/compare/b9090e99745ac1511d8efd828622b11a9a3623e8...b00c387c669cb50d5d388d77b74c2e832e147fe8">Typeshed diff</a></li>
<li>Treat transparent callable decorators consistently in class assignments (<a href="">#26720</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Compare overloaded protocol method returns pairwise (<a href="">#26684</a>)</li>
<li>Extend <code>PathBounds</code> fast-path to support both upper and lower bounds (<a href="">#26782</a>)</li>
<li>Skip <code>Self</code> type scans for non-generic instances (<a href="">#26703</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/mtshiba"><code>@​mtshiba</code></a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>ae554ec</code></a> Bump version to 0.0.60 (<a href="">#4008</a>)</li>
<li><a href=""><code>4f78ec5</code></a> Update astral-sh/setup-uv action to v8.3.2 (<a href="">#3997</a>)</li>
<li><a href=""><code>0f9b587</code></a> Update prek dependencies (<a href="">#3999</a>)</li>
<li><a href=""><code>9afd373</code></a> Update dependency prek to v0.4.8 (<a href="">#3998</a>)</li>
<li><a href=""><code>391f499</code></a> Update docker/build-push-action action to v7.3.0 (<a href="">#4000</a>)</li>
<li><a href=""><code>990dfce</code></a> Update docker/login-action action to v4.4.0 (<a href="">#4001</a>)</li>
<li><a href=""><code>1b1e873</code></a> Update docker/metadata-action action to v6.2.0 (<a href="">#4002</a>)</li>
<li><a href=""><code>aece09f</code></a> Update docker/setup-buildx-action action to v4.2.0 (<a href="">#4003</a>)</li>
<li><a href=""><code>71bdf31</code></a> Bump version to 0.0.59 (<a href="">#3979</a>)</li>
<li><a href=""><code>17d3f6d</code></a> Bump version to 0.0.58 (<a href="">#3955</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.57...0.0.60">compare view</a></li>
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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `8072985862d8`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.