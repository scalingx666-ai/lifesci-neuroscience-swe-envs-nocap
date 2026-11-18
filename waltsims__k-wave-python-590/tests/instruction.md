# Issue

**Title:** Bump jaxtyping from 0.2.38 to 0.3.1

## Description

Bumps [jaxtyping](https://github.com/google/jaxtyping) from 0.2.38 to 0.3.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/google/jaxtyping/releases">jaxtyping's releases</a>.</em></p>
<blockquote>
<h2>jaxtyping v0.3.1</h2>
<ul>
<li>Minor bugfix: dataclass <code>__init__</code> methods are no longer double-wrapped in <code>jaxtyping.jaxtyped</code> when using the import hook. (<a href="">#313</a>)</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patrick-kidger/jaxtyping/compare/v0.3.0...v0.3.1">https://github.com/patrick-kidger/jaxtyping/compare/v0.3.0...v0.3.1</a></p>
<h2>jaxtyping v0.3.0</h2>
<p><strong>Features</strong></p>
<ul>
<li>Added support for MLX arrays. (Thanks <a href="https://github.com/gabrieldemarmiesse"><code>@​gabrieldemarmiesse</code></a>! <a href="">#299</a>)</li>
<li>Added support for int2 and uint2 datatypes (Thanks <a href="https://github.com/mattjj"><code>@​mattjj</code></a>! <a href="">#307</a>)</li>
</ul>
<p><strong>(Very mildly) breaking changes</strong></p>
<ul>
<li>Previously we arranged it such that jaxtyping annotations were a subclass of their array type, e.g. <code>Float[Array, &quot;foo&quot;]</code> was a subclass of <code>Array</code>. This ran into various issues with un-subclass-able types, metaclass conflicts, etc. Correspondingly this subclassing has been removed.</li>
<li><code>@jaxtyped</code>-decorated dataclasses now check the arguments to their <code>__init__</code> methods, rather than checking their attributes after initialisation. (This better handles some edge-cases with dataclass extensions where fields are allowed to have converters for their type.)</li>
</ul>
<p><strong>Misc</strong></p>
<ul>
<li>More efficient <code>@jaxtyped</code> decoration (Thanks <a href="https://github.com/hawkinsp"><code>@​hawkinsp</code></a>! <a href="">#311</a>)</li>
<li>Better pretty-printed representations for <code>PyTree</code>.</li>
<li>Prettier documentation :)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/mattjj"><code>@​mattjj</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#307</a></li>
<li><a href="https://github.com/hawkinsp"><code>@​hawkinsp</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#311</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patrick-kidger/jaxtyping/compare/v0.2.38...v0.3.0">https://github.com/patrick-kidger/jaxtyping/compare/v0.2.38...v0.3.0</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>edf2471</code></a> Fix pre-commit action</li>
<li><a href=""><code>5658933</code></a> dataclass <strong>init</strong> methods are no longer double-wrapped.</li>
<li><a href=""><code>f1634ef</code></a> Fix search</li>
<li><a href=""><code>a075d41</code></a> Bump to hippogriffe 0.2</li>
<li><a href=""><code>ddc8a8b</code></a> Fix doc building2</li>
<li><a href=""><code>97d75a1</code></a> Fix doc building</li>
<li><a href=""><code>85f1fe3</code></a> breaking (technically) version bump</li>
<li><a href=""><code>2b823bf</code></a> Removed partially-stringified test. Not sure how we lost support for this but...</li>
<li><a href=""><code>3c12543</code></a> Crash fixes when other libraries use jaxtyping in their docs</li>
<li><a href=""><code>d876b55</code></a> Tweak conditional import of JAX.</li>
<li>Additional commits viewable in <a href="https://github.com/google/jaxtyping/compare/v0.2.38...v0.3.1">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=jaxtyping&package-manager=pip&previous-version=0.2.38&new-version=0.3.1)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `fe030f30868f`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.