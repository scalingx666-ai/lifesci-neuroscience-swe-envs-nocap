# Issue

**Title:** Bump joblib from 1.1.0 to 1.2.0

## Description

Bumps [joblib](https://github.com/joblib/joblib) from 1.1.0 to 1.2.0.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/joblib/joblib/blob/master/CHANGES.rst">joblib's changelog</a>.</em></p>
<blockquote>
<h2>Release 1.2.0</h2>
<ul>
<li>
<p>Fix a security issue where <code>eval(pre_dispatch)</code> could potentially run
arbitrary code. Now only basic numerics are supported.
<a href="https://github-redirect.dependabot.com/joblib/joblib/pull/1327">joblib/joblib#1327</a></p>
</li>
<li>
<p>Make sure that joblib works even when multiprocessing is not available,
for instance with Pyodide
<a href="https://github-redirect.dependabot.com/joblib/joblib/pull/1256">joblib/joblib#1256</a></p>
</li>
<li>
<p>Avoid unnecessary warnings when workers and main process delete
the temporary memmap folder contents concurrently.
<a href="https://github-redirect.dependabot.com/joblib/joblib/pull/1263">joblib/joblib#1263</a></p>
</li>
<li>
<p>Fix memory alignment bug for pickles containing numpy arrays.
This is especially important when loading the pickle with
<code>mmap_mode != None</code> as the resulting <code>numpy.memmap</code> object
would not be able to correct the misalignment without performing
a memory copy.
This bug would cause invalid computation and segmentation faults
with native code that would directly access the underlying data
buffer of a numpy array, for instance C/C++/Cython code compiled
with older GCC versions or some old OpenBLAS written in platform
specific assembly.
<a href="https://github-redirect.dependabot.com/joblib/joblib/pull/1254">joblib/joblib#1254</a></p>
</li>
<li>
<p>Vendor cloudpickle 2.2.0 which adds support for PyPy 3.8+.</p>
</li>
<li>
<p>Vendor loky 3.3.0 which fixes several bugs including:</p>
<ul>
<li>
<p>robustly forcibly terminating worker processes in case of a crash
(<a href="https://github-redirect.dependabot.com/joblib/joblib/pull/1269">joblib/joblib#1269</a>);</p>
</li>
<li>
<p>avoiding leaking worker processes in case of nested loky parallel
calls;</p>
</li>
<li>
<p>reliability spawn the correct number of reusable workers.</p>
</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>5991350</code></a> Release 1.2.0</li>
<li><a href=""><code>3fa2188</code></a> MAINT cleanup numpy warnings related to np.matrix in tests (<a href="https://github-redirect.dependabot.com/joblib/joblib/issues/1340">#1340</a>)</li>
<li><a href=""><code>cea26ff</code></a> CI test the future loky-3.3.0 branch (<a href="https://github-redirect.dependabot.com/joblib/joblib/issues/1338">#1338</a>)</li>
<li><a href=""><code>8aca6f4</code></a> MAINT: remove pytest.warns(None) warnings in pytest 7 (<a href="https://github-redirect.dependabot.com/joblib/joblib/issues/1264">#1264</a>)</li>
<li><a href=""><code>067ed4f</code></a> XFAIL test_child_raises_parent_exits_cleanly with multiprocessing (<a href="https://github-redirect.dependabot.com/joblib/joblib/issues/1339">#1339</a>)</li>
<li><a href=""><code>ac4ebd5</code></a> MAINT add back pytest warnings plugin (<a href="https://github-redirect.dependabot.com/joblib/joblib/issues/1337">#1337</a>)</li>
<li><a href=""><code>a23427d</code></a> Test child raises parent exits cleanly more reliable on macos (<a href="https://github-redirect.dependabot.com/joblib/joblib/issues/1335">#1335</a>)</li>
<li><a href=""><code>ac09691</code></a> [MAINT] various test updates (<a href="https://github-redirect.dependabot.com/joblib/joblib/issues/1334">#1334</a>)</li>
<li><a href=""><code>4a314b1</code></a> Vendor loky 3.2.0 (<a href="https://github-redirect.dependabot.com/joblib/joblib/issues/1333">#1333</a>)</li>
<li><a href=""><code>bdf47e9</code></a> Make test_parallel_with_interactively_defined_functions_default_backend timeo...</li>
<li>Additional commits viewable in <a href="https://github.com/joblib/joblib/compare/1.1.0...1.2.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=joblib&package-manager=pip&previous-version=1.1.0&new-version=1.2.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)
- `@dependabot use these labels` will set the current labels as the default for future PRs for this repo and language
- `@dependabot use these reviewers` will set the current reviewers as the default for future PRs for this repo and language
- `@dependabot use these assignees` will set the current assignees as the default for future PRs for this repo and language
- `@dependabot use this milestone` will set the current milestone as the default for future PRs for this repo and language

You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/BindsNET/bindsnet/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `a1b33579768c`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.