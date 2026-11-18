# Issue

**Title:** Bump jaxtyping from 0.2.34 to 0.2.36

## Description

Bumps [jaxtyping](https://github.com/google/jaxtyping) from 0.2.34 to 0.2.36.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/google/jaxtyping/releases">jaxtyping's releases</a>.</em></p>
<blockquote>
<h2>jaxtyping v0.2.36</h2>
<p>Fixed previous release that broke Python 3.9 compatibility! (Thanks <a href="https://github.com/baluyotraf"><code>@​baluyotraf</code></a>! <a href="">#269</a>, <a href="">#270</a>, <a href="">#271</a>)</p>
<p>See <a href="https://github.com/patrick-kidger/jaxtyping/releases/tag/v0.2.35">https://github.com/patrick-kidger/jaxtyping/releases/tag/v0.2.35</a> for the corresponding release notes.</p>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/baluyotraf"><code>@​baluyotraf</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#270</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patrick-kidger/jaxtyping/compare/v0.2.35...v0.2.36">https://github.com/patrick-kidger/jaxtyping/compare/v0.2.35...v0.2.36</a></p>
<h2>jaxtyping v0.2.35</h2>
<ul>
<li>
<p>Dropped dependency on <code>typeguard==2.13.3</code>. We now vendor our own copy of this. This means that <code>jaxtyping</code> now has zero dependencies. Note that more recent versions of typeguard do still seem to be a bit buggy in their handling of jaxtyping annotations, but we're now doing everything we can on this one :) (<a href="">#199</a>, <a href="">#266</a>)</p>
</li>
<li>
<p>jaxtyping no longer produces references cycles, which should improve performance in a edge cases, e.g. when decorating temporary local functions. (Thanks <a href="https://github.com/ojw28"><code>@​ojw28</code></a>! <a href="">#258</a>, <a href="">#259</a>, <a href="">#260</a>)</p>
</li>
<li>
<p>Improved compaibility with <code>cloudpickle</code>: this library has a minor bug that produced crashes in some edge cases used alongside jaxtyping -- we've now hopefully worked around such issues once and for all. (<a href="">#261</a>, <a href="">#262</a>)</p>
</li>
<li>
<p>Improved compatibility with <code>poetry</code>: this library has a bug in how it interpreters <code>~=</code> version constraints in a nonstandard manner. We now use <code>&gt;=</code> constraints instead. (Thanks <a href="https://github.com/norpadon"><code>@​norpadon</code></a>! <a href="">#257</a>)</p>
</li>
<li>
<p>Improved compatibility with <code>mypy</code>: now adding some extra typehints to help it infer the type of a jaxtyped-decorator function. (<a href="">#254</a>, <a href="">#255</a>)</p>
</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/norpadon"><code>@​norpadon</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#257</a></li>
<li><a href="https://github.com/ojw28"><code>@​ojw28</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#259</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patrick-kidger/jaxtyping/compare/v0.2.34...v0.2.35">https://github.com/patrick-kidger/jaxtyping/compare/v0.2.34...v0.2.35</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>4307e19</code></a> New release for 3.9 compatibility; now testing this as well</li>
<li><a href=""><code>7acd73e</code></a> Add typing_extensions to allow usage of ParamSpec in python &lt; 3.10</li>
<li><a href=""><code>c8c3edc</code></a> Update description to reflect that we're no longer a jax-only project.</li>
<li><a href=""><code>ec6f72e</code></a> Fix workflows</li>
<li><a href=""><code>dd24052</code></a> bump version</li>
<li><a href=""><code>d28a86c</code></a> Improve docs to mention all the variant arraylikes we now support</li>
<li><a href=""><code>8823419</code></a> ruff</li>
<li><a href=""><code>72becb4</code></a> Now vendoring typeguard v2.13.3</li>
<li><a href=""><code>a1a9480</code></a> Hopefully fixing deserialization issues once and for all.</li>
<li><a href=""><code>a831de6</code></a> Call typechecker from isolated frame (<a href="">#260</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/google/jaxtyping/compare/v0.2.34...v0.2.36">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=jaxtyping&package-manager=pip&previous-version=0.2.34&new-version=0.2.36)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `85be19928111`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.