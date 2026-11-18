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

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `63118f67848b`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.