# Issue

**Title:** chore(deps): Bump sigstore from 4.1.0 to 4.1.1

## Description

Bumps [sigstore](https://github.com/sigstore/sigstore-js) from 4.1.0 to 4.1.1.
<details>
<summary>Release notes</summary>
<p><em>Sourced from <a href="https://github.com/sigstore/sigstore-js/releases">sigstore's releases</a>.</em></p>
<blockquote>
<h2>sigstore@4.1.1</h2>
<h3>Patch Changes</h3>
<ul>
<li>7845532: Verification of OID certificate extensions</li>
<li>f074710: Require inclusion promise in Rekor entry when used as timestamp source</li>
<li>Updated dependencies [b5aa4f1]</li>
<li>Updated dependencies [7845532]</li>
<li>Updated dependencies [f074710]
<ul>
<li><code>@​sigstore/core</code><a href="https://github.com/3"><code>@​3</code></a>.2.1</li>
<li><code>@​sigstore/verify</code><a href="https://github.com/3"><code>@​3</code></a>.1.1</li>
</ul>
</li>
</ul>
</blockquote>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>c1dc7d4</code></a> Version Packages (<a href="">#1607</a>)</li>
<li><a href=""><code>f074710</code></a> reject integratedTime w/o inclusionPromise (<a href="">#1659</a>)</li>
<li><a href=""><code>7845532</code></a> OID certificate extension verification (<a href="">#1658</a>)</li>
<li><a href=""><code>b5aa4f1</code></a> proper utf-8 encoding in DSSE PAE (<a href="">#1657</a>)</li>
<li><a href=""><code>c7a34e0</code></a> clarify cert ID matching (<a href="">#1656</a>)</li>
<li><a href=""><code>9858bd7</code></a> Upgrade TypeScript to 6.x (<a href="">#1655</a>)</li>
<li><a href=""><code>8cef20d</code></a> bump qs from 6.15.1 to 6.15.2 (<a href="">#1654</a>)</li>
<li><a href=""><code>aca341b</code></a> bump <code>@​sigstore/mock</code> deps (<a href="">#1653</a>)</li>
<li><a href=""><code>0855aca</code></a> Pin all <code>@​swc/core</code> platform binaries as optionalDependencies (<a href="">#1652</a>)</li>
<li><a href=""><code>44a374d</code></a> Pin all <code>@​swc/core</code> platform binaries as optionalDependencies (<a href="">#1650</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/sigstore/sigstore-js/compare/sigstore@4.1.0...sigstore@4.1.1">compare view</a></li>
</ul>
</details>
<br />

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `dba263bce498`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.