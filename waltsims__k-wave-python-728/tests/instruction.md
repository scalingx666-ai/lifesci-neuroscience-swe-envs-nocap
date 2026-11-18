# Issue

**Title:** Bump requests from 2.33.1 to 2.34.0

## Description

Bumps [requests](https://github.com/psf/requests) from 2.33.1 to 2.34.0.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/releases">requests's releases</a>.</em></p>
<blockquote>
<h2>v2.34.0</h2>
<h2>2.34.0 (2026-05-11)</h2>
<p><strong>Announcements</strong></p>
<ul>
<li>
<p>Requests 2.34.0 introduces inline types, replacing those provided by
typeshed. Public API types should be fully compatible with mypy, pyright,
and ty. <strong>We believe types are comprehensive but if you find issues, please
report them to the <a href="">pinned tracking issue</a>.</strong></p>
<p>Special thanks to <a href="https://github.com/bastimeyer"><code>@​bastimeyer</code></a>, <a href="https://github.com/cthoyt"><code>@​cthoyt</code></a>, <a href="https://github.com/edgarrmondragon"><code>@​edgarrmondragon</code></a>, and <a href="https://github.com/srittau"><code>@​srittau</code></a> for
helping review and test the types ahead of the release. (<a href="">#7272</a>)</p>
</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li>Digest Auth hashing algorithms have added <code>usedforsecurity=False</code> to clarify
security considerations. (<a href="">#7310</a>)</li>
<li>Requests added support for Python 3.15 based on beta1. Downstream projects
should be able to start testing prior to its release in October. (<a href="">#7422</a>)</li>
<li>Requests added support for Python 3.14t. (<a href="">#7419</a>)</li>
</ul>
<p><strong>Bugfixes</strong></p>
<ul>
<li><code>Response.history</code> no longer contains a reference to itself, preventing
accidental looping when traversing the history list. (<a href="">#7328</a>)</li>
<li>Requests no longer performs greedy matching on no_proxy domains. The
proxy_bypass implementation has been updated with CPython's fix from
bpo-39057. (<a href="">#7427</a>)</li>
<li>Requests no longer incorrectly strips duplicate leading slashes in
URI paths. This should address user issues with specific presigned
URLs. Note the full fix requires urllib3 2.7.0+. (<a href="">#7315</a>)</li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/cjriches"><code>@​cjriches</code></a> made their first contribution in <a href="">psf/requests#7365</a></li>
<li><a href="https://github.com/dsanader"><code>@​dsanader</code></a> made their first contribution in <a href="">psf/requests#7376</a></li>
<li><a href="https://github.com/DimitriPapadopoulos"><code>@​DimitriPapadopoulos</code></a> made their first contribution in <a href="">psf/requests#7393</a></li>
<li><a href="https://github.com/joshua-51"><code>@​joshua-51</code></a> made their first contribution in <a href="">psf/requests#7416</a></li>
<li><a href="https://github.com/eggsort"><code>@​eggsort</code></a> made their first contribution in <a href="">psf/requests#7421</a></li>
<li><a href="https://github.com/typhon8"><code>@​typhon8</code></a> made their first contribution in <a href="">psf/requests#7315</a></li>
<li><a href="https://github.com/bastimeyer"><code>@​bastimeyer</code></a> made their first contribution in <a href="">psf/requests#7425</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/psf/requests/blob/main/HISTORY.md#2340-2026-05-11">https://github.com/psf/requests/blob/main/HISTORY.md#2340-2026-05-11</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/psf/requests/blob/main/HISTORY.md">requests's changelog</a>.</em></p>
<blockquote>
<h2>2.34.0 (2026-05-11)</h2>
<p><strong>Announcements</strong></p>
<ul>
<li>
<p>Requests 2.34.0 introduces inline types, replacing those provided by
typeshed. Public API types should be fully compatible with mypy, pyright,
and ty. We believe types are comprehensive but if you find issues, please
report them to the pinned tracking issue.</p>
<p>Special thanks to <a href="https://github.com/bastimeyer"><code>@​bastimeyer</code></a>, <a href="https://github.com/cthoyt"><code>@​cthoyt</code></a>, <a href="https://github.com/edgarrmondragon"><code>@​edgarrmondragon</code></a>, and <a href="https://github.com/srittau"><code>@​srittau</code></a> for
helping review and test the types ahead of the release. (<a href="">#7272</a>)</p>
</li>
</ul>
<p><strong>Improvements</strong></p>
<ul>
<li>Digest Auth hashing algorithms have added <code>usedforsecurity=False</code> to clarify
security considerations. (<a href="">#7310</a>)</li>
<li>Requests added support for Python 3.15 based on beta1. Downstream projects
should be able to start testing prior to its release in October. (<a href="">#7422</a>)</li>
<li>Requests added support for Python 3.14t. (<a href="">#7419</a>)</li>
</ul>
<p><strong>Bugfixes</strong></p>
<ul>
<li><code>Response.history</code> no longer contains a reference to itself, preventing
accidental looping when traversing the history list. (<a href="">#7328</a>)</li>
<li>Requests no longer performs greedy matching on no_proxy domains. The
proxy_bypass implementation has been updated with CPython's fix from
bpo-39057. (<a href="">#7427</a>)</li>
<li>Requests no longer incorrectly strips duplicate leading slashes in
URI paths. This should address user issues with specific presigned
URLs. Note the full fix requires urllib3 2.7.0+. (<a href="">#7315</a>)</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>0b401c7</code></a> v2.34.0</li>
<li><a href=""><code>86b378d</code></a> Align Session.get parameters with requests.get (<a href="">#7429</a>)</li>
<li><a href=""><code>a4f9a59</code></a> Port bpo-39057 to Requests (<a href="">#7427</a>)</li>
<li><a href=""><code>3816cfa</code></a> Parameterize SupportsItems to handle Mapping key invariance (<a href="">#7426</a>)</li>
<li><a href=""><code>b684dcb</code></a> sessions: fix hooks type (<a href="">#7425</a>)</li>
<li><a href=""><code>dc9dbdf</code></a> Formalize 3.15 support (<a href="">#7422</a>)</li>
<li><a href=""><code>25340eb</code></a> Clear proxy env vars before every test run (<a href="">#7423</a>)</li>
<li><a href=""><code>fd62809</code></a> Preserve leading slashes in request path_url (<a href="">#7315</a>)</li>
<li><a href=""><code>e8d2c01</code></a> docs: Fix missing hook output in docs example (<a href="">#7421</a>)</li>
<li><a href=""><code>eb173bc</code></a> Add 3.14t support to CI (<a href="">#7419</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/psf/requests/compare/v2.33.1...v2.34.0">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=requests&package-manager=pip&previous-version=2.33.1&new-version=2.34.0)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
- `@dependabot show <dependency name> ignore conditions` will show all of the ignore conditions of the specified dependency
- `@dependabot ignore this major version` will close this PR and stop Dependabot creating any more for this major version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this minor version` will close this PR and stop Dependabot creating any more for this minor version (unless you reopen the PR or upgrade to it yourself)
- `@dependabot ignore this dependency` will close this PR and stop Dependabot creating any more for this dependency (unless you reopen the PR or upgrade to it yourself)

</details>

<!-- greptile_comment -->

<h3>Greptile Summary</h3>

This PR bumps `requests` from 2.33.1 to 2.34.0 exclusively in the `test` optional-dependency group of `pyproject.toml`; the library is not part of the package's published runtime dependencies.

- The new release includes bugfixes (self-referential `Response.history`, greedy `no_proxy` matching, duplicate leading slashes in URI paths), inline type annotations, and Python 3.14t/3.15 support — all backwards-compatible changes with no impact on k-wave-python's own API surface.
- Because `requests` is pinned with `==` and used only in the test extras, this change has no effect on end-users of the package.

<h3>Confidence Score: 5/5</h3>

Safe to merge — single-line bump of a test-only dependency with no effect on the published package.

The change touches only the test extra group; `requests` is not listed in the runtime `dependencies` array, so no end-user is affected. The 2.34.0 release is a backwards-compatible minor bump with bugfixes and new inline types.

No files require special attention.

<details><summary><h3>Important Files Changed</h3></summary>

| Filename | Overview |
|----------|----------|
| pyproject.toml | Bumps `requests` from 2.33.1 to 2.34.0 in the test optional-dependencies group only; core package dependencies are unaffected. |

</details>

</details>

<sub>Reviews (1): Last reviewed commit:  | [Re-trigger Greptile](https://app.greptile.com/api/retrigger?id=31712203)</sub>

<!-- /greptile_comment -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `4b110afbd400`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.