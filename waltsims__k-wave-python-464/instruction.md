# Issue

**Title:** Bump jaxtyping from 0.2.31 to 0.2.34

## Description

Bumps [jaxtyping](https://github.com/google/jaxtyping) from 0.2.31 to 0.2.34.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/google/jaxtyping/releases">jaxtyping's releases</a>.</em></p>
<blockquote>
<h2>jaxtyping v0.2.34</h2>
<ul>
<li>Compatibility with <code>ray</code> -- this fixes crashes with the error message <code>has no attribute 'index_variadic'</code> (<a href="">#198</a>, <a href="">#237</a>)</li>
<li>Compatibility with Python 3.12: fixed deprecation warnings about <code>ast.Str</code>. (<a href="">#236</a>, thanks <a href="https://github.com/phinate"><code>@​phinate</code></a>!)</li>
<li>Error message improvements + doc improvements (<a href="">#233</a>, <a href="">#240</a>, thanks <a href="https://github.com/padix-key"><code>@​padix-key</code></a> and <a href="https://github.com/jjyyxx"><code>@​jjyyxx</code></a>!)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/padix-key"><code>@​padix-key</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#233</a></li>
<li><a href="https://github.com/phinate"><code>@​phinate</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#236</a></li>
<li><a href="https://github.com/jjyyxx"><code>@​jjyyxx</code></a> made their first contribution in <a href="">patrick-kidger/jaxtyping#240</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patrick-kidger/jaxtyping/compare/v0.2.33...v0.2.34">https://github.com/patrick-kidger/jaxtyping/compare/v0.2.33...v0.2.34</a></p>
<h2>jaxtyping v0.2.33</h2>
<ul>
<li>Compatibility with Python 3.10 when using <code>Any</code> as the array type.</li>
<li>Compatibility with generic array types.</li>
<li>Array typevars now respect <code>__constraints__</code></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patrick-kidger/jaxtyping/compare/v0.2.32...v0.2.33">https://github.com/patrick-kidger/jaxtyping/compare/v0.2.32...v0.2.33</a></p>
<h2>jaxtyping v0.2.32</h2>
<ul>
<li>
<p>The array type can now be either <code>Any</code> or a <code>TypeVar</code>. In both cases this means that anything is allowed at runtime. As usual, static type checkers will only look at the array part of an annotation, so that an annotation of the form <code>Float[T, &quot;foo bar&quot;]</code> (where <code>T = TypeVar(&quot;T&quot;)</code>) will be treated as just <code>T</code> by static type checkers. This allows for expressing array-type-polymorphism with static typechecking. Here's an example:</p>
<pre lang="python"><code>import numpy as np
import torch
from typing import TypeVar
<p>TensorLike = TypeVar(&quot;TensorLike&quot;, np.ndarray, torch.Tensor)</p>
<p>def stack_scalars(x: Float[TensorLike, &quot;&quot;], y: Float[TensorLike, &quot;&quot;]) -&gt; Float[TensorLike, &quot;2&quot;]:
if isinstance(x, np.ndarray) and isinstance(y, np.ndarray):
return np.stack([x, y])
elif isinstance(x, torch.Tensor) and isinstance(y, torch.Tensor):
return torch.stack([x, y])
else:
raise ValueError(&quot;Invalid array types!&quot;)
</code></pre></p>
</li>
<li>
<p>Fixed a bug in which the very first argument to a function was erroneously reported as the one at fault for a typechecking error. This bug occurred when using default arguments.</p>
</li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/patrick-kidger/jaxtyping/compare/v0.2.31...v0.2.32">https://github.com/patrick-kidger/jaxtyping/compare/v0.2.31...v0.2.32</a></p>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>f4ca4c9</code></a> version bump</li>
<li><a href=""><code>ec71bf0</code></a> Fix broken link</li>
<li><a href=""><code>b3a13eb</code></a> Remove polyfill</li>
<li><a href=""><code>09235dd</code></a> Remove redundant colon in <code>install_import_hook</code> docstring</li>
<li><a href=""><code>f9e44cf</code></a> Compatibility with ray.</li>
<li><a href=""><code>317cc9e</code></a> update CONTRIBUTING.md</li>
<li><a href=""><code>2ae053b</code></a> replace ast.Str with ast.Constant to avoid deprecation warnings in python 3.12</li>
<li><a href=""><code>b877cf8</code></a> Fix misleading error message</li>
<li><a href=""><code>c2f19db</code></a> Compatibility with Python 3.10 + with generic array types</li>
<li><a href=""><code>f7c57c3</code></a> Version bump</li>
<li>Additional commits viewable in <a href="https://github.com/google/jaxtyping/compare/v0.2.31...v0.2.34">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=jaxtyping&package-manager=pip&previous-version=0.2.31&new-version=0.2.34)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `f2dfa2827844`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.