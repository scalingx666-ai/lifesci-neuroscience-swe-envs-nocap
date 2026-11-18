# Issue

**Title:** chore(deps): Bump msgpack from 1.2.2 to 1.2.3 in /services/datalad

## Description

Bumps [msgpack](https://github.com/msgpack/msgpack-python) from 1.2.2 to 1.2.3.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/msgpack/msgpack-python/releases">msgpack's releases</a>.</em></p>
<blockquote>
<h2>v1.2.3</h2>
<h2>What's Changed</h2>
<ul>
<li>Fix memory leaks in the C extension when map key validation or container hooks fail.
See <a href="https://github.com/msgpack/msgpack-python/security/advisories/GHSA-j586-36cw-2gc2">GHSA-j586-36cw-2gc2</a>.</li>
<li>wheels: also build for pyodide using emscripten. by <a href="https://github.com/mr-c"><code>@​mr-c</code></a> in <a href="">msgpack/msgpack-python#732</a></li>
<li>Support packing Python 3.15 <code>frozentdict</code> (PEP 814) by <a href="https://github.com/edgarrmondragon"><code>@​edgarrmondragon</code></a> in <a href="">msgpack/msgpack-python#738</a></li>
<li>Reject negative array and map header sizes by <a href="https://github.com/jakezwang"><code>@​jakezwang</code></a> in <a href="">msgpack/msgpack-python#742</a></li>
<li>Bump the all-dependencies group across 1 directory with 2 updates by <a href="https://github.com/dependabot"><code>@​dependabot</code></a>[bot] in <a href="">msgpack/msgpack-python#741</a></li>
</ul>
<h2>New Contributors</h2>
<ul>
<li><a href="https://github.com/mr-c"><code>@​mr-c</code></a> made their first contribution in <a href="">msgpack/msgpack-python#732</a></li>
<li><a href="https://github.com/jakezwang"><code>@​jakezwang</code></a> made their first contribution in <a href="">msgpack/msgpack-python#742</a></li>
</ul>
<p><strong>Full Changelog</strong>: <a href="https://github.com/msgpack/msgpack-python/compare/v1.2.2...v1.2.3">https://github.com/msgpack/msgpack-python/compare/v1.2.2...v1.2.3</a></p>
</blockquote>
</details>
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/msgpack/msgpack-python/blob/main/CHANGELOG.md">msgpack's changelog</a>.</em></p>
<blockquote>
<h1>1.2.3</h1>
<p>Release Date: 2026-09-29</p>
<ul>
<li>Fix memory leaks in the C extension when map key validation or container hooks fail.
See <a href="https://github.com/msgpack/msgpack-python/security/advisories/GHSA-j586-36cw-2gc2">GHSA-j586-36cw-2gc2</a>.</li>
<li>Fix use-after-free errors when cleaning up an incomplete or failed <code>Unpacker.skip()</code>
after previously unpacking a nested object in the C extension.</li>
<li>Raise <code>ValueError</code> in the C extension when switching between unpacking, skipping,
header readers, or <code>read_bytes()</code> while an object is incomplete. Resume with the
same method after feeding more data; <code>unpack()</code> and iteration remain interchangeable.</li>
<li>Prevent reentrant unpacking, header reads, <code>read_bytes()</code>, and reinitialization
of the same C <code>Unpacker</code> while unpacking is in progress.</li>
<li>Reject negative sizes in <code>Packer.pack_array_header()</code> and <code>Packer.pack_map_header()</code>. <a href="">#742</a></li>
<li>Support packing Python 3.15 <code>frozendict</code> objects. <a href="">#738</a></li>
<li>Update Cython from 3.2.5 to 3.3.0. <a href="">#738</a></li>
<li>Build wheels for Pyodide using Emscripten. <a href="">#732</a></li>
<li>Update cibuildwheel to 4.2.1 and the QEMU setup action to 4.4.0. <a href="">#741</a></li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>742cb6d</code></a> release v1.2.3</li>
<li><a href=""><code>620b0eb</code></a> Merge commit from fork</li>
<li><a href=""><code>475c1b7</code></a> Bump the all-dependencies group across 1 directory with 2 updates (<a href="">#741</a>)</li>
<li><a href=""><code>0014ca9</code></a> Reject negative array and map header sizes (<a href="">#742</a>)</li>
<li><a href=""><code>7a63920</code></a> Support packing Python 3.15 <code>frozentdict</code> (PEP 814) (<a href="">#738</a>)</li>
<li><a href=""><code>9f4909c</code></a> wheels: also build for pyodide using emscripten. (<a href="">#732</a>)</li>
<li>See full diff in <a href="https://github.com/msgpack/msgpack-python/compare/v1.2.2...v1.2.3">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=msgpack&package-manager=uv&previous-version=1.2.2&new-version=1.2.3)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/OpenNeuroOrg/openneuro/network/alerts).

</details>

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `0b6f58c26682`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.