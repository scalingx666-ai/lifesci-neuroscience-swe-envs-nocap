# Issue

**Title:** Bump cryptography from 45.0.7 to 46.0.5

## Description

Bumps [cryptography](https://github.com/pyca/cryptography) from 45.0.7 to 46.0.5.
<details>
<summary>Changelog</summary>
<p><em>Sourced from <a href="https://github.com/pyca/cryptography/blob/main/CHANGELOG.rst">cryptography's changelog</a>.</em></p>
<blockquote>
<p>46.0.5 - 2026-02-10</p>
<pre><code>
* An attacker could create a malicious public key that reveals portions of your
  private key when using certain uncommon elliptic curves (binary curves).
  This version now includes additional security checks to prevent this attack.
  This issue only affects binary elliptic curves, which are rarely used in
  real-world applications. Credit to **XlabAI Team of Tencent Xuanwu Lab and
  Atuin Automated Vulnerability Discovery Engine** for reporting the issue.
  **CVE-2026-26007**
* Support for ``SECT*`` binary elliptic curves is deprecated and will be
  removed in the next release.
<p>.. v46-0-4:</p>
<p>46.0.4 - 2026-01-27<br />
</code></pre></p>
<ul>
<li><code>Dropped support for win_arm64 wheels</code>_.</li>
<li>Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.5.5.</li>
</ul>
<p>.. _v46-0-3:</p>
<p>46.0.3 - 2025-10-15</p>
<pre><code>
* Fixed compilation when using LibreSSL 4.2.0.
<p>.. _v46-0-2:</p>
<p>46.0.2 - 2025-09-30<br />
</code></pre></p>
<ul>
<li>Updated Windows, macOS, and Linux wheels to be compiled with OpenSSL 3.5.4.</li>
</ul>
<p>.. _v46-0-1:</p>
<p>46.0.1 - 2025-09-16</p>
<pre><code>
* Fixed an issue where users installing via ``pip`` on Python 3.14 development
  versions would not properly install a dependency.
* Fixed an issue building the free-threaded macOS 3.14 wheels.
<p>.. _v46-0-0:</p>
<p>46.0.0 - 2025-09-16<br />
</code></pre></p>
<ul>
<li><strong>BACKWARDS INCOMPATIBLE:</strong> Support for Python 3.7 has been removed.</li>
</ul>
<!-- raw HTML omitted -->
</blockquote>
<p>... (truncated)</p>
</details>
<details>
<summary>Commits</summary>
<ul>
<li><a href=""><code>06e120e</code></a> bump version for 46.0.5 release (<a href="">#14289</a>)</li>
<li><a href=""><code>0eebb9d</code></a> EC check key on cofactor &gt; 1 (<a href="">#14287</a>)</li>
<li><a href=""><code>bedf6e1</code></a> fix openssl version on 46 branch (<a href="">#14220</a>)</li>
<li><a href=""><code>e6f44fc</code></a> bump for 46.0.4 and drop win arm64 due to CI issues (<a href="">#14217</a>)</li>
<li><a href=""><code>c0af4dd</code></a> release 46.0.3 (<a href="">#13681</a>)</li>
<li><a href=""><code>99efe5a</code></a> bump version for 46.0.2 (<a href="">#13531</a>)</li>
<li><a href=""><code>e735cfc</code></a> release 46.0.1 (<a href="">#13450</a>)</li>
<li><a href=""><code>4e457ff</code></a> Explicitly specify python in mac uv build invocation (<a href="">#13447</a>)</li>
<li><a href=""><code>2726efd</code></a> Depend on CFFI 2.0.0 or newer on Python &gt; 3.8 (<a href="">#13448</a>)</li>
<li><a href=""><code>6223062</code></a> release 46.0.0 (<a href="">#13446</a>)</li>
<li>Additional commits viewable in <a href="https://github.com/pyca/cryptography/compare/45.0.7...46.0.5">compare view</a></li>
</ul>
</details>
<br />

[![Dependabot compatibility score](https://dependabot-badges.githubapp.com/badges/compatibility_score?dependency-name=cryptography&package-manager=uv&previous-version=45.0.7&new-version=46.0.5)](https://docs.github.com/en/github/managing-security-vulnerabilities/about-dependabot-security-updates#about-compatibility-scores)

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
You can disable automated security fix PRs for this repo from the [Security Alerts page](https://github.com/bids-standard/bids-website/network/alerts).

</details>

<!-- readthedocs-preview bids-website start -->
----
📚 Documentation preview 📚: https://bids-website--795.org.readthedocs.build/en/795/

<!-- readthedocs-preview bids-website end -->

## Task

Modify the repository so that the issue described above is resolved. The repository is checked out at base commit `7655be9b58b6`. Edit files in place; the verifier captures your changes via `git diff` and scores them against an oracle patch using SWE-RL-style diff-similarity reward.