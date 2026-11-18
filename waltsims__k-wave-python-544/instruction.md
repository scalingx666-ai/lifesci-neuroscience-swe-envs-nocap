# Issue

**Title:** Bump jaxtyping from 0.2.36 to 0.2.37

## Description

Bumps [jaxtyping](https://github.com/google/jaxtyping) from 0.2.36 to 0.2.37.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/google/jaxtyping/releases">jaxtyping's releases</a>.</em></p>
<blockquote>
<h2>jaxtyping v0.2.37</h2>
<p>New features:</p>
<ul>
<li>
<p>Added fp8 dtypes (Thanks <a href="https://github.com/liudangyi"><code>@​liudangyi</code></a>! <a href="">#251</a>):</p>
<ul>
<li><code>jaxtyping.Float8e4m3b11fnuz</code></li>
<li><code>jaxtyping.Float8e4m3fn</code></li>
<li><code>jaxtyping.Float8e4m3fnuz</code></li>
<li><code>jaxtyping.Float8e5m2</code></li>
<li><code>jaxtyping.Float8e5m2fnuz</code></li>
</ul>
</li>
<li>
<p>Static type-checking compatibility when decorating dataclasses with <code>@jaxtyped</code> (Thanks <a href="https://github.com/z4m0"><code>@​z4m0</code></a>! <a href="">#275</a>, <a href="">#278</a>, <a href="">#282</a>)</p>
</li>
<li>
<p>Now pretty-printing error messages using the <a href="https://github.com/patrick-kidger/wadler_lindig"><code>wadler_lindig</code></a> library. In particular this means that PyTorch tensors etc. won't be printed out in their entirety, and will be summarised into just their shape and dtype. (<a href="">#194</a>, <a href="">#284</a>, <a href="">#286</a>)</p>
</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/liudangyi"><code>@​liudangyi</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#251</a></li>
<li><a href="https://github.com/z4m0"><code>@​z4m0</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#283</a></li>
<li><a href="https://github.com/danielward27"><code>@​danielward27</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#287</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patrick-kidger/jaxtyping/compare/v0.2.36...v0.2.37">https://github.com/patrick-kidger/jaxtyping/compare/v0.2.36...v0.2.37</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>bd84aed</code></a> v0.2.37 release</li>
<li><a href=""><code>aa9bf9a</code></a> Add paramax</li>
<li><a href=""><code>7d25a6b</code></a> Pre-commit hooks for pyright and mypy (only API tests) (<a href="">#283</a>)</li>
<li><a href=""><code>c39abe7</code></a> Now using wadler_lindig pprint library.</li>
<li><a href=""><code>9f5a3fa</code></a> Bump release pipeline</li>
<li><a href=""><code>2d311b5</code></a> Now statically working with dataclasses correctly.</li>
<li><a href=""><code>b2f16e8</code></a> Mark typechecking frame as hidden.</li>
<li><a href=""><code>43059ff</code></a> Now robust to errors in pretty-printing. This can occur when using the defaul...</li>
<li><a href=""><code>51345dd</code></a> Add fp8 types exposed in jax.numpy.</li>
<li>See full diff in <a href="https://github.com/google/jaxtyping/compare/v0.2.36...v0.2.37">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=jaxtyping&package-manager=pip&previous-version=0.2.36&new-version=0.2.37)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `36b7e9affd04`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.