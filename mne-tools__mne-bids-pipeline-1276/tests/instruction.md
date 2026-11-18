# Issue

**Title:** [dependabot]: Bump the deps group with 9 updates

## Description

Bumps the deps group with 9 updates:

| Package | From | To |
| --- | --- | --- |
| [annotated-types](https://github.com/annotated-types/annotated-types) | `0.7.0` | `0.8.0` |
| [filelock](https://github.com/tox-dev/py-filelock) | `3.30.2` | `3.32.0` |
| [meegkit](https://github.com/nbara/python-meegkit) | `0.1.9` | `0.2.0` |
| [ruff](https://github.com/astral-sh/ruff) | `0.15.22` | `0.16.0` |
| [tombi](https://github.com/tombi-toml/tombi) | `1.2.0` | `1.2.4` |
| [tqdm](https://github.com/tqdm/tqdm) | `4.68.4` | `4.69.0` |
| [ty](https://github.com/astral-sh/ty) | `0.0.60` | `0.0.63` |
| [mkdocs-material](https://github.com/squidfunk/mkdocs-material) | `9.7.6` | `9.7.7` |
| [pyriemann](https://github.com/pyRiemann/pyRiemann) | `0.11` | `0.12` |

Updates `annotated-types` from 0.7.0 to 0.8.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/annotated-types/annotated-types/releases">annotated-types's releases</a>.</em></p>
<blockquote>
<h2>v0.8.0</h2>
<h2>What's Changed</h2>
<ul>
<li>Rename DocInfo to Doc by <a href="https://github.com/zen-xu"><code>@​zen-xu</code></a> in <a href="">annotated-types/annotated-types#80</a></li>
<li>Add support for Python 3.13 by <a href="https://github.com/hugovk"><code>@​hugovk</code></a> in <a href="">annotated-types/annotated-types#83</a></li>
<li>Fix docstring of <code>Timezone</code> by <a href="https://github.com/Viicos"><code>@​Viicos</code></a> in <a href="">annotated-types/annotated-types#84</a></li>
<li>Update license-files to be PEP-639 compliant (<a href="">#85</a>) by <a href="https://github.com/shoeffner"><code>@​shoeffner</code></a> in <a href="">annotated-types/annotated-types#86</a></li>
<li>fix: typo in README.md by <a href="https://github.com/camiloaz"><code>@​camiloaz</code></a> in <a href="">annotated-types/annotated-types#87</a></li>
<li>add CI for PyPy3.11 and fix test (issue 71) by <a href="https://github.com/mattip"><code>@​mattip</code></a> in <a href="">annotated-types/annotated-types#88</a></li>
<li>Fix string predicate names in doc by <a href="https://github.com/leogermond"><code>@​leogermond</code></a> in <a href="">annotated-types/annotated-types#90</a></li>
<li>Add SPDX license expression by <a href="https://github.com/wichert"><code>@​wichert</code></a> in <a href="">annotated-types/annotated-types#92</a></li>
<li>Added Python 3.14 to the test matrix by <a href="https://github.com/imtoopunkforyou"><code>@​imtoopunkforyou</code></a> in <a href="">annotated-types/annotated-types#96</a></li>
<li>Add support for Python 3.14 and drop EOL 3.8-3.9 by <a href="https://github.com/hugovk"><code>@​hugovk</code></a> in <a href="">annotated-types/annotated-types#97</a></li>
<li>Fix typo in <code>Len</code> docstring by <a href="https://github.com/Dutcho"><code>@​Dutcho</code></a> in <a href="">annotated-types/annotated-types#100</a></li>
<li>Prepare for 0.8.0 release by <a href="https://github.com/adriangb"><code>@​adriangb</code></a> in <a href="">annotated-types/annotated-types#103</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/zen-xu"><code>@​zen-xu</code></a> made their first contribution in <a href="">annotated-types/annotated-types#80</a></li>
<li><a href="https://github.com/hugovk"><code>@​hugovk</code></a> made their first contribution in <a href="">annotated-types/annotated-types#83</a></li>
<li><a href="https://github.com/shoeffner"><code>@​shoeffner</code></a> made their first contribution in <a href="">annotated-types/annotated-types#86</a></li>
<li><a href="https://github.com/camiloaz"><code>@​camiloaz</code></a> made their first contribution in <a href="">annotated-types/annotated-types#87</a></li>
<li><a href="https://github.com/mattip"><code>@​mattip</code></a> made their first contribution in <a href="">annotated-types/annotated-types#88</a></li>
<li><a href="https://github.com/leogermond"><code>@​leogermond</code></a> made their first contribution in <a href="">annotated-types/annotated-types#90</a></li>
<li><a href="https://github.com/wichert"><code>@​wichert</code></a> made their first contribution in <a href="">annotated-types/annotated-types#92</a></li>
<li><a href="https://github.com/imtoopunkforyou"><code>@​imtoopunkforyou</code></a> made their first contribution in <a href="">annotated-types/annotated-types#96</a></li>
<li><a href="https://github.com/Dutcho"><code>@​Dutcho</code></a> made their first contribution in <a href="">annotated-types/annotated-types#100</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/annotated-types/annotated-types/compare/v0.7.0...v0.8.0">https://github.com/annotated-types/annotated-types/compare/v0.7.0...v0.8.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>9eb9668</code></a> Prepare for 0.8.0 release (<a href="">#103</a>)</li>
<li><a href=""><code>10b7764</code></a> Fix typo in <code>Len</code> docstring (<a href="">#100</a>)</li>
<li><a href=""><code>955f757</code></a> Add support for Python 3.14 and drop EOL 3.8-3.9 (<a href="">#97</a>)</li>
<li><a href=""><code>bd280fe</code></a> Added Python 3.14 to the test matrix (<a href="">#96</a>)</li>
<li><a href=""><code>a471bb7</code></a> Add SPDX license expression (<a href="">#92</a>)</li>
<li><a href=""><code>eab91d9</code></a> Fix string predicate names in doc (<a href="">#90</a>)</li>
<li><a href=""><code>03ad9c3</code></a> add CI for PyPy3.11 and fix test (issue 71) (<a href="">#88</a>)</li>
<li><a href=""><code>5ae6043</code></a> fix: typo in README.md (<a href="">#87</a>)</li>
<li><a href=""><code>b60ad7b</code></a> Update license-files to be PEP-639 compliant (<a href="">#85</a>) (<a href="">#86</a>)</li>
<li><a href=""><code>3fbeb6d</code></a> Fix docstring of <code>Timezone</code> (<a href="">#84</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/annotated-types/annotated-types/compare/v0.7.0...v0.8.0">compare view</a></li>
</ul>
</details>
<br />

Updates `filelock` from 3.30.2 to 3.32.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tox-dev/py-filelock/releases">filelock's releases</a>.</em></p>
<blockquote>
<h2>3.32.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>👷 ci: add Python 3.15 to the test matrix by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#683</a></li>
<li>🐛 fix(packaging): let an unpacked sdist run the test suite by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#685</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.31.2...3.32.0">https://github.com/tox-dev/filelock/compare/3.31.2...3.32.0</a></p>
<h2>3.31.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>🐛 fix(strict): tolerate an errno without ENOTSUP by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#681</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.31.1...3.31.2">https://github.com/tox-dev/filelock/compare/3.31.1...3.31.2</a></p>
<h2>3.31.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>♻️ refactor(coverage): key exclusions on probed capability by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#679</a></li>
<li>scope a lease's claim to the context that acquired it by <a href="https://github.com/dxbjavid"><code>@​dxbjavid</code></a> in <a href="">tox-dev/filelock#680</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.31.0...3.31.1">https://github.com/tox-dev/filelock/compare/3.31.0...3.31.1</a></p>
<h2>3.31.0</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>✨ feat(platform): support Termux/Android by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#678</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.30.3...3.31.0">https://github.com/tox-dev/filelock/compare/3.30.3...3.31.0</a></p>
<h2>3.30.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<ul>
<li>Keep both tables of contents on screen at any browser font size by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#673</a></li>
<li>📝 docs(mermaid): follow the light and dark theme toggle by <a href="https://github.com/gaborbernat"><code>@​gaborbernat</code></a> in <a href="">tox-dev/filelock#674</a></li>
<li>asyncio: scope the reentrant-deadlock registry to the owning task by <a href="https://github.com/xt-yin"><code>@​xt-yin</code></a> in <a href="">tox-dev/filelock#676</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/xt-yin"><code>@​xt-yin</code></a> made their first contribution in <a href="">tox-dev/filelock#676</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tox-dev/filelock/compare/3.30.2...3.30.3">https://github.com/tox-dev/filelock/compare/3.30.2...3.30.3</a></p>
</blockquote>
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
<p>3.32.0 (2026-07-21)</p>
<hr />
<ul>
<li><code>SoftReadWriteLock</code> closes the directory handle it opens to scan for readers as soon as a scan stops early, rather
than holding it until the generator is collected. :pr:<code>685</code></li>
<li>Declare support for Python 3.15 and run the test suite against it and its free-threaded build, both currently in beta. :pr:<code>683</code></li>
<li>The source distribution ships the capability probes the tests import, and reading one no longer needs <code>coverage</code>
installed, so the suite runs from an unpacked sdist instead of failing on a missing <code>coverage_pragmas</code>. :pr:<code>685</code></li>
</ul>
<hr />
<p>3.31.2 (2026-07-21)</p>
<hr />
<ul>
<li><code>filelock</code> imports again on runtimes whose <code>errno</code> omits <code>ENOTSUP</code>, such as GraalPy, where importing the package
raised <code>ImportError</code>. It probes the code instead, preferring <code>ENOTSUP</code>, falling back to <code>EOPNOTSUPP</code> where that
name is absent, and dropping to <code>ENOSYS</code>/<code>EXDEV</code> where neither exists. Platforms defining <code>ENOTSUP</code> keep their
behavior. :pr:<code>681</code></li>
</ul>
<hr />
<p>3.31.1 (2026-07-20)</p>
<hr />
<ul>
<li>A <code>SoftFileLease</code> acquired on one thread keeps its claim when another thread fails to acquire the same lease object,
so its heartbeat carries on refreshing the marker instead of being torn down and letting a peer take the live claim. :pr:<code>680</code></li>
</ul>
<hr />
<p>3.31.0 (2026-07-18)</p>
<hr />
<ul>
<li>Support Termux/Android, whose CPython ships without <code>os.link</code> and reports <code>sys.platform == &quot;android&quot;</code>. <code>import filelock</code> and both <code>FileLock</code> and <code>SoftFileLock</code> now work there, <code>StrictSoftFileLock</code> reports its missing
hard-link support only when acquired, and process liveness reads <code>/proc</code> on Android instead of PID-only checks. :pr:<code>678</code></li>
<li><code>StrictSoftFileLock</code> no longer lets two processes hold the lock at once under heavy contention. A holder now keeps
its intent claim for the whole hold, so a contender whose directory scan races the holder's freshly linked claim can no
longer miss it and win alongside it. A held lock now exposes both an <code>intent</code> and a <code>held</code> claim. :pr:<code>678</code></li>
</ul>
<hr />
<p>3.30.3 (2026-07-17)</p>
<hr />
<ul>
<li><code>AsyncFileLock</code> and <code>AsyncSoftFileLock</code> no longer raise a deadlock <code>RuntimeError</code> when a different asyncio task</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>76525e6</code></a> Release 3.32.0</li>
<li><a href=""><code>9824d15</code></a> 🐛 fix(packaging): let an unpacked sdist run the test suite (<a href="">#685</a>)</li>
<li><a href=""><code>f6c41e9</code></a> 👷 ci: add Python 3.15 to the test matrix (<a href="">#683</a>)</li>
<li><a href=""><code>caeb1c9</code></a> Release 3.31.2</li>
<li><a href=""><code>60eda0f</code></a> 🐛 fix(strict): tolerate an errno without ENOTSUP (<a href="">#681</a>)</li>
<li><a href=""><code>c1b2e6f</code></a> Release 3.31.1</li>
<li><a href=""><code>9fd7de5</code></a> scope a lease's claim to the context that acquired it (<a href="">#680</a>)</li>
<li><a href=""><code>2b3ad2c</code></a> ♻️ refactor(coverage): key exclusions on probed capability (<a href="">#679</a>)</li>
<li><a href=""><code>3b66fdc</code></a> Release 3.31.0</li>
<li><a href=""><code>166b2b5</code></a> ✨ feat(platform): support Termux/Android (<a href="">#678</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tox-dev/py-filelock/compare/3.30.2...3.32.0">compare view</a></li>
</ul>
</details>
<br />

Updates `meegkit` from 0.1.9 to 0.2.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/nbara/python-meegkit/releases">meegkit's releases</a>.</em></p>
<blockquote>
<h2>v0.2.0</h2>
<h2>What's Changed</h2>
<ul>
<li>[FIX] ASR fixes by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#90</a></li>
<li>[ENH] Annotations in dss_line_iter plots and specification of a saving path by <a href="https://github.com/eliasbenyahia"><code>@​eliasbenyahia</code></a> in <a href="">nbara/python-meegkit#89</a></li>
<li>[MAINT] Fix tests and update Python to &gt;=3.9 by <a href="https://github.com/nbara"><code>@​nbara</code></a> in <a href="">nbara/python-meegkit#95</a></li>
<li>[ENH] return input data if score is negative on first iter by <a href="https://github.com/Randomidous"><code>@​Randomidous</code></a> in <a href="">nbara/python-meegkit#94</a></li>
<li>Bump the actions group with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">nbara/python-meegkit#92</a></li>
<li>perf(asr): compute windowed RMS via cumulative sum by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#104</a></li>
<li>[MAINT] Update minimum Python to 3.10 by <a href="https://github.com/nbara"><code>@​nbara</code></a> in <a href="">nbara/python-meegkit#108</a></li>
<li>[MAINT] Update pyriemann mean import by <a href="https://github.com/bruAristimunha"><code>@​bruAristimunha</code></a> in <a href="">nbara/python-meegkit#103</a></li>
<li>[ENH] ASR: build clean_windows sample mask without quadratic concat by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#105</a></li>
<li>[ENH] ASR: vectorise fit_eeg_distribution grid search by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#106</a></li>
<li>[FIX] ASR: return an estimate when geometric_median does not converge by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#107</a></li>
<li>[FIX] ASR: make nonlinear_eigenspace reproducible by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#118</a></li>
<li>[DOC] ASR: fix numpydoc docstring rendering by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#119</a></li>
<li>[MAINT] ASR: defensive hardening and docstring fixes by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#117</a></li>
<li>[MAINT] ASR: fit_eeg_distribution docstring fixes + asr_calibrate input guards by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#121</a></li>
<li>[FIX] ASR: init clean_windows rejection masks before one-sided zthresholds by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#113</a></li>
<li>[FIX] ASR: reuse full SHAPE_RANGE grid in clean_windows (include beta=3.5) by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#115</a></li>
<li>[FIX] ASR: asr_calibrate must pass step_sizes to fit_eeg_distribution by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#109</a></li>
<li>[FIX] ASR: uncentered scm block covariance + overlap/bound/jump fixes by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#110</a></li>
<li>[FIX] ASR: correct reconstruction dim count, blend seam, and RMS window rounding by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#111</a></li>
<li>[FIX] ASR: apply online recency weights on the euclid path (weighted geometric median) by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#112</a></li>
<li>[FIX] ASR: use a real PSD square root in asr_calibrate by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#114</a></li>
<li>[FIX] ASR: round half away from zero for window/bad-chan counts by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#116</a></li>
<li>[FIX] ASR: tolerate flat/degenerate segments in fit_eeg_distribution by <a href="https://github.com/sappelhoff"><code>@​sappelhoff</code></a> in <a href="">nbara/python-meegkit#120</a></li>
<li>[FIX] riemann ASR eigpair mismatch in nonlinear_eigenspace by <a href="https://github.com/nbara"><code>@​nbara</code></a> in <a href="">nbara/python-meegkit#100</a></li>
<li>[MAINT] Bump the actions group across 1 directory with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">nbara/python-meegkit#98</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/eliasbenyahia"><code>@​eliasbenyahia</code></a> made their first contribution in <a href="">nbara/python-meegkit#89</a></li>
<li><a href="https://github.com/Randomidous"><code>@​Randomidous</code></a> made their first contribution in <a href="">nbara/python-meegkit#94</a></li>
<li><a href="https://github.com/bruAristimunha"><code>@​bruAristimunha</code></a> made their first contribution in <a href="">nbara/python-meegkit#103</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/nbara/python-meegkit/compare/v0.1.9...v0.2.0">https://github.com/nbara/python-meegkit/compare/v0.1.9...v0.2.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>2c09b8f</code></a> [MAINT] Bump version to 0.2.0</li>
<li><a href=""><code>380556c</code></a> [MAINT] Bump the actions group across 1 directory with 2 updates (<a href="">#98</a>)</li>
<li><a href=""><code>5f507e6</code></a> [FIX] riemann ASR eigpair mismatch in nonlinear_eigenspace (<a href="">#100</a>)</li>
<li><a href=""><code>72054a4</code></a> [FIX] ASR: tolerate flat/degenerate segments in fit_eeg_distribution (<a href="">#120</a>)</li>
<li><a href=""><code>1ae2321</code></a> [FIX] ASR: round half away from zero for window/bad-chan counts (<a href="">#116</a>)</li>
<li><a href=""><code>cbc8943</code></a> [FIX] ASR: use a real PSD square root in asr_calibrate (<a href="">#114</a>)</li>
<li><a href=""><code>f71758d</code></a> [FIX] ASR: apply online recency weights on the euclid path (weighted geometri...</li>
<li><a href=""><code>8e53091</code></a> [FIX] ASR: correct reconstruction dim count, blend seam, and RMS window round...</li>
<li><a href=""><code>3b0c530</code></a> [FIX] ASR: uncentered scm block covariance + overlap/bound/jump fixes (<a href="">#110</a>)</li>
<li><a href=""><code>ba7aa78</code></a> [FIX] ASR: asr_calibrate must pass step_sizes to fit_eeg_distribution (<a href="">#109</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/nbara/python-meegkit/compare/v0.1.9...v0.2.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ruff` from 0.15.22 to 0.16.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/releases">ruff's releases</a>.</em></p>
<blockquote>
<h2>0.16.0</h2>
<h2>Release Notes</h2>
<p>Released on 2026-07-23.</p>
<p>Check out the <a href="https://astral.sh/blog/ruff-v0.16.0">blog post</a> for a migration guide and overview of the changes!</p>
<h3>Breaking changes</h3>
<ul>
<li>
<p>Ruff now enables a much larger set of rules by default (413, up from 59). See the blog post for more details and the new <a href="https://docs.astral.sh/ruff/default-rules/">Default Rules</a> page for a full listing of the enabled rules.</p>
</li>
<li>
<p>Ruff can now format Python code blocks in Markdown files and will do this by default. See the <a href="https://docs.astral.sh/ruff/formatter/#markdown-code-formatting">documentation</a> for more details.</p>
</li>
<li>
<p>Ruff now supports <code>ruff: ignore</code> comments at the ends of lines, like <code>noqa</code> comments, or on the line preceding a diagnostic. For example, these both suppress an <a href="https://docs.astral.sh/ruff/rules/unused-import/"><code>unused-import</code></a> (<code>F401</code>) diagnostic:</p>
<pre lang="py"><code>import math  # ruff: ignore[F401]
<h1>ruff: ignore[F401]</h1>
<p>import os
</code></pre></p>
</li>
<li>
<p>Fixes are now shown in <code>check</code> and <code>format --check</code> output:</p>
<pre lang="console"><code>❯ ruff format --check .
unformatted: File would be reformatted
 --&gt; try.md:1:1
  |
1 | ```python
  - import   math
2 + import math
3 | ```
  |
<p>1 file would be reformatted
</code></pre></p>
<p>This example also shows off the Markdown formatting.</p>
</li>
<li>
<p><code>format --check</code> now supports the same output formats as the linter, including the <code>github</code> and <code>gitlab</code> outputs for rendering annotations in CI:</p>
<pre lang="console"><code>❯ ruff format --check --output-format github .
::error title=ruff (unformatted),file=try.md,line=2,col=8,endLine=2,endColumn=10::try.md:2:8: unformatted: File would be reformatted
</code></pre>
<p>See the CLI help or <a href="https://docs.astral.sh/ruff/settings/#output-format">documentation</a> for the full list of supported formats.</p>
</li>
<li>
<p>The <code>filename</code>, <code>location</code>, <code>end_location</code>, <code>fix.edits[].location</code>, and <code>fix.edits[].end_location</code> fields in the JSON output format may now be <code>null</code> rather than defaulting to the empty string and row 1, column 1, respectively.</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ruff/blob/main/CHANGELOG.md">ruff's changelog</a>.</em></p>
<blockquote>
<h2>0.16.0</h2>
<p>Released on 2026-07-23.</p>
<p>Check out the <a href="https://astral.sh/blog/ruff-v0.16.0">blog post</a> for a migration
guide and overview of the changes!</p>
<h3>Breaking changes</h3>
<ul>
<li>
<p>Ruff now enables a much larger set of rules by default (413, up from 59). See the blog post for
more details and the new <a href="https://docs.astral.sh/ruff/default-rules/">Default Rules</a> page for a
full listing of the enabled rules.</p>
</li>
<li>
<p>Ruff can now format Python code blocks in Markdown files and will do this by default. See the
<a href="https://docs.astral.sh/ruff/formatter/#markdown-code-formatting">documentation</a> for more details.</p>
</li>
<li>
<p>Ruff now supports <code>ruff: ignore</code> comments at the ends of lines, like <code>noqa</code> comments, or on the line preceding a diagnostic. For example, these both suppress an <a href="https://docs.astral.sh/ruff/rules/unused-import/"><code>unused-import</code></a> (<code>F401</code>) diagnostic:</p>
<pre lang="py"><code>import math  # ruff: ignore[F401]
<h1>ruff: ignore[F401]</h1>
<p>import os
</code></pre></p>
</li>
<li>
<p>Fixes are now shown in <code>check</code> and <code>format --check</code> output:</p>
<pre lang="console"><code>❯ ruff format --check .
unformatted: File would be reformatted
 --&gt; try.md:1:1
  |
1 | ```python
  - import   math
2 + import math
3 | ```
  |
<p>1 file would be reformatted
</code></pre></p>
<p>This example also shows off the Markdown formatting.</p>
</li>
<li>
<p><code>format --check</code> now supports the same output formats as the linter, including the <code>github</code> and
<code>gitlab</code> outputs for rendering annotations in CI:</p>
<pre lang="console"><code>❯ ruff format --check --output-format github .
::error title=ruff (unformatted),file=try.md,line=2,col=8,endLine=2,endColumn=10::try.md:2:8: unformatted: File would be reformatted
</code></pre>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>a2635fd</code></a> Bump 0.16.0 (<a href="">#27136</a>)</li>
<li><a href=""><code>3433449</code></a> [ty] Reuse full call diagnostics for implicit setter calls (<a href="">#27115</a>)</li>
<li><a href=""><code>2240070</code></a> Reflect <code>ruff: ignore</code> and <code>--add-ignore</code> stabilization in documentation (<a href="">#27</a>...</li>
<li><a href=""><code>17ef711</code></a> Stabilize <code>--add-ignore</code> (<a href="">#27125</a>)</li>
<li><a href=""><code>ef912bb</code></a> Add newly stabilized rules to defaults (<a href="">#27055</a>)</li>
<li><a href=""><code>b30f040</code></a> Stabilize new default rules (<a href="">#27035</a>)</li>
<li><a href=""><code>bcd70c5</code></a> Exclude Markdown files from <code>format-dev</code> runs (<a href="">#27052</a>)</li>
<li><a href=""><code>87e51e2</code></a> Fix <code>format --check</code> spans for syntax errors (<a href="">#27045</a>)</li>
<li><a href=""><code>afe2723</code></a> [<code>flake8-gettext</code>] Stabilize qualified-name and built-in binding resolution (...</li>
<li><a href=""><code>a9702d8</code></a> [<code>flake8-bandit</code>] Stabilize string literal binding resolution (<code>S310</code>) (<a href="">#26944</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/astral-sh/ruff/compare/0.15.22...0.16.0">compare view</a></li>
</ul>
</details>
<br />

Updates `tombi` from 1.2.0 to 1.2.4
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tombi-toml/tombi/releases">tombi's releases</a>.</em></p>
<blockquote>
<h2>v1.2.4</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🛠️ Other Changes</h3>
<ul>
<li>fix(date-time): accept leap second 60 in date-time values by <a href="https://github.com/LordAizen1"><code>@​LordAizen1</code></a> in <a href="">tombi-toml/tombi#2024</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/LordAizen1"><code>@​LordAizen1</code></a> made their first contribution in <a href="">tombi-toml/tombi#2024</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.2.3...v1.2.4">https://github.com/tombi-toml/tombi/compare/v1.2.3...v1.2.4</a></p>
<h2>v1.2.3</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🦅 New Features</h3>
<ul>
<li>Allow comment directives to suppress schema resolution warnings by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2023</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>ci: finalize illumos install checks by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2021</a></li>
<li>fix(ci): preserve winget release metadata by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2022</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.2.2...v1.2.3">https://github.com/tombi-toml/tombi/compare/v1.2.2...v1.2.3</a></p>
<h2>v1.2.2</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<h3>🐝 Bug Fixes</h3>
<ul>
<li>ci: submit winget manifest leaf directory by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2018</a></li>
</ul>
<h3>📦 Dependencies</h3>
<ul>
<li>chore: update package lock files for SunOS package by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2020</a></li>
</ul>
<h3>🛠️ Other Changes</h3>
<ul>
<li>feat(dist): add x86_64-unknown-illumos binary distribution by <a href="https://github.com/sunshowers"><code>@​sunshowers</code></a> in <a href="">tombi-toml/tombi#2014</a></li>
<li>refactor(dist): infer CLI-only illumos builds by <a href="https://github.com/ya7010"><code>@​ya7010</code></a> in <a href="">tombi-toml/tombi#2019</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/sunshowers"><code>@​sunshowers</code></a> made their first contribution in <a href="">tombi-toml/tombi#2014</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/tombi-toml/tombi/compare/v1.2.1...v1.2.2">https://github.com/tombi-toml/tombi/compare/v1.2.1...v1.2.2</a></p>
<h2>v1.2.1</h2>
<!-- raw HTML omitted -->
<h2>What's Changed</h2>
<p>In this release, we have updated the linter to issue a warning if it is unable to resolve elements such as $ref within a JSON Schema.</p>
<h3>🐝 Bug Fixes</h3>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>3a42251</code></a> fix(date-time): accept leap second 60 in date-time values (<a href="">#2024</a>)</li>
<li><a href=""><code>eed2bf7</code></a> docs: update install.sh stable version to 1.2.3</li>
<li><a href=""><code>6b07944</code></a> Allow comment directives to suppress schema resolution warnings (<a href="">#2023</a>)</li>
<li><a href=""><code>7f2b6d0</code></a> fix(ci): preserve winget release metadata (<a href="">#2022</a>)</li>
<li><a href=""><code>cf63764</code></a> ci: finalize illumos install checks (<a href="">#2021</a>)</li>
<li><a href=""><code>c6f1c74</code></a> docs: update install.sh stable version to 1.2.2</li>
<li><a href=""><code>b087cdd</code></a> refactor(dist): infer CLI-only illumos builds (<a href="">#2019</a>)</li>
<li><a href=""><code>dc8f06e</code></a> chore: update package lock files for SunOS package (<a href="">#2020</a>)</li>
<li><a href=""><code>7adb293</code></a> feat(dist): add x86_64-unknown-illumos binary distribution (<a href="">#2014</a>)</li>
<li><a href=""><code>a42b3e8</code></a> ci: submit winget manifest leaf directory (<a href="">#2018</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/tombi-toml/tombi/compare/v1.2.0...v1.2.4">compare view</a></li>
</ul>
</details>
<br />

Updates `tqdm` from 4.68.4 to 4.69.0
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/tqdm/tqdm/releases">tqdm's releases</a>.</em></p>
<blockquote>
<h2>tqdm v4.69.0 stable</h2>
<ul>
<li>add <code>tqdm.asyncio.gather(..., return_exceptions=False)</code> (<a href="">#1776</a>, <a href="">#1671</a> &lt;- <a href="">#1286</a>)</li>
<li>misc minor framework updates
<ul>
<li>bump workflow actions &amp; pre-commit hooks</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6ab24dc</code></a> bump version, workflow actions, pre-commit hooks</li>
<li><a href=""><code>99615b9</code></a> asyncio: add gather(return_exceptions=False) (<a href="">#1776</a>)</li>
<li>See full diff in <a href="https://github.com/tqdm/tqdm/compare/v4.68.4...v4.69.0">compare view</a></li>
</ul>
</details>
<br />

Updates `ty` from 0.0.60 to 0.0.63
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/astral-sh/ty/releases">ty's releases</a>.</em></p>
<blockquote>
<h2>0.0.63</h2>
<h2>Release Notes</h2>
<p>Released on 2026-07-23.</p>
<h3>Core type checking</h3>
<ul>
<li>Handle generic stringified PEP 613 (<code>typing.TypeAlias</code>) type aliases (<a href="">#27092</a>)</li>
<li>Allow equality narrowing across non-final classes (<a href="">#27031</a>)</li>
<li>Allow interpolated string literals to be promoted to <code>str</code> (<a href="">#27104</a>)</li>
<li>Fix double specialization of generic type aliases (<a href="">#27058</a>)</li>
<li>Fix intersections of <code>type</code> and <code>TypeForm</code> (<a href="">#27099</a>)</li>
<li>When narrowing from a <code>match</code> statement leads a variable <code>x</code> to be inferred as <code>A &amp; B</code>, infer the type of <code>x.attr</code> as <code>&lt;type of A.attr&gt; &amp; &lt;type of B.attr&gt;</code> (<a href="">#27103</a>)</li>
</ul>
<h3>Library support</h3>
<ul>
<li>Pydantic: Stricter validation of sub-model fields in lax mode (<a href="">#27091</a>)</li>
<li>Pydantic: Support special underscore parameters in <code>BaseSettings</code> models (<a href="">#27098</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid exponential narrowing of optional dynamic <code>match</code> subjects (<a href="">#27100</a>)</li>
<li>Avoid normalizing cached absolute file paths (<a href="">#26998</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
</ul>
<h2>Install ty 0.0.63</h2>
<h3>Install prebuilt binaries via shell script</h3>
<pre lang="sh"><code>curl --proto '=https' --tlsv1.2 -LsSf https://releases.astral.sh/github/ty/releases/download/0.0.63/ty-installer.sh | sh
</code></pre>
<h3>Install prebuilt binaries via powershell script</h3>
<pre lang="sh"><code>powershell -ExecutionPolicy Bypass -c &quot;irm https://releases.astral.sh/github/ty/releases/download/0.0.63/ty-installer.ps1 | iex&quot;
</code></pre>
<h2>Download ty 0.0.63</h2>
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
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.63/ty-aarch64-apple-darwin.tar.gz">ty-aarch64-apple-darwin.tar.gz</a></td>
<td>Apple Silicon macOS</td>
<td><a href="https://releases.astral.sh/github/ty/releases/download/0.0.63/ty-aarch64-apple-darwin.tar.gz.sha256">checksum</a></td>
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
<h2>0.0.63</h2>
<p>Released on 2026-07-23.</p>
<h3>Core type checking</h3>
<ul>
<li>Handle generic stringified PEP 613 (<code>typing.TypeAlias</code>) type aliases (<a href="">#27092</a>)</li>
<li>Allow equality narrowing across non-final classes (<a href="">#27031</a>)</li>
<li>Allow interpolated string literals to be promoted to <code>str</code> (<a href="">#27104</a>)</li>
<li>Fix double specialization of generic type aliases (<a href="">#27058</a>)</li>
<li>Fix intersections of <code>type</code> and <code>TypeForm</code> (<a href="">#27099</a>)</li>
<li>When narrowing from a <code>match</code> statement leads a variable <code>x</code> to be inferred as <code>A &amp; B</code>, infer the type of <code>x.attr</code> as <code>&lt;type of A.attr&gt; &amp; &lt;type of B.attr&gt;</code> (<a href="">#27103</a>)</li>
</ul>
<h3>Library support</h3>
<ul>
<li>Pydantic: Stricter validation of sub-model fields in lax mode (<a href="">#27091</a>)</li>
<li>Pydantic: Support special underscore parameters in <code>BaseSettings</code> models (<a href="">#27098</a>)</li>
</ul>
<h3>Performance</h3>
<ul>
<li>Avoid exponential narrowing of optional dynamic <code>match</code> subjects (<a href="">#27100</a>)</li>
<li>Avoid normalizing cached absolute file paths (<a href="">#26998</a>)</li>
</ul>
<h3>Contributors</h3>
<ul>
<li><a href="https://github.com/sharkdp"><code>@​sharkdp</code></a></li>
<li><a href="https://github.com/charliermarsh"><code>@​charliermarsh</code></a></li>
<li><a href="https://github.com/ibraheemdev"><code>@​ibraheemdev</code></a></li>
<li><a href="https://github.com/carljm"><code>@​carljm</code></a></li>
</ul>
<h2>0.0.62</h2>
<p>Released on 2026-07-21.</p>
<h3>Bug fixes</h3>
<ul>
<li>Guard recursive <code>Protocol</code> and <code>TypedDict</code> relations (<a href="">#26990</a>)</li>
<li>Prevent stack overflows in recursive type relation checks (<a href="">#26503</a>)</li>
<li>Recover from cancelled file indexing (<a href="">#26876</a>)</li>
</ul>
<h3>Diagnostics</h3>
<ul>
<li>Avoid editing ignore comments with trailing reasons (<a href="">#26939</a>)</li>
<li>Prefer innermost inline suppressions (<a href="">#26940</a>)</li>
<li>Remove unused own-line ignore comments (<a href="">#27013</a>)</li>
<li>Reuse applicable own-line suppressions in <code>--add-ignore</code> (<a href="">#26925</a>)</li>
</ul>
<h3>Configuration</h3>
<ul>
<li>Respect <code>rules</code> and <code>analysis</code> in PEP 723 script metadata configurations (<a href="">#26671</a>)</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>46f4915</code></a> Bump version to 0.0.63 (<a href="">#4071</a>)</li>
<li><a href=""><code>df75992</code></a> Bump version to 0.0.62 (<a href="">#4057</a>)</li>
<li><a href=""><code>48dd1fd</code></a> Update prek dependencies (<a href="">#4059</a>)</li>
<li><a href=""><code>f53a95e</code></a> Update astral-sh/setup-uv action to v9 (<a href="">#4060</a>)</li>
<li><a href=""><code>17d1791</code></a> Update dependency prek to v0.4.9 (<a href="">#4058</a>)</li>
<li><a href=""><code>eb7e7ba</code></a> Update documentation on mypy/pyright <code>--strict</code> parity, and achieving maximum...</li>
<li><a href=""><code>56b2c24</code></a> Update changelog for 0.0.61 (<a href="">#4028</a>)</li>
<li><a href=""><code>4c865c8</code></a> Bump version to 0.0.61 (<a href="">#4027</a>)</li>
<li>See full diff in <a href="https://github.com/astral-sh/ty/compare/0.0.60...0.0.63">compare view</a></li>
</ul>
</details>
<br />

Updates `mkdocs-material` from 9.7.6 to 9.7.7
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/releases">mkdocs-material's releases</a>.</em></p>
<blockquote>
<h2>mkdocs-material-9.7.7</h2>
<blockquote>
<p>[!WARNING]</p>
<p><strong>Material for MkDocs is approaching end of life</strong></p>
<p>Material for MkDocs is scheduled to reach end of life on November 5, 2026. Until then, maintenance is limited to critical bug fixes and security updates.</p>
<p>The path forward is <a href="https://zensical.org">Zensical</a>, our next-generation static site generator built from first principles. If you’re planning a new documentation project or thinking about your long-term setup, we encourage you to start exploring Zensical.</p>
<p>Organizations requiring support beyond this date can <a href="https://github.com/squidfunk/mkdocs-material/blob/HEAD/mailto:hello@zensical.org">get in touch</a> to discuss options.</p>
<p><a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">Read the full announcement on our blog</a></p>
</blockquote>
<h2>Changes</h2>
<ul>
<li>Fixed a DOM-based XSS vulnerability in search suggestions</li>
</ul>
<blockquote>
<p>Thanks to <a href="https://github.com/p"><code>@​p</code></a>- for responsibly reporting this issue.</p>
</blockquote>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/squidfunk/mkdocs-material/blob/master/CHANGELOG">mkdocs-material's changelog</a>.</em></p>
<blockquote>
<p>mkdocs-material-9.7.7 (2026-07-17)</p>
<ul>
<li>Fixed DOM-based XSS vulnerability in search suggestions</li>
</ul>
<p>mkdocs-material-9.7.6 (2026-03-19)</p>
<ul>
<li>Automatically disable MkDocs 2.0 warning for forks of MkDocs</li>
</ul>
<p>mkdocs-material-9.7.5 (2026-03-10)</p>
<ul>
<li>Limited version range of mkdocs to &lt;2</li>
<li>Updated MkDocs 2.0 incompatibility warning (clarify relation with MkDocs)</li>
</ul>
<p>mkdocs-material-9.7.4 (2026-03-03)</p>
<ul>
<li>Hardened social cards plugin by switching to sandboxed environment</li>
<li>Updated MkDocs 2.0 incompatibility warning</li>
</ul>
<p>mkdocs-material-9.7.3 (2026-02-24)</p>
<ul>
<li>Fixed <a href="">#8567</a>: Print MkDocs 2.0 incompatibility warning to stderr</li>
</ul>
<p>mkdocs-material-9.7.2 (2026-02-18)</p>
<ul>
<li>Opened up version ranges of optional dependencies for forward-compatibility</li>
<li>Added warning to 'mkdocs build' about impending MkDocs 2.0 incompatibility</li>
</ul>
<p>mkdocs-material-9.7.1 (2025-12-18)</p>
<ul>
<li>Updated requests to 2.30+ to mitigate CVE in urllib</li>
<li>Fixed privacy plugin not picking up protocol-relative URLs</li>
<li>Fixed <a href="">#8542</a>: false positives and negatives captured in privacy plugin</li>
</ul>
<p>mkdocs-material-9.7.0 (2025-11-11)</p>
<p>⚠️ Material for MkDocs is now in maintenance mode</p>
<p>This is the last release of Material for MkDocs that will receive new features.
Going forward, the Material for MkDocs team focuses on Zensical, a next-gen
static site generator built from first principles. We will provide critical
bug fixes and security updates for Material for MkDocs for 12 months at least.</p>
<p>Read the full announcement on our blog:
<a href="https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/">https://squidfunk.github.io/mkdocs-material/blog/2025/11/05/zensical/</a></p>
<p>This release includes all features that were previously exclusive to the
Insiders edition. These features are now freely available to everyone.</p>
<p>Note on deprecated plugins: The projects and typeset plugins are included in
this release, but must be considered deprecated. Both plugins proved</p>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b3e6dd8</code></a> Prepare 9.7.7 release</li>
<li><a href=""><code>52fb6be</code></a> Merge commit from fork</li>
<li><a href=""><code>901e633</code></a> Added <code>SECURITY.md</code> with EOL notice</li>
<li><a href=""><code>5b36f2a</code></a> Bump js-yaml from 4.1.1 to 4.2.0 (<a href="">#8598</a>)</li>
<li><a href=""><code>2d11e7b</code></a> Bump form-data from 3.0.4 to 3.0.5 (<a href="">#8597</a>)</li>
<li><a href=""><code>ae05a53</code></a> Bump esbuild from 0.27.2 to 0.28.1 (<a href="">#8596</a>)</li>
<li><a href=""><code>434af93</code></a> Bump shell-quote from 1.7.3 to 1.8.4 (<a href="">#8593</a>)</li>
<li><a href=""><code>4447cda</code></a> Documentation (<a href="">#8590</a>)</li>
<li><a href=""><code>8f8d551</code></a> Updated copyright year (<a href="">#8588</a>)</li>
<li><a href=""><code>08d8514</code></a> Bump fast-uri from 3.0.3 to 3.1.2 (<a href="">#8587</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/squidfunk/mkdocs-material/compare/9.7.6...9.7.7">compare view</a></li>
</ul>
</details>
<br />

Updates `pyriemann` from 0.11 to 0.12
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/pyRiemann/pyRiemann/releases">pyriemann's releases</a>.</em></p>
<blockquote>
<h2>v0.12</h2>
<p>version 0.12, supporting both NumPy and PyTorch backends</p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pyRiemann/pyRiemann/blob/master/doc/whatsnew.rst">pyriemann's changelog</a>.</em></p>
<blockquote>
<h2>v0.12 (July 2026)</h2>
<ul>
<li>
<p>Deprecate <code>covariances_X</code> and <code>cospectrum</code>.
:pr:<code>442</code> by :user:<code>qbarthelemy</code></p>
</li>
<li>
<p>Add <code>Python Array API &lt;https://data-apis.org/array-api/&gt;</code>_ support for NumPy/PyTorch
backend transparency in core utility modules (<code>base</code>, <code>covariance</code>, <code>distance</code>,
<code>mean</code>, <code>geodesic</code>, <code>tangentspace</code>, <code>ajd</code>, <code>kernel</code>, <code>median</code>), enabling
execution on both NumPy arrays and PyTorch tensors with optional GPU acceleration
and autograd support.
:pr:<code>433</code> by :user:<code>bruAristimunha</code></p>
</li>
<li>
<p>Move geometry modules (<code>ajd</code>, <code>base</code>, <code>covariance</code>, <code>distance</code>,
<code>geodesic</code>, <code>kernel</code>, <code>mean</code>, <code>median</code>, <code>tangentspace</code>, <code>test</code>)
from <code>pyriemann.utils</code> to a new standalone <code>pyriemann.geometry</code>
subpackage. The old import paths (e.g. <code>pyriemann.utils.mean</code>,
<code>pyriemann.utils.kernel</code>, <code>pyriemann.utils.test</code>) still work as
backward-compatibility shims but emit a <code>DeprecationWarning</code>; rename to
<code>pyriemann.geometry.&lt;module&gt;</code>. The private <code>pyriemann.utils._backend</code>
and <code>pyriemann._helpers</code> modules also moved into <code>pyriemann.geometry</code>
so that the subpackage is fully standalone (no internal pyriemann
imports outside of itself). Module <code>pyriemann.utils.utils</code> is renamed to
<code>pyriemann.utils._check</code> with the same shim+warning. Tests for moved
modules are renamed <code>test_utils_*</code> → <code>test_geometry_*</code>.
:pr:<code>445</code> by :user:<code>bruAristimunha</code></p>
</li>
<li>
<p>Enhance :func:<code>pyriemann.geometry.geodesic.geodesic</code> to accept <code>alpha</code> as an ndarray of shape <code>(...,)</code>,
allowing a different geodesic position per stacked matrix pair.
:pr:<code>396</code> by :user:<code>Fashad-Ahmed</code></p>
</li>
<li>
<p>Add example on Riemannian curvature analysis of sentence trajectories in language model embeddings,
demonstrating how local metric tensors (SPD matrices) capture geometric structure in LLM latent spaces
and enable classification of semantically distinct sentences using MDM.
:pr:<code>448</code> by :user:<code>SzczepanK112</code> and :user:<code>gcattan</code></p>
</li>
<li>
<p>Add example on simulated SPD matrices to compare metrics.
:pr:<code>451</code> by :user:<code>qbarthelemy</code></p>
</li>
<li>
<p>Add Bini-Meini-Poloni (BMP) mean :func:<code>pyriemann.geometry.mean.mean_bmp</code>,
and Cheap mean :func:<code>pyriemann.geometry.mean.mean_cheap</code>.
:pr:<code>449</code> by :user:<code>qbarthelemy</code></p>
</li>
<li>
<p>Move :class:<code>pyriemann.artifact_detection.Potato</code> and :class:<code>pyriemann.artifact_detection.PotatoField</code> from <code>clustering</code> to <code>artifact_detection</code>.
:pr:<code>453</code> by :user:<code>qbarthelemy</code></p>
</li>
<li>
<p>Rename and enhance <code>sample_gaussian_spd</code> into :func:<code>pyriemann.datasets.sample_gaussian</code>
to generate HPD matrices from complex-typed mean for float <code>sigma</code>.
:issue:<code>413</code> by :user:<code>robrui</code></p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>8a3395b</code></a> prepare release 0.12 (<a href="">#458</a>)</li>
<li><a href=""><code>ddac29c</code></a> Make stateless transformers report as fitted (<a href="">#457</a>)</li>
<li><a href=""><code>06165d8</code></a> Add innerproduct_logchol for SPD matrices (<a href="">#450</a>)</li>
<li><a href=""><code>e3f92f3</code></a> ENH: generalize sample_gaussian_spd to generate HPD matrices for float sigma ...</li>
<li><a href=""><code>a06e25f</code></a> Move Potato and PotatoField from clustering to artifactdetection (<a href="">#453</a>)</li>
<li><a href=""><code>ed33e39</code></a> Add BMP and Cheap means (<a href="">#449</a>)</li>
<li><a href=""><code>0340217</code></a> Complete tests and improve doc (<a href="">#452</a>)</li>
<li><a href=""><code>29d72dc</code></a> Add example to compare metrics (<a href="">#451</a>)</li>
<li><a href=""><code>3491da3</code></a> Add demo example for NLP (<a href="">#448</a>)</li>
<li><a href=""><code>3bfc3b1</code></a> ENH: allow array-valued alpha in utils.geodesic (<a href="">#446</a...

_Description has been truncated_

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `9175e2b3ea72`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.