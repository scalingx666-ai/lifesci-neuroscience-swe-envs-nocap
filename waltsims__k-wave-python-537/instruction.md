# Issue

**Title:** Bump scipy from 1.14.1 to 1.15.0

## Description

Bumps [scipy](https://github.com/scipy/scipy) from 1.14.1 to 1.15.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/scipy/scipy/releases">scipy's releases</a>.</em></p>
<blockquote>
<h1>SciPy 1.15.0 Release Notes</h1>
<p>SciPy <code>1.15.0</code> is the culmination of <code>6</code> months of hard work. It contains
many new features, numerous bug-fixes, improved test coverage and better
documentation. There have been a number of deprecations and API changes
in this release, which are documented below. All users are encouraged to
upgrade to this release, as there are a large number of bug-fixes and
optimizations. Before upgrading, we recommend that users check that
their own code does not use deprecated SciPy functionality (to do so,
run your code with <code>python -Wd</code> and check for <code>DeprecationWarning</code> s).
Our development attention will now shift to bug-fix releases on the
1.15.x branch, and on adding new features on the main branch.</p>
<p>This release requires Python <code>3.10-3.13</code> and NumPy <code>1.23.5</code> or greater.</p>
<h1>Highlights of this release</h1>
<ul>
<li>
<p>Sparse arrays are now fully functional for 1-D and 2-D arrays. We recommend
that all new code use sparse arrays instead of sparse matrices and that
developers start to migrate their existing code from sparse matrix to sparse
array: <a href="https://scipy.github.io/devdocs/reference/sparse.migration_to_sparray.html"><code>migration_to_sparray</code></a>. Both <code>sparse.linalg</code> and <code>sparse.csgraph</code>
work with either sparse matrix or sparse array and work internally with
sparse array.</p>
</li>
<li>
<p>Sparse arrays now provide basic support for n-D arrays in the COO format
including <code>add</code>, <code>subtract</code>, <code>reshape</code>, <code>transpose</code>, <code>matmul</code>,
<code>dot</code>, <code>tensordot</code> and others. More functionality is coming in future
releases.</p>
</li>
<li>
<p>Preliminary support for free-threaded Python 3.13.</p>
</li>
<li>
<p>New probability distribution features in <code>scipy.stats</code> can be used to improve
the speed and accuracy of existing continuous distributions and perform new
probability calculations.</p>
</li>
<li>
<p>Several new features support vectorized calculations with Python Array API
Standard compatible input (see &quot;Array API Standard Support&quot; below):</p>
<ul>
<li><code>scipy.differentiate</code> is a new top-level submodule for accurate
estimation of derivatives of black box functions.</li>
<li><code>scipy.optimize.elementwise</code> contains new functions for root-finding and
minimization of univariate functions.</li>
<li><code>scipy.integrate</code> offers new functions <code>cubature</code>, <code>tanhsinh</code>, and
<code>nsum</code> for multivariate integration, univariate integration, and
univariate series summation, respectively.</li>
</ul>
</li>
<li>
<p><code>scipy.interpolate.AAA</code> adds the AAA algorithm for barycentric rational
approximation of real or complex functions.</p>
</li>
<li>
<p><code>scipy.special</code> adds new functions offering improved Legendre function
implementations with a more consistent interface.</p>
</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>6e246d0</code></a> REL: 1.15.0 &quot;final&quot; rel commit [wheel build]</li>
<li><a href=""><code>ed7c850</code></a> Merge pull request <a href="">#22233</a> from tylerjereddy/treddy_backports_1.15.0_final</li>
<li><a href=""><code>2e2f2cd</code></a> MAINT: PR 22233 wheel build [wheel build]</li>
<li><a href=""><code>f05c622</code></a> DOC: Update 1.15.0 relnotes</li>
<li><a href=""><code>7348d92</code></a> Update scipy/differentiate/_differentiate.py</li>
<li><a href=""><code>56b1f7e</code></a> DOC: differentiate.jacobian: correct/improve documentation about callable int...</li>
<li><a href=""><code>30077e7</code></a> DEP: linalg.solve_toeplitz/matmul_toeplitz: warn on n-D <code>c</code>, <code>r</code> (<a href="">#22193</a>)</li>
<li><a href=""><code>256c1a2</code></a> Merge pull request <a href="">#22181</a> from tylerjereddy/treddy_prep_scipy_1.15.0rc3</li>
<li><a href=""><code>f046276</code></a> REL: set 1.15.0rc3 unreleased</li>
<li><a href=""><code>a3d40a8</code></a> REL: 1.15.0rc2 rel commit [wheel build]</li>
<li>Additional commits viewable in <a href="https://github.com/scipy/scipy/compare/v1.14.1...v1.15.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=scipy&package-manager=pip&previous-version=1.14.1&new-version=1.15.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4874253d6bae`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.