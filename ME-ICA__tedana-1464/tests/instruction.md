# Issue

**Title:** Bump nilearn from 0.12.1 to 0.14.0

## Description

Bumps [nilearn](https://github.com/nilearn/nilearn) from 0.12.1 to 0.14.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/nilearn/nilearn/releases">nilearn's releases</a>.</em></p>
<blockquote>
<h2>0.14.0</h2>
<h2>What's Changed</h2>
<ul>
<li>[MAINT] post-release by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#5999</a></li>
<li>[ENH] Support pathlike objects for <code>cmap</code> argument in <code>plot_surf_roi</code> by <a href="https://github.com/jpaillard"><code>@​jpaillard</code></a> in <a href="">nilearn/nilearn#5981</a></li>
<li>[BOT] update AUTHORS.rst and doc/changes/names.rst by <a href="https://github.com/github-actions"><code>@​github-actions</code></a>[bot] in <a href="">nilearn/nilearn#6003</a></li>
<li>[FIX] Avoid using <code>_preprocess_data</code> function from sklearn by <a href="https://github.com/hndgzkn"><code>@​hndgzkn</code></a> in <a href="">nilearn/nilearn#6000</a></li>
<li>[MAINT] bump to sklearn 1.5.0 by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#5997</a></li>
<li>[MAINT] Remove pull_request trigger from testing minimal workflow by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6006</a></li>
<li>[ENH] Improve error messages when Chrome is not installed with newer kaleido versions by <a href="https://github.com/hndgzkn"><code>@​hndgzkn</code></a> in <a href="">nilearn/nilearn#6004</a></li>
<li>[MAINT] ignore ConvergenceWarnings in tests by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6001</a></li>
<li>[DEP] deprecations for 0.14.0 by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#5995</a></li>
<li>[FIX] ensure <code>is_gil_enabled</code> returns a bool by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6010</a></li>
<li>[REF] refactor get_params by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6002</a></li>
<li>[ENH] allow feature selection to be done by specifying a number of features to select by <a href="https://github.com/isha822"><code>@​isha822</code></a> in <a href="">nilearn/nilearn#5863</a></li>
<li>[REF] refactor existing benchmarks by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6007</a></li>
<li>[DOC] avoid showing matplotlib non-interactive warning in sphinx gallery by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6008</a></li>
<li>[MAINT] silence convergence warning by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6012</a></li>
<li>[DEP] remove new default in examples by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6011</a></li>
<li>[ENH] add public method to access fitted mask of GLM by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6005</a></li>
<li>[MAINT] Mark as thread unsafe the tests failing in parallel by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6013</a></li>
<li>chore: update pre-commit hooks by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">nilearn/nilearn#6017</a></li>
<li>[FIX] increase tolerance idempotent results for Searchlight by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6016</a></li>
<li>[FIX] allow local install with uv sync by <a href="https://github.com/mathdugre"><code>@​mathdugre</code></a> in <a href="">nilearn/nilearn#6024</a></li>
<li>[MAINT] Ignore sorting import doc/conf.py by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6026</a></li>
<li>[MAINT] less verbose log in one example by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6050</a></li>
<li>[MAINT] mark test as slow by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6053</a></li>
<li>[MISC] clean up TODOs and wrong version numbers by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6019</a></li>
<li>[ENH] test without aggressive garbage collection by <a href="https://github.com/bpinsard"><code>@​bpinsard</code></a> in <a href="">nilearn/nilearn#6039</a></li>
<li>[MAINT] Refactoring of nilearn.signals::standardize_signal by <a href="https://github.com/mathdugre"><code>@​mathdugre</code></a> in <a href="">nilearn/nilearn#6054</a></li>
<li>[MAINT] add <a href="">#6039</a> gc removal to changelog and add Basile to CITATION.cff by <a href="https://github.com/bpinsard"><code>@​bpinsard</code></a> in <a href="">nilearn/nilearn#6064</a></li>
<li>[PERF] Add warnings in NiftiMapsMasker transform when resampling images by <a href="https://github.com/pbarbarant"><code>@​pbarbarant</code></a> in <a href="">nilearn/nilearn#6028</a></li>
<li>[BOT] update AUTHORS.rst and doc/changes/names.rst by <a href="https://github.com/github-actions"><code>@​github-actions</code></a>[bot] in <a href="">nilearn/nilearn#6070</a></li>
<li>[FIX] add month hash to ci cache key to fix pre-fetch and caching of datasets by <a href="https://github.com/bpinsard"><code>@​bpinsard</code></a> in <a href="">nilearn/nilearn#6047</a></li>
<li>[PERF] Try using GPU via CuPy/PyTorch arrays by <a href="https://github.com/man-shu"><code>@​man-shu</code></a> in <a href="">nilearn/nilearn#5958</a></li>
<li>[ENH] Smoothing of surface data by <a href="https://github.com/jyeatman"><code>@​jyeatman</code></a> in <a href="">nilearn/nilearn#3267</a></li>
<li>[BOT] update AUTHORS.rst and doc/changes/names.rst by <a href="https://github.com/github-actions"><code>@​github-actions</code></a>[bot] in <a href="">nilearn/nilearn#6080</a></li>
<li>[MAINT] refactor some tests for smoothing by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6062</a></li>
<li>[FIX] Make <code>nilearn.plotting.view_img</code> resample non-isotropic images by <a href="https://github.com/michellewang"><code>@​michellewang</code></a> in <a href="">nilearn/nilearn#6031</a></li>
<li>[MAINT] Do not use MNI template image in tests for <code>view_img</code> by <a href="https://github.com/michellewang"><code>@​michellewang</code></a> in <a href="">nilearn/nilearn#6072</a></li>
<li>[MAINT] Refactoring of nilearn.plotting.image.utils.load_anat by <a href="https://github.com/mathdugre"><code>@​mathdugre</code></a> in <a href="">nilearn/nilearn#6079</a></li>
<li>[DOC] adding plot_carpet example by <a href="https://github.com/likeajumprope"><code>@​likeajumprope</code></a> in <a href="">nilearn/nilearn#6065</a></li>
<li>[BOT] update AUTHORS.rst and doc/changes/names.rst by <a href="https://github.com/github-actions"><code>@​github-actions</code></a>[bot] in <a href="">nilearn/nilearn#6086</a></li>
<li>[MAINT] Add changelog badges in a comment to <code>latest.rst</code> by <a href="https://github.com/michellewang"><code>@​michellewang</code></a> in <a href="">nilearn/nilearn#6084</a></li>
<li>[MAINT] prefetch data to avoid refetching during doc build by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6089</a></li>
<li>[DOC] improve setup for pre-commit by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6071</a></li>
<li>[PERF] Parallel signal extraction for img_to_signals_labels by <a href="https://github.com/pbarbarant"><code>@​pbarbarant</code></a> in <a href="">nilearn/nilearn#6041</a></li>
<li>[DOC] configure tox to easily run on all available pythons by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6085</a></li>
<li>[MAINT] reduce number of FutureWarning thrown when checking estimators by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6087</a></li>
<li>[DOC] Describe coef, intercept aggregation and predict in Decoder by <a href="https://github.com/man-shu"><code>@​man-shu</code></a> in <a href="">nilearn/nilearn#6076</a></li>
<li>Bump actions/upload-artifact from 6 to 7 by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">nilearn/nilearn#6104</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0d0429a</code></a> [FIX] fix minor issue in changelog (<a href="">#6371</a>)</li>
<li><a href=""><code>061dbf4</code></a> [REL] 0.14.0 (<a href="">#6347</a>)</li>
<li><a href=""><code>5d6fbd3</code></a> Bump actions/upload-artifact from 6 to 7 (<a href="">#6365</a>)</li>
<li><a href=""><code>78ce98c</code></a> Bump codecov/codecov-action from 6 to 7 (<a href="">#6367</a>)</li>
<li><a href=""><code>99766a5</code></a> Bump actions/cache from 5 to 6 (<a href="">#6366</a>)</li>
<li><a href=""><code>06c48d9</code></a> Bump actions/checkout from 6 to 7 (<a href="">#6364</a>)</li>
<li><a href=""><code>2cd5de6</code></a> [FIX] fix broken links (<a href="">#6361</a>)</li>
<li><a href=""><code>abce260</code></a> [BOT] update AUTHORS.rst and doc/changes/names.rst (<a href="">#6363</a>)</li>
<li><a href=""><code>16229cd</code></a> [DOC] added jupyterlite option in the documentation (<a href="">#6033</a>)</li>
<li><a href=""><code>dd21c04</code></a> [MAINT] skip sklearn 1.9.0 to avoid sluggish HTML repr of estimators with man...</li>
<li>Additional commits viewable in <a href="https://github.com/nilearn/nilearn/compare/0.12.1...0.14.0">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `1e85872545bd`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.