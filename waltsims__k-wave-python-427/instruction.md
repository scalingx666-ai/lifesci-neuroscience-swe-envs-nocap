# Issue

**Title:** Bump jaxtyping from 0.2.30 to 0.2.31

## Description

Bumps [jaxtyping](https://github.com/google/jaxtyping) from 0.2.30 to 0.2.31.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/google/jaxtyping/releases">jaxtyping's releases</a>.</em></p>
<blockquote>
<h2>jaxtyping v0.2.31</h2>
<ul>
<li>
<p>Now duck-type on array shapes and dtypes, so you can use <code>jaxtyping</code> for your custom arraylike objects:</p>
<pre lang="python"><code>class FooDtype(jaxtyping.AbstractDtype):
	dtypes = [&quot;foo&quot;]
<p>class MyArray:
<a href="https://github.com/property"><code>@​property</code></a>
def dtype(self):
return &quot;foo&quot;</p>
<pre><code>@property
def shape(self):
	return (3, 1, 4)
</code></pre>
<p>def f(x: FooDtype[MyArray, &quot;3 1 4&quot;]): ...
</code></pre></p>
</li>
<li>
<p>Improved compatibility when typeguard warns that you're typechecking a function without annotations: it will no longer mention the jaxtyping-internal <code>check_params</code> function and will instead mention the name of the function that is missing annotations.</p>
</li>
<li>
<p>Improved the error message when typechecking fails, to state the full <code>some_module.SomeClass.some_method</code> rather than just <code>some_method</code>.</p>
</li>
<li>
<p>Fixed a JAX deprecation warning for <code>jax.tree_map</code>. (Thanks <a href="https://github.com/groszewn"><code>@​groszewn</code></a>!)</p>
</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/groszewn"><code>@​groszewn</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#218</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patrick-kidger/jaxtyping/compare/v0.2.30...v0.2.31">https://github.com/patrick-kidger/jaxtyping/compare/v0.2.30...v0.2.31</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>b0bbff9</code></a> Added support for custom arrays.</li>
<li><a href=""><code>099b189</code></a> slightly better compatibility again</li>
<li><a href=""><code>4716fc1</code></a> typeguard warnings, on not having any annotations, now name the correct funct...</li>
<li><a href=""><code>40f494b</code></a> Now specifying module and qualname in error messages, for easier debugging.</li>
<li><a href=""><code>883c604</code></a> Added some __tracebackhide__s</li>
<li><a href=""><code>4428513</code></a> Update deprecate method usage</li>
<li>See full diff in <a href="https://github.com/google/jaxtyping/compare/v0.2.30...v0.2.31">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=jaxtyping&package-manager=pip&previous-version=0.2.30&new-version=0.2.31)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `90d6e5d06107`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.