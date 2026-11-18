# Issue

**Title:** Bump nilearn from 0.14.0 to 0.14.1

## Description

Bumps [nilearn](https://github.com/nilearn/nilearn) from 0.14.0 to 0.14.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/nilearn/nilearn/releases">nilearn's releases</a>.</em></p>
<blockquote>
<h2>0.14.1</h2>
<h2>What's Changed</h2>
<ul>
<li>[MAINT] post-release by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6373</a></li>
<li>[DOC] minimal example for iter_img function by <a href="https://github.com/RDoerfel"><code>@​RDoerfel</code></a> in <a href="">nilearn/nilearn#6304</a></li>
<li>[DOC] update plot_decoding_tutorial.py by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6336</a></li>
<li>[DOC] add example to &quot;all_functions&quot; by <a href="https://github.com/aliswh"><code>@​aliswh</code></a> in <a href="">nilearn/nilearn#6322</a></li>
<li>[BOT] update AUTHORS.rst and doc/changes/names.rst by <a href="https://github.com/github-actions"><code>@​github-actions</code></a>[bot] in <a href="">nilearn/nilearn#6378</a></li>
<li>[MAINT] Add return type annotations to connectome and reporting functions by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6368</a></li>
<li>[MAINT] Add return type annotations to public functions in nilearn.regions by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6369</a></li>
<li>[ENH] add example to compute_epi_mask by <a href="https://github.com/marco7877"><code>@​marco7877</code></a> in <a href="">nilearn/nilearn#6314</a></li>
<li>[MAINT] add doc strings to several tests by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6372</a></li>
<li>[DOC] Add example to img_to_signals_labels by <a href="https://github.com/hndgzkn"><code>@​hndgzkn</code></a> in <a href="">nilearn/nilearn#6315</a></li>
<li>[DOC] add example to docstring for check_design_matrix by <a href="https://github.com/RDoerfel"><code>@​RDoerfel</code></a> in <a href="">nilearn/nilearn#6329</a></li>
<li>[MAINT] add type annotations to nilearn.datasets by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6379</a></li>
<li>[DOC] only run doctests when plotting dependencies are installed by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6383</a></li>
<li>[DOC] no jupyterlite in examples by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6384</a></li>
<li>[FIX] Fix return value for <code>fetch_openneuro_dataset</code> by <a href="https://github.com/hndgzkn"><code>@​hndgzkn</code></a> in <a href="">nilearn/nilearn#6389</a></li>
<li>chore: update pre-commit hooks by <a href="https://github.com/pre-commit-ci"><code>@​pre-commit-ci</code></a>[bot] in <a href="">nilearn/nilearn#6392</a></li>
<li>[MAINT] test free threaded python on main only by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6396</a></li>
<li>[MAINT] narrow events that trigger circleci-artifacts-redirector by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6404</a></li>
<li>[MAINT] group dependabot PR and autoupdate JS dependencies by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6403</a></li>
<li>[MAINT] use absolute import by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6399</a></li>
<li>[DOC] Add example to <code>butterworth</code> by <a href="https://github.com/hndgzkn"><code>@​hndgzkn</code></a> in <a href="">nilearn/nilearn#6311</a></li>
<li>[MAINT] Add return type annotations to interfaces functions by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6362</a></li>
<li>[MAINT] remove slow marker for tests that are not slow anymore by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6401</a></li>
<li>[MNT] Add type annotations to nilearn.plotting by <a href="https://github.com/hndgzkn"><code>@​hndgzkn</code></a> in <a href="">nilearn/nilearn#6272</a></li>
<li>[MAINT] add reference image for view_surf with niivue engine by <a href="https://github.com/hndgzkn"><code>@​hndgzkn</code></a> in <a href="">nilearn/nilearn#6359</a></li>
<li>[FIX] Rollback jlite configuration for Py3.10 by <a href="https://github.com/emdupre"><code>@​emdupre</code></a> in <a href="">nilearn/nilearn#6391</a></li>
<li>[DOC] add examples section to plot_design_matrix by <a href="https://github.com/nirmitee-mulay"><code>@​nirmitee-mulay</code></a> in <a href="">nilearn/nilearn#6380</a></li>
<li>[MAINT] Add return type annotations to public functions in nilearn.glm by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6370</a></li>
<li>[FIX] Fix color map for view_surf when <code>engine=niivue</code> by <a href="https://github.com/hndgzkn"><code>@​hndgzkn</code></a> in <a href="">nilearn/nilearn#6402</a></li>
<li>[MAINT] Add return type annotations to nilearn.utils.discovery by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6409</a></li>
<li>[MAINT] add return type annotations to all pytest fixtures by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6412</a></li>
<li>[DOC] update plot_haxby_masks example by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6339</a></li>
<li>[MAINT] add type annotations to nilearn.datasets atlas functions by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6387</a></li>
<li>[MAINT] Add return type annotations to nilearn.image.resampling by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6408</a></li>
<li>Bump the npm group with 8 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">nilearn/nilearn#6405</a></li>
<li>[DOC] update carpet plot example by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6337</a></li>
<li>[DOC] Update <code>plot_smooth_mean_image.py</code> example by <a href="https://github.com/michellewang"><code>@​michellewang</code></a> in <a href="">nilearn/nilearn#6415</a></li>
<li>[DOC] Update <code>plot_nifti_simple.py</code> example by <a href="https://github.com/michellewang"><code>@​michellewang</code></a> in <a href="">nilearn/nilearn#6414</a></li>
<li>[DOC] Update <code>plot_mask_computation.py</code> example by <a href="https://github.com/michellewang"><code>@​michellewang</code></a> in <a href="">nilearn/nilearn#6381</a></li>
<li>[MAINT] Add return type annotations to conftest.py fixtures and estimator_checks.py check functions by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6417</a></li>
<li>[MAINT] clean up D103 per-file-ignores in pyproject.toml by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6406</a></li>
<li>[MAINT] Add return type annotations to nilearn.surface classes by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6410</a></li>
<li>[DOC] Document and verify asv benchmark workflow, add local-import benchmark example by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6422</a></li>
<li>[MAINT] remove slow masker from several tests by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6421</a></li>
<li>[MAINT] Add type annotations to nilearn._utils.data_gen by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6420</a></li>
<li>[MAINT] further annotate plotting functions by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6416</a></li>
<li>[FIX] Only save the monthly doc-build dataset cache once per month by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6425</a></li>
<li>[FIX] test_html.yml never actually used its restored dataset cache by <a href="https://github.com/Remi-Gau"><code>@​Remi-Gau</code></a> in <a href="">nilearn/nilearn#6427</a></li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6c81c34</code></a> [REL] 0.14.1 (<a href="">#6540</a>)</li>
<li><a href=""><code>c71b0a0</code></a> [REF] remove duplicate tests (<a href="">#6555</a>)</li>
<li><a href=""><code>fed66db</code></a> [REF] refactor duplicate test nifti maps maskers (<a href="">#6556</a>)</li>
<li><a href=""><code>cb8e572</code></a> [REF] rename tests maskers (<a href="">#6232</a>)</li>
<li><a href=""><code>f00263a</code></a> [MAINT] mark a test to not be run in parallel (<a href="">#6544</a>)</li>
<li><a href=""><code>e9d198a</code></a> [DOC] Update plot_localizer_simple (<a href="">#6521</a>)</li>
<li><a href=""><code>708cdea</code></a> [ENH] Restructure directories for generated html test files (<a href="">#6541</a>)</li>
<li><a href=""><code>3a799b5</code></a> [FIX] Fix masker verbosity (<a href="">#6423</a>)</li>
<li><a href=""><code>bcf7fd8</code></a> [MAINT] Simplify the return value of _sanitize_inputs_plot_matrix (<a href="">#6522</a>)</li>
<li><a href=""><code>14bb1a9</code></a> [REF] remove extra loading of jinja figure partial (<a href="">#6536</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/nilearn/nilearn/compare/0.14.0...0.14.1">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `34749f5abc25`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.